//
//  PaymentController.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "PaymentController.h"
#import "ConfirmationController.h"

@interface PaymentController ()

@end

@implementation PaymentController
@synthesize finishButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *TEST_KEY = @"pk_test_nYjyroP50S8sk1CZ3WI4j4fn";
    NSString *LIVE_KEY = @"pk_live_iBALrjzz9ewnL6OyOi3F6QNB";
    NSInteger STRIPE_WIDTH = 290;
    
    self.finishButton.enabled = NO;
    [self.finishButton addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    
    self.stripeView = [[STPView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - (STRIPE_WIDTH / 2), 200, STRIPE_WIDTH, 55)
                                              andKey:TEST_KEY];
    self.stripeView.delegate = self;
    [self.view addSubview:self.stripeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ConfirmationController *dest = [segue destinationViewController];
    dest.lostItem = self.lostItem;
}


/***--- STRIPE PAYMENT STUFF ---***/
- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{
    self.finishButton.enabled = valid;
    
    if (valid) {
        [self.finishButton setBackgroundColor:[UIColor blueColor]];
    } else {
        [self.finishButton setBackgroundColor:[UIColor grayColor]];
    }
}

- (void)handleError:(NSError *)error
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error")
                                                      message:[error localizedDescription]
                                                     delegate:nil
                                            cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                            otherButtonTitles:nil];
    [message show];
}

- (IBAction)save:(id)sender
{
    // Call 'createToken' when the save button is tapped
    [self.stripeView createToken:^(STPToken *token, NSError *error) {
        if (error) {
            // Handle error
            [self handleError:error];
        } else {
            self.lostItem.charge_token = token.tokenId;
        }
    }];
}

@end
