//
//  MapaPoint.m
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
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

-(MKAnnotationView *)annotationView{
    MKAnnotationView *av = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustomAnnotation"];
    
    av.enabled = YES;
    av.canShowCallout = YES;
    av.image = [UIImage imageNamed:@"pin.png"];
    av.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return av;
}

@end
