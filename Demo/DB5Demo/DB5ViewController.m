//
//  DB5ViewController.m
//  DB5Demo
//
//  Created by Brent Simmons on 6/26/13.
//  Copyright (c) 2013 Q Branch LLC. All rights reserved.
//

#import "DB5ViewController.h"
#import "VSTheme.h"


@interface DB5ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) VSTheme *theme;

@end


@implementation DB5ViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil theme:(VSTheme *)theme {

	self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self == nil)
		return nil;

	_theme = theme;

	return self;
}


- (void)viewDidLoad {

	self.view.backgroundColor = [self.theme colorForKey:@"backgroundColor"];
	self.label.textColor = [self.theme colorForKey:@"labelTextColor"];
	self.label.font = [self.theme fontForKey:@"labelFont"];

	[self.theme animateWithAnimationSpecifierKey:@"labelAnimation" animations:^{

		CGRect rLabel = self.label.frame;
		rLabel.origin = [self.theme pointForKey:@"label"];

		self.label.frame = rLabel;
		
	} completion:^(BOOL finished) {
		NSLog(@"Ran an animation.");
	}];
}



@end
