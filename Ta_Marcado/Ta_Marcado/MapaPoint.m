//
//  MapaPoint.m
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "MapaPoint.h"

@implementation MapaPoint
@synthesize coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t end:(NSString *)e{
    self = [super init];
    if(self){
        coordinate = c;
        [self setTitle:t];
         subtitle = e;
        ;
    }
    return self;
}

-(id) init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(-23.5376830, -46.6546540) title:@"" end:@""];
}

@end
