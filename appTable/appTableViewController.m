//
//  appTableViewController.m
//  appTable
//
//  Created by Kaique Damato on 2/25/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "appTableViewController.h"
#import "AppList.h"
#import "ViewController.h"

@interface appTableViewController ()

@end

@implementation appTableViewController {
    AppList *lista;
    Item *item;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    lista = [AppList sharedInstance];
//    self.tableView.rowHeight = 44;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [lista sections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [lista.itens[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSIndexPath *indexPath;
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    headerView.text = [[lista.itens[section][indexPath.row] categoria] lowercaseString];
    headerView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [lista.itens[indexPath.section][indexPath.row] nome];
    cell.detailTextLabel.text = [lista.itens[indexPath.section][indexPath.row] categoria];
    cell.imageView.image = [UIImage imageNamed:[lista.itens[indexPath.section][indexPath.row] imagem]];
    if (!cell.imageView.image) {
        
        UIImage *newImage = [UIImage imageWithContentsOfFile:[lista.itens[indexPath.section][indexPath.row] imagem]];
        cell.imageView.image = newImage;
    }
    cell.imageView.layer.cornerRadius = 5;
    cell.imageView.clipsToBounds = YES;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [lista.itens removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (IBAction)editar:(id)sender {
    if ([self tableView].editing) {
        [[self tableView]setEditing:false ];
    }else {
        [[self tableView] setEditing:true];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Item *t = [lista.itens objectAtIndex:[sourceIndexPath row]];
    [lista.itens removeObjectAtIndex:sourceIndexPath.row];
    [lista.itens insertObject:t atIndex:destinationIndexPath.row]; 
}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showAppDetails"]) {
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        ViewController *appVC = (ViewController *)[segue destinationViewController];
        appVC.item = [lista.itens objectAtIndex:ip.row];
    }
}



@end
