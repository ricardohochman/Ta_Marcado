//
//  MapaPoint.h
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Mapkit/MKAnnotation.h>

@interface MapaPoint : NSObject <MKAnnotation>

-(id) initWithCoordinate:(CLLocationCoordinate2D)c nome:(NSString *)n end:(NSString *)e;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *nome;
@property (nonatomic, copy) NSString *endereco;

-(void) adicionarPin:(MKMapView *)mapa;

@end
