//
//  EditViewController.m
//  appTable
//
//  Created by Kaique Damato on 2/26/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "EditViewController.h"
#import "AppList.h"

@interface EditViewController ()

@end

@implementation EditViewController {
    AppList *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    list = [[AppList alloc]init];
    _nome.text = _item.nome;
    _categoria.text = _item.categoria;
    _imagem.image = [UIImage imageNamed:_item.imagem];
    _descricao.text = _item.descricao;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)salvar:(UIButton *)sender {
    if (![_nome.text isEqualToString:@""] && ![_categoria.text isEqualToString:@""] && ![_descricao.text isEqualToString:@""]) {
        _item.nome = _nome.text;
        _item.descricao = _descricao.text;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Preencha os campos" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
