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

@interface LocaisSingleton : NSObject

@property NSMutableArray *locais;
@property MapaPoint *novoLocal;
@property int i;
@property long linha;


+(LocaisSingleton *)instance;
-(void)addLocal:(MapaPoint *)mp;
-(void)removeLocal:(MapaPoint *)mp;

@end
