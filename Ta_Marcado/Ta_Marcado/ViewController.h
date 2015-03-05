//
//  ViewController.h
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKAnnotation.h>
#import "MapaPoint.h"

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
