//
//  Item.m
//  appTable
//
//  Created by Mariana Alvarez on 26/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithNome:(NSString *)n eCategoria:(NSString *)c eImagem:(NSString *)i eDescricao:(NSString *)descricao {
    self = [super init];
    if (self) {
        _nome = n;
        _categoria = c;
        _imagem = i;
        _descricao = descricao;
    }
    return self;
}

@end
