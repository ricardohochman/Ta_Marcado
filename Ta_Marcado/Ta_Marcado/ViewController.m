//
//  ViewController.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "ViewController.h"
#import "MapaPoint.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager, mapa;
- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    mapa.userTrackingMode = true;
    
    
    MKCoordinateRegion coord1 = {{0.0, 0.0},{0.0, 0.0}};
    coord1.center.latitude = -23.5376830;
    coord1.center.longitude = -46.6546540;
    
    MapaPoint *mp1 = [[MapaPoint alloc] initWithCoordinate:coord1.center title:@"Teste 1" end:@"avenida Teste 1"];
    
    MKCoordinateRegion coord2 = {{0.0, 0.0},{0.0, 0.0}};
    coord2.center.latitude = -23.5370830;
    coord2.center.longitude = -46.6546540;
    MapaPoint *mp2 = [[MapaPoint alloc] initWithCoordinate:coord2.center title:@"Teste 2" end:@"avenida Teste 2"];
    
    //MapaPoint *mp1 = [[MapaPoint alloc] init];
    [mapa addAnnotation:mp1];
    [mapa addAnnotation:mp2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)marcar:(id)sender {
    
}

- (IBAction)localizacaoAtual:(id)sender {
//    CLLocationCoordinate2D loc = [[_locations lastObject]coordinate];
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
//    [mapa setRegion:region animated:YES];
//    [mapa setZoomEnabled:YES];
    [locationManager startUpdatingLocation];
    mapa.userTrackingMode = true;
    
}

- (IBAction)tipoMapa:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapa.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            mapa.mapType = MKMapTypeHybrid;
            break;
       
        case 2:
            mapa.mapType = MKMapTypeSatellite;
            break;
            
        default:
            break;
    }

}
- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations
{
    _locations = locations;
}


@end
