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
@synthesize caixaTexto;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.caixaTexto performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0];
}

- (IBAction)salvar:(id)sender {
    LocaisSingleton *s = [LocaisSingleton instance];
    if ([caixaTexto.text  isEqual: @""]) {
        NSString *localSemNome = [NSString stringWithFormat: @"Local %i", s.i ];
        [s.novoLocal setNome:localSemNome];
        s.i++;
    }
    else
        [s.novoLocal setNome:caixaTexto.text];
    
        [s addLocal:s.novoLocal];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
