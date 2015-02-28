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
    [lista addObjects];
//    self.tableView.rowHeight = 44;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
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
    Item *t = lista.itens[indexPath.section][indexPath.row];
    
    cell.textLabel.text = t.nome;
    cell.detailTextLabel.text = t.categoria;
    cell.imageView.image = [UIImage imageNamed:t.imagem];
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
        [lista.itens[indexPath.section] removeObjectAtIndex:indexPath.row];
        if ([lista.itens[indexPath.section] count] == 0) {
            [lista.itens removeObjectAtIndex:indexPath.section];
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        [tableView reloadData];
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
    [lista moveRows:sourceIndexPath toIndexPath:destinationIndexPath];
    [self.tableView reloadData];
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
        appVC.item = [lista.itens[ip.section] objectAtIndex:ip.row];
    }
}



@end
