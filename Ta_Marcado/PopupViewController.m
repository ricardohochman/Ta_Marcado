//
//  PopupViewController.m
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 03/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "PopupViewController.h"

@implementation PopupViewController

-(void)viewDidLoad {
    [self.view setBackgroundColor: [UIColor clearColor]];
}
- (IBAction)salvar:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:Nil];
    
    
    _nome = _caixaTexto.text;
    [[NSUserDefaults standardUserDefaults] setObject:_nome forKey:@"nomePin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.view removeFromSuperview];
    
}


@end
