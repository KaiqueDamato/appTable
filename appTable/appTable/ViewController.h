//
//  ViewController.h
//  appTable
//
//  Created by Kaique Damato on 2/25/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ViewController : UIViewController

@property Item *item;
@property (weak, nonatomic) IBOutlet UILabel *nomeApp;
@property (weak, nonatomic) IBOutlet UIImageView *imagemApp;
- (IBAction)botaoVoltar:(id)sender;


@end

