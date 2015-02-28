//
//  EditViewController.h
//  appTable
//
//  Created by Kaique Damato on 2/26/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//  teste

#import <UIKit/UIKit.h>
#import "Item.h"

@interface EditViewController : UIViewController

@property Item *item;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UILabel *categoria;
@property (weak, nonatomic) IBOutlet UITextView *descricao;

- (IBAction)salvar:(id)sender;

@end
