//
//  Singleton.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "LocaisSingleton.h"

@implementation LocaisSingleton
@synthesize locais, i, linha;

static LocaisSingleton *instancia = nil;

+(LocaisSingleton *)instance{
    if(!instancia)
    {
        instancia = [[super alloc]init];
    }
    return instancia;
}
-(instancetype) init {
    self = [super init];
    if (self) {
        locais = [[NSMutableArray alloc]init];
        i = 1;
        linha = -1;
    }
    return self;
}

-(void)addLocal:(MapaPoint *)mp{
    [locais addObject:mp];
}

-(void)removeLocal:(MapaPoint *)mp {
    [locais removeObject:mp];
}
@end