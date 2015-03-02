//
//  ViewController.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "ViewController.h"

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
