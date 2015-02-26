//
//  AppList.m
//  appTable
//
//  Created by Mariana Alvarez on 25/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "AppList.h"
#import <UIKit/UIKit.h>
#import "Item.h"

@implementation AppList

-(instancetype)init {
    self = [super init];
    if (self) {
        _itens = [[NSMutableArray alloc] init];
        [self addObjects];
    }
    return self;
}

+(instancetype)sharedInstance {
    
    static dispatch_once_t onceToken = 0;
    
    __strong static AppList *instance = nil;
    
    dispatch_once(&onceToken,^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

-(void)addObjects {
    Item *item1 = [[Item alloc]initWithNome:@"iMimic" eCategoria:@"Jogos" eImagem:@"imimic"];
    Item *item2 = [[Item alloc]initWithNome:@"Instagram" eCategoria:@"Fotografia" eImagem:@"instagram"];
    Item *item3 = [[Item alloc]initWithNome:@"PhotoScape" eCategoria:@"Fotografia" eImagem:@"photoscape"];
    Item *item4 = [[Item alloc]initWithNome:@"Duolingo" eCategoria:@"Educaçao" eImagem:@"duolingo"];
    
    [_itens addObject:item1];
    [_itens addObject:item2];
    [_itens addObject:item3];
    [_itens addObject:item4];
}

@end
