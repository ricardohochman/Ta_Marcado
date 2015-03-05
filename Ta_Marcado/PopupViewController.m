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

- (IBAction)salvar:(id)sender {
    LocaisSingleton *s = [LocaisSingleton instance];
    [s.novoLocal setNome:_caixaTexto.text];
    [s addLocal:s.novoLocal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
