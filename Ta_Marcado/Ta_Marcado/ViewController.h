//
//  ViewController.h
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKAnnotation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (retain) CLLocationManager *locationManager;
@property NSArray *locations;
@property NSMutableArray *pontos;

- (IBAction)marcar:(id)sender;
- (IBAction)localizacaoAtual:(id)sender;
- (IBAction)tipoMapa:(id)sender;

@end
