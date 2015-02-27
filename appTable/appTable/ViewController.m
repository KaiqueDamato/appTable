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
    AppList *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    list = [[AppList alloc] init];
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

@end
