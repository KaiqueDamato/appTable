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

@interface AddCellViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@end

@implementation AddCellViewController {
    AppList *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    list = [AppList sharedInstance];
    _descriptionTextView.layer.borderColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1].CGColor;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchUpView)];
    [self.view addGestureRecognizer:tap];
    _descriptionTextView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.2 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y-200);
    }];
}

- (IBAction)selectImage:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    sender.hidden = YES;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    self.view.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+200);
    return YES;
}

- (void)didTouchUpView {
    if ([_nomeTextField isFirstResponder]) {
        [_nomeTextField resignFirstResponder];
    }else if ([_categoriaTextField isFirstResponder]) {
        [_categoriaTextField resignFirstResponder];
    }else if ([_descriptionTextView isFirstResponder]) {
        [_descriptionTextView resignFirstResponder];
    }
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
        Item *t = [[Item alloc] initWithNome:_nomeTextField.text eCategoria:[_categoriaTextField.text uppercaseString] eImagem:[self saveImage:_image.image] eDescricao:_descriptionTextView.text];
        [list.itens addObject:t];
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

- (NSString *)saveImage: (UIImage*)image {
    NSString *path;
    if (image != nil)
    {
        path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES)[0];
        path = [path stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"%@.png",
                           _nomeTextField.text]];
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
    return path;
}

- (IBAction)cancelarAdd:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
