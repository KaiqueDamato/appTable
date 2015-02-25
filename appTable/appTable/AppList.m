//
//  AppList.m
//  appTable
//
//  Created by Mariana Alvarez on 25/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "AppList.h"
#import <UIKit/UIKit.h>

@implementation AppList


-(instancetype)init {
    self = [super init];
    if (self) {
        _app = [[NSMutableArray alloc] init];
        _nome = [[NSMutableArray alloc] init];
        _categoria = [[NSMutableArray alloc] init];
        [self cadastraApps];
    }
    return self;
}

-(void)cadastraApps {
    
    [_app addObject:@"netflix"];
    [_nome addObject:@"Netflix "];
    [_categoria addObject:@"Entretenimento"];
    
    [_app addObject:@"2048"];
    [_nome addObject:@"2048"];
    [_categoria addObject:@"Jogos"];
    
    [_app addObject:@"imimic"];
    [_nome addObject:@"iMimic"];
    [_categoria addObject:@"Jogos"];
    
    [_app addObject:@"duolingo"];
    [_nome addObject:@"Duolingo"];
    [_categoria addObject:@"Educacão"];
    
    [_app addObject:@"itranslate"];
    [_nome addObject:@"iTranslate"];
    [_categoria addObject:@"Educacão"];
    
    [_app addObject:@"instagram"];
    [_nome addObject:@"Instagram"];
    [_categoria addObject:@"Fotografia"];
    
    [_app addObject:@"vscocam"];
    [_nome addObject:@"VSCOcam"];
    [_categoria addObject:@"Fotografia"];
    
    [_app addObject:@"photoscape"];
    [_nome addObject:@"PhotoScape"];
    [_categoria addObject:@"Fotografia"];
    
    
}

@end
