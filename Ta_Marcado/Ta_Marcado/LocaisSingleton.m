//
//  Singleton.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "LocaisSingleton.h"

@implementation LocaisSingleton
//@synthesize pontos,locais,enderecos, nome, pontolocal, mpoint, subTitulo;
@synthesize locais;

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
//        enderecos = [[NSMutableArray alloc]init];
//        pontos = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(void)addLocal:(MapaPoint *)mp{
    [locais addObject:mp.nome];
//    [enderecos addObject:mp.endereco];
}
@end