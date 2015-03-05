//
//  Singleton.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
@synthesize pontos,locais,enderecos, nome, pontolocal, mpoint, subTitulo;

static Singleton *instancia = nil;

+(Singleton *)instance{
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
        enderecos = [[NSMutableArray alloc]init];
        pontos = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(void)addLocal:(MapaPoint *)mp{
    [locais addObject:mp.title];
    [enderecos addObject:mp.subtitle];
}
@end