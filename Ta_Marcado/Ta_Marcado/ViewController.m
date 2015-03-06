//
//  ViewController.m
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "ViewController.h"
#import "MapaPoint.h"
#import "PopupViewController.h"
#import "LocaisSingleton.h"

@interface ViewController ()
{
    NSArray *locations;
    MapaPoint *mp;
    LocaisSingleton *s;
}

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
    s = [LocaisSingleton instance];
    
//    
//    MKCoordinateRegion coord1 = {{0.0, 0.0},{0.0, 0.0}};
//    coord1.center.latitude = -23.5376830;
//    coord1.center.longitude = -46.6546540;
//    
//    MapaPoint *mp1 = [[MapaPoint alloc] initWithCoordinate:coord1.center title:@"Teste 1" end:@"avenida Teste 1"];
//    
//    MKCoordinateRegion coord2 = {{0.0, 0.0},{0.0, 0.0}};
//    coord2.center.latitude = -23.5370830;
//    coord2.center.longitude = -46.6546540;
//    MapaPoint *mp2 = [[MapaPoint alloc] initWithCoordinate:coord2.center title:@"Teste 2" end:@"avenida Teste 2"];
//    [mapa addAnnotation:mp1];
//    [mapa addAnnotation:mp2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)marcar:(id)sender {
    [locationManager startUpdatingLocation];
    mapa.userTrackingMode = true;
    s.novoLocal = [[MapaPoint alloc] initWithCoordinate:[[locations lastObject] coordinate] nome:@"" end:@"buscando!"];
}


-(void) viewDidAppear:(BOOL)animated{
    if (s.novoLocal) {
        [s.novoLocal adicionarPin:mapa];
        s.novoLocal = nil;
    }
}


- (IBAction)localizacaoAtual:(id)sender {
    [locationManager startUpdatingLocation];
    mapa.userTrackingMode = true;
    [mapa setRegion:MKCoordinateRegionMake(mapa.userLocation.coordinate, MKCoordinateSpanMake(0.01f, 0.01f)) animated:YES];
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


- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)newLocations
{
    locations = newLocations;
}


@end
