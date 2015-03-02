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
@synthesize locationManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager=[[CLLocationManager alloc]init];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    _mapa.showsUserLocation=YES;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)marcar:(id)sender {
}

- (IBAction)localizacaoAtual:(id)sender {
    [locationManager startUpdatingLocation];
    CLLocationCoordinate2D loc =[[_locations lastObject]coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    _mapa.userTrackingMode = true;
    [_mapa setRegion:region animated:YES];
    [_mapa setZoomEnabled:YES];
    

}

- (IBAction)tipoMapa:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapa.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            _mapa.mapType = MKMapTypeHybrid;
            break;
       
        case 2:
            _mapa.mapType = MKMapTypeSatellite;
            break;
            
        default:
            break;
    }

}
- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations
{
    //Encontrar as coordenadas de localização atual
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    
    //Determinar região com as coordenadas de localização atual e os limites N/S e L/O no zoom em metros
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    
    //Mudar a região atual para visualização de forma animada
    [_mapa setRegion:region animated:YES ];
    
    
}


@end
