//
//  TableViewController.m
//  Ta_Marcado
//
//  Created by Bruno Faganello, Ricardo Hochman, Vivian Chiodo on 02/03/15.
//  Copyright (c) 2015 Bruno Faganello, Ricardo Hochman, Vivian Chiodo. All rights reserved.
//

#import "TableViewController.h"
#import "CellViewController.h"
#import "ViewController.h"


@implementation TableViewController
@synthesize tableView,s;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    s = [LocaisSingleton instance];
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
//    s.locais = @[@"Casa da Vivi", @"Casa do Ricardo"];
//    s.enderecos = @[@"Rua Indiana", @"Avenida Angelica"];
    //self.tableView.contentInset = UIEdgeInsetsMake(40.0f, 0.0f, 0.0f, 0.0);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return s.locais.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellViewController *cell = [tableView dequeueReusableCellWithIdentifier:@"listaEnd" forIndexPath:indexPath];
    
    long row = [indexPath row];
    MapaPoint *mp = [s.locais objectAtIndex:row];
    cell.nome.text = [[s.locais objectAtIndex:row] nome];
    cell.rua.text = [[s.locais objectAtIndex:row] endereco];
    return cell;
}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 


 // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [s removeLocal:[s.locais objectAtIndex:[indexPath row]]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
 }



 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//     NSString *item = [s.locais objectAtIndex:[fromIndexPath row]];
//     [s.locais removeObject:item];
//     [s.locais insertObject:item atIndex:toIndexPath.row];
//     [item release];
     
 }
 


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"marcados"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewController *vc = segue.destinationViewController;
        long row = [indexPath row];
        vc.selectedCell = row;
        vc.selected = YES;

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{;
    long row = [indexPath row];
    s.linha = row;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
