//
//  TableViewController.h
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 03/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    Singleton *s;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property Singleton *s;
- (IBAction)voltar:(id)sender;

@end
