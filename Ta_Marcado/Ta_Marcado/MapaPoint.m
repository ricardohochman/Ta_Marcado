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

//-(MKAnnotationView *)annotationView{
//    MKAnnotationView *av = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyCustomAnnotation"];
//    
//    av.enabled = YES;
//    av.canShowCallout = YES;
//    av.image = [UIImage imageNamed:@"pin.png"];
//    av.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    
//    return av;
//}



-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    self.coordinate = newCoordinate;
    
    CLGeocoder *geo = [[CLGeocoder alloc]init];
    CLLocation *aux = [[CLLocation alloc]initWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    [self setEndereco:@"buscando..."];
    [geo reverseGeocodeLocation:aux completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error==nil) {
            CLPlacemark *placemark = [placemarks lastObject];
            [self setEndereco:placemark.subThoroughfare];
        } else {
            [self setEndereco:@"Não encontrado"];
        }
    }];
}

@end
