//
//  Singleton.h
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapaPoint.h"

@interface Singleton : NSObject{
    
}
@property NSMutableArray *pontos;
@property NSMutableArray *enderecos;
@property NSMutableArray *locais;
@property NSString *nome;
@property NSString *subTitulo;
@property MKPointAnnotation *pontolocal;
@property MapaPoint *mpoint;


+(Singleton *)instance;
-(void)addLocal:(MapaPoint *)mp;

@end
