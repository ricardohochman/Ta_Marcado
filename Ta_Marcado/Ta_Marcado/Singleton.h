//
//  Singleton.h
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property NSMutableArray *pontos;

+(Singleton *)init;

@end
