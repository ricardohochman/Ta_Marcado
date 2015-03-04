//
//  PopupViewController.m
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 03/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "PopupViewController.h"
#import "ViewController.h"
#import "Singleton.h"


@implementation PopupViewController
@synthesize mpoint;

- (IBAction)salvar:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:Nil];
    ViewController *vc = [[ViewController alloc]init];
    Singleton *s = [Singleton instance];
    s.nome = _caixaTexto.text;
    
    NSLog(@"pontolocal: %@", s.nome);
    MapaPoint *mpoint = [[MapaPoint alloc] initWithCoordinate:s.pontolocal.coordinate title:s.nome end:@"ola"];
    s.mpoint = mpoint;
    //[vc marcarMapa:mpoint];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
