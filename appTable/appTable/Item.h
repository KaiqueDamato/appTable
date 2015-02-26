//
//  Item.h
//  appTable
//
//  Created by Mariana Alvarez on 26/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSString *imagem;
@property NSString *nome;
@property NSString *categoria;

-(instancetype)initWithNome:(NSString *)n eCategoria:(NSString *)c eImagem:(NSString *)i;

@end
