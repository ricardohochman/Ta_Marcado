//
//  TableViewController.h
//  Ta_Marcado
//
//  Created by Vivian Chiodo Dias on 03/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *enderecos;
    NSMutableArray *locais;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *enderecos;
@property NSMutableArray *locais;
- (IBAction)voltar:(id)sender;

@end
