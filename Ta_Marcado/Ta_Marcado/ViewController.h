//
//  ViewController.h
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
- (IBAction)marcar:(id)sender;
- (IBAction)localizacaoAtual:(id)sender;
- (IBAction)tipoMapa:(id)sender;


@end

