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
@synthesize locationManager, mapa, selected, selectedCell;

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
    [mapa removeAnnotations:mapa.annotations];
    [mapa addAnnotations:s.locais];
    if (s.novoLocal) {
        [s.novoLocal adicionarPin:mapa];
        s.novoLocal = nil;
    }
    
    
    if (s.linha > -1) {
        MapaPoint *mp = [s.locais objectAtIndex:s.linha];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mp.coordinate, 500, 500);
        [mapa setRegion:region animated:YES];
        s.linha = -1;
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
