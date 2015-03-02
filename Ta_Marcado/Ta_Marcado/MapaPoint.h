//
//  MapaPoint.h
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Mapkit/MKAnnotation.h>

@interface MapaPoint : MKAnnotationView <MKAnnotation>

-(id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t end:(NSString *)e;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end
