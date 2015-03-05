//
//  MapaPoint.m
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "MapaPoint.h"

@implementation MapaPoint
@synthesize coordinate, nome, endereco;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c nome:(NSString *)n end:(NSString *)e{
    self = [super init];
    if(self){
        coordinate = c;
        nome = n;
        endereco = e;
    }
    return self;
}


-(NSString *)title {
    return self.nome;
}

-(NSString *)subtitle {
    return self.endereco;
}


-(void) adicionarPin:(MKMapView *)mapa {
    CLGeocoder *geo = [[CLGeocoder alloc]init];
    CLLocation *aux = [[CLLocation alloc]initWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    [geo reverseGeocodeLocation:aux completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error==nil) {
            CLPlacemark *placemark = [placemarks lastObject];
            NSString *newString = [placemark.thoroughfare stringByAppendingString:@", "];
            NSString *newnewString = [newString stringByAppendingString:placemark.subThoroughfare];
            [self setEndereco: newnewString];
            
        } else {
            [self setEndereco:@"Não encontrado"];
        }
        [mapa addAnnotation:self];
    }];
}

@end
