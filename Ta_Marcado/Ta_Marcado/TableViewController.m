//
//  TableViewController.m
//  Ta_Marcado
//
//  Created by Ricardo Hochman on 02/03/15.
//  Copyright (c) 2015 Ricardo Hochman. All rights reserved.
//

#import "TableViewController.h"
#import "CellViewController.h"
#import "ViewController.h"

@implementation TableViewController
@synthesize enderecos, locais, tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView.delegate = self;
    tableView.dataSource = self;
    [locais addObjectsFromArray:@[@"Casa da Vivi", @"Casa do Ricardo"]];
    [enderecos addObjectsFromArray:@[@"Rua Indiana", @"Avenida Angelica"]];
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return locais.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellViewController *cell = [tableView dequeueReusableCellWithIdentifier:@"listaEnd" forIndexPath:indexPath];
    
    long row = [indexPath row];
    cell.nome.text = [locais objectAtIndex:row];
    cell.rua.text = [enderecos objectAtIndex:row];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if([segue.identifier isEqualToString:@"marcados"]){
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ViewController *appView = segue.destinationViewController;
//        long row = [indexPath row];
//        NSArray *aux = [NSArray arrayWithObjects:[nomesApp objectAtIndex:row], [categoriaApp objectAtIndex:row], [imgApp objectAtIndex:row], nil];
//        appView.dados = aux;
//    }
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
//}


@end
