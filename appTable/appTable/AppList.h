//
//  AppList.h
//  appTable
//
//  Created by Mariana Alvarez on 25/02/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppList : NSObject

@property NSMutableArray *itens;

-(void)addObjects;
+ (AppList *)sharedInstance;
- (NSInteger)sections;
@end
