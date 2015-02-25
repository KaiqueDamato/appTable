//
//  AppList.m
//  appTable
//
//  Created by Mariana Alvarez on 25/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "AppList.h"

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
    
    [_app addObject:@"@"];
    [_nome addObject:@"@Quiz"];
    [_categoria addObject:@"@Entretenimento"];
    
    [_app addObject:@"@netflix.jpg"];
    [_nome addObject:@"Netflix@"];
    [_categoria addObject:@"@Entretenimento"];
    
    [_app addObject:@"@"];
    [_nome addObject:@"@Contador"];
    [_categoria addObject:@"@Jogos"];
    
    [_app addObject:@"@2048.jpg"];
    [_nome addObject:@"@2048"];
    [_categoria addObject:@"@Jogos"];
    
    [_app addObject:@"@imimic.jpg"];
    [_nome addObject:@"@iMimic"];
    [_categoria addObject:@"@Jogos"];
    
    [_app addObject:@"@duolingo.jpg"];
    [_nome addObject:@"@Duolingo"];
    [_categoria addObject:@"@Educacão"];
    
    [_app addObject:@"@itranslate.jpg"];
    [_nome addObject:@"iTranslate@"];
    [_categoria addObject:@"@Educacão"];
    
    [_app addObject:@"@instagram.jpg"];
    [_nome addObject:@"Instagram@"];
    [_categoria addObject:@"@Fotografia"];
    
    [_app addObject:@"@vscocam.jpg"];
    [_nome addObject:@"@VSCOcam"];
    [_categoria addObject:@"@Fotografia"];
    
    [_app addObject:@"@photoscape.jpg"];
    [_nome addObject:@"PhotoScape@"];
    [_categoria addObject:@"@Fotografia"];
    
    
}

@end
