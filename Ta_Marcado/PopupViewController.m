//
//  PopupViewController.m
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 03/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "PopupViewController.h"
#import "ViewController.h"
#import "LocaisSingleton.h"



@implementation PopupViewController
//@synthesize mpoint;

- (IBAction)salvar:(id)sender {
    LocaisSingleton *s = [LocaisSingleton instance];
//    s.nome = _caixaTexto.text;
    [s.novoLocal setNome:_caixaTexto.text];
    [s addLocal:s.novoLocal];
    
//    
//    NSLog(@"pontolocal: %@", s.nome);
//    
//    CLGeocoder *geo = [[CLGeocoder alloc]init];
//    CLLocation *aux = [[CLLocation alloc]initWithLatitude:s.pontolocal.coordinate.latitude longitude:s.pontolocal.coordinate.longitude];
//    [geo reverseGeocodeLocation:aux completionHandler:^(NSArray *placemarks, NSError *error) {
//        if (error==nil) {
//            CLPlacemark *placemark = [placemarks lastObject];
//            s.subTitulo = placemark.subThoroughfare;
//            
//            NSLog(@"end: %@", s.subTitulo);
//            MapaPoint *mpoint = [[MapaPoint alloc] initWithCoordinate:s.pontolocal.coordinate title:s.nome end:s.subTitulo];
//            s.mpoint = mpoint;
//            [s addLocal:mpoint];
//
//        }
//    }];
//    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
