//
//  ViewController.m
//  appTable
//
//  Created by Kaique Damato on 2/25/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "ViewController.h"
#import "AppList.h"

@interface ViewController ()

@end

@implementation ViewController{
    AppList *lista;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    lista = [[AppList alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSIndexPath *indexPath = [[NSIndexPath alloc] init];
    _nomeApp.text = _item.nome;
    _descricao.text = _item.categoria;
    _imagemApp.image = [UIImage imageNamed:_item.imagem];
    _descricaoApp.text = _item.descricao;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showEdit"]) {
        ViewController *appVC = (ViewController *)[segue destinationViewController];
        appVC.item = _item;
    }
}
@end
