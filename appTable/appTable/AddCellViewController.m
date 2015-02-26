//
//  AddCellViewController.m
//  appTable
//
//  Created by Kaique Damato on 2/26/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "AddCellViewController.h"
#import "Item.h"
#import "AppList.h"

@interface AddCellViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation AddCellViewController {
    AppList *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    list = [AppList sharedInstance];
    _descriptionTextView.layer.borderColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImage:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    sender.hidden = YES;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.image.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)confirma:(UIButton *)sender {
    if (![_nomeTextField.text isEqualToString:@""] && ![_categoriaTextField.text isEqualToString:@""] && ![_descriptionTextView.text isEqualToString:@""] && _image.image) {
        Item *t = [[Item alloc] initWithNome:_nomeTextField.text eCategoria:_categoriaTextField.text eImagem:[self saveImage:_image.image] eDescricao:_descriptionTextView.text];
        [list.itens addObject:t];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)saveImage: (UIImage*)image {
    NSString *path;
    if (image != nil)
    {
        path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES)[0];
        path = [path stringByAppendingString:
                          [NSString stringWithFormat:@"%@.png",
                           _nomeTextField.text]];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    return path;
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
