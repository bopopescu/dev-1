//
//  PMViewController.m
//  PortManteau
//
//  Created by Samuel Svenningsen on 9/7/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import "PMViewController.h"

@interface PMViewController ()
@property (strong, nonatomic) IBOutlet UITextField *word1;
@property (strong, nonatomic) IBOutlet UITextField *word2;
@property (strong, nonatomic) IBOutlet UILabel *portmanteau;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) NSMutableDictionary *portmanteauDictionary;
@property (strong, nonatomic) NSMutableArray *portmanteaus;
@property (strong, nonatomic) IBOutlet UITextField *keyPort;



@end

@implementation PMViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.portmanteaus = [[NSMutableArray alloc] init];
    self.portmanteauDictionary = [[NSMutableDictionary alloc] init];
    
    
}
- (IBAction)combinePressed:(id)sender {
    NSString *portman = [self.word1.text stringByAppendingString:self.word2.text];
    self.portmanteau.text = portman;
    NSMutableArray *wordArray = [[NSMutableArray alloc] init];
    [wordArray addObject:self.word1.text];
    [wordArray addObject:self.word2.text];
    [self.portmanteaus addObject:portman];
    NSLog(@"List of portmanteaus: \n%@",self.portmanteaus);
    [self.portmanteauDictionary setObject: wordArray forKey:portman];
    NSLog(@"Portmanteau Dictionary: \n%@",self.portmanteauDictionary);
    
}
- (IBAction)showPiecesPressed:(id)sender {
    NSString *portword = self.keyPort.text;
    NSMutableArray *portWords = [[NSMutableArray alloc] init];
    [portWords addObjectsFromArray:[self.portmanteauDictionary objectForKey:portword]];
    
    self.label1.text = [portWords objectAtIndex:0];
    self.label2.text = [portWords objectAtIndex: 1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
