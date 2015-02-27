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
    NSMutableArray *a = [[NSMutableArray alloc] init];
    Item *item1 = [[Item alloc]initWithNome:@"iMimic" eCategoria:@"JOGOS" eImagem:@"imimic" eDescricao:@"Os anos 80 estão de volta! E sua memória será desafiada por este jogo eletrônico estilo retrô. Repita a sequência de sons e luzes tocada por iMimic."];
    [a addObject:item1];
    [_itens addObject:a];
    
    NSMutableArray *a1 = [[NSMutableArray alloc] init];
    Item *item2 = [[Item alloc]initWithNome:@"Instagram" eCategoria:@"FOTOGRAFIA" eImagem:@"instagram" eDescricao:@"O instagram é uma forma simples de capturar e compartilhar os momentos do mundo. Transforme suas fotos e vídeos do dia a dia em obras de arte e compartilhe com sua família e amigos."];
    Item *item3 = [[Item alloc]initWithNome:@"PhotoScape" eCategoria:@"FOTOGRAFIA" eImagem:@"photoscape" eDescricao:@"This is an amazing fully featured photo editor. It doesn't matter if you are a professional or amateur photographer, the app has been built intuitively and responsively just to make it that bit easier for you."];
    [a1 addObject:item2];
    [a1 addObject:item3];
    [_itens addObject:a1];
    
    NSMutableArray *a3 = [[NSMutableArray alloc] init];
    Item *item4 = [[Item alloc]initWithNome:@"Duolingo" eCategoria:@"EDUCACAO" eImagem:@"duolingo" eDescricao:@"Com o duolingo você aprende um idioma totalmente de graça, sem anúncios comerciais ou taxas escondidas. Você se diverte enquanto aprende e avança de níveis como num jogo."];
    [a3 addObject:item4];
    [_itens addObject:a3];
}

- (NSInteger)sections {
    return [_itens count];
}

@end
