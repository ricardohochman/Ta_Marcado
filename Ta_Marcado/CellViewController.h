//
//  CellViewController.h
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellViewController : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *rua;

@end
