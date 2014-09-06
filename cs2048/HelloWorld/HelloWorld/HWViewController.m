//
//  HWViewController.m
//  HelloWorld
//
//  Created by Samuel Svenningsen on 9/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()
@property (strong, nonatomic) IBOutlet UILabel *myAwesomeLabel;
@property (assign, nonatomic) int myCounter;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (assign, nonatomic) NSMutableArray *myTestArray;
@property (assign,nonatomic) NSMutableArray *validPasswords;
@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.validPasswords = @[@"eggs", @"milk", @"eggs"];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.myAwesomeLabel.text = @"Goat";
//    NSLog(@"Hello Console!");
//    
//    int myInteger = 5;
//    self.myCounter = 0;
//    NSLog(@"My integer is: %d", myInteger);
//    
//    if (myInteger == 5){
//        NSLog(@"the integers were equal");
//    }
//    else{
//        NSLog(@"the integers were not equal");
//    }
//    
//    for (int i = 0; i < myInteger; i++) {
//        NSLog(@"%d", i);
//    }
    
    NSString *sampleString = @"sample";
    NSString *anotherString = [[NSString alloc] init];
    
    NSString *thirdString = [sampleString stringByAppendingString:@" goat"];
    
    NSLog(@"%@",thirdString);
    
    NSArray *myArray = [[NSArray alloc] initWithObjects:@"cat", @"dog", @"spacegoat",nil];
    
    NSLog(@"My array is: \n %@", myArray);
    
    NSMutableArray *myFirstMutableArray = [ [NSMutableArray alloc] init]; // initWithCapacity(number)
    NSLog(@"My mutable array: \n %@", myFirstMutableArray);
    
    [myFirstMutableArray addObject:@"frog"];
    [myFirstMutableArray addObjectsFromArray:myArray];
    NSLog(@"My mutable array: \n %@", myFirstMutableArray);
    
    
    NSArray *literalArray = @[@"dragon",@"unicorn",@"penguin"];
    [myFirstMutableArray addObjectsFromArray:literalArray];
    NSLog(@"My mutable array:\n%@", myFirstMutableArray);
    
    NSMutableArray *mutableFromLiteralArray = [literalArray mutableCopy];
    [mutableFromLiteralArray insertObject:@"spacegoat" atIndex:2];
    NSLog(@"My mutable literal array: \n%@", mutableFromLiteralArray);
    [mutableFromLiteralArray removeObjectAtIndex:3];
    [self.myTestArray addObjectsFromArray:mutableFromLiteralArray];
    
    NSLog(@"My mutable literal array: \n%@", mutableFromLiteralArray);
    
    
    NSMutableDictionary *myMutableDictionary = [[NSMutableDictionary alloc] init];
    [myMutableDictionary setObject:@"dog" forKey:@"my favorite house pet"];
    [myMutableDictionary setObject:@"goat" forKey:@"my favorite farm animal"];
    NSLog(@"my dictionary: \n %@", myMutableDictionary);
    
    NSString *animal = [myMutableDictionary objectForKey:@"my favorite farm animal"];
    NSLog(@"the animal is: %@", animal);
}
- (IBAction)myButtonPressed:(id)sender {
//    self.myCounter++;
    
//    NSLog(@"I've been pressed!");
//    NSString *myString = [NSString stringWithFormat:@"pressed %d",self.myCounter];
//    self.myAwesomeLabel.text = myString;
    BOOL valid = NO;
    for (int i = 0; i < self.myTestArray.count; i++){
        NSString *validEntry = [self.myTestArray objectAtIndex:i];
        NSLog(validEntry);
        if ([self.myTextField.text isEqualToString:validEntry]){
            valid = YES;
        }
    }
    if (valid){
        self.myAwesomeLabel.text = @"Success";
    }
    else{
        self.myAwesomeLabel.text = @"Fail";
    }
      //self.myAwesomeLabel.text = self.myTextField.text;
    
//    NSLog(@"Line1");
//    NSLog(@"Line2");
//    NSLog(@"Line3");

    NSLog(@"My favorite farm animal is: %d", self.myTestArray.count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
