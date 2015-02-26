//
//  Item.m
//  appTable
//
//  Created by Mariana Alvarez on 26/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithNome:(NSString *)n eCategoria:(NSString *)c eImagem:(NSString *)i {
    self = [super init];
    if (self) {
        _nome = n;
        _categoria = c;
        _imagem = i;
    }
    return self;
}

@end
