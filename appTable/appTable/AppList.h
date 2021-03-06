//
//  AppList.h
//  appTable
//
//  Created by Mariana Alvarez on 25/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Item;

@interface AppList : NSObject

@property NSMutableArray *itens;
@property NSMutableArray *categorias;

-(void)addObjects;
+ (AppList *)sharedInstance;
- (NSInteger)sections;
- (void)addItem:(Item *)item;
- (void) moveRows:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end
