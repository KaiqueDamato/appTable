//
//  AddCellViewController.h
//  appTable
//
//  Created by Kaique Damato on 2/26/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface AddCellViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet UITextField *categoriaTextField;

@property (weak, nonatomic) IBOutlet UITextField *nomeTextField;

@end
