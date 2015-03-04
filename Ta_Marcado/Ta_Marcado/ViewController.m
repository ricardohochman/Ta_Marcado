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
#import "Singleton.h"

@interface ViewController () {
    UIViewController *popLocalViewController;
}

@end

@implementation ViewController
@synthesize locationManager, mapa, pontos;
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
    [mapa addAnnotation:mp1];
    [mapa addAnnotation:mp2];
    
    //[self setModalPresentationStyle:UIModalPresentationCurrentContext];
    [ViewController setPresentationStyleForSelfController:self presentingController:self];

}

-(void)viewDidAppear:(BOOL)animated {
    PopupViewController *pop = [[PopupViewController alloc] init];
    NSString *pin = [[NSUserDefaults standardUserDefaults]stringForKey:@"nomePin"];
    NSLog( @"%@",pin );
    
}
-(void)viewDidLoad:(BOOL)animated{
    PopupViewController *pop = [[PopupViewController alloc] init];
    NSString *pin = [[NSUserDefaults standardUserDefaults]stringForKey:@"nomePin"];
    NSLog( @"%@",pin );
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)marcar:(id)sender {
    Singleton *s = [[Singleton alloc]init];
    [locationManager startUpdatingLocation];
    mapa.userTrackingMode = true;
    [mapa setRegion:MKCoordinateRegionMake(mapa.userLocation.coordinate, MKCoordinateSpanMake(0.01f, 0.01f)) animated:YES];
    MKPointAnnotation *pontolocal = [[MKPointAnnotation alloc]init];
    pontolocal.coordinate = [[_locations lastObject]coordinate];
    
    [pontos addObject :pontolocal];
    MapaPoint *mp = [[MapaPoint alloc] initWithCoordinate:pontolocal.coordinate title:[s.pontos objectAtIndex:0] end:@"avenida Teste 2"];
    [mapa addAnnotation:mp];
    
}

+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController {
    presentingController.providesPresentationContextTransitionStyle = YES;
    presentingController.definesPresentationContext = YES;
    
    [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
}



- (IBAction)localizacaoAtual:(id)sender {
//    CLLocationCoordinate2D loc = [[_locations lastObject]coordinate];
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
//    [mapa setRegion:region animated:YES];
//    [mapa setZoomEnabled:YES];
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
- (void)locationManager:(CLLocationManager *)locationManager didUpdateLocations:(NSArray *)locations
{
    _locations = locations;
}


@end
