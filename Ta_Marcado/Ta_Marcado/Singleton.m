//
//  Singleton.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
@synthesize pontos;


+(Singleton *)init{
    static Singleton *instancia = nil;
    if(!instancia)
    {
        instancia = [[super allocWithZone:nil]init];
    }
    return instancia;
}

@end