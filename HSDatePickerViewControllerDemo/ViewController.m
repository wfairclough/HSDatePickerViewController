//
//  ViewController.m
//
//  Created by Kamil Powałowski on 10.01.2015.
//  Copyright (c) 2015 Hydra Softworks.
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "ViewController.h"
#import "HSDatePickerViewController.h"

@interface ViewController () <HSDatePickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) NSDate *selectedDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDatePicker:(id)sender {
    HSDatePickerViewController *hsdpvc = [HSDatePickerViewController new];
    hsdpvc.delegate = self;
    if (self.selectedDate) {
        hsdpvc.date = self.selectedDate;
    }
    [hsdpvc setTag:@"StartDate"];
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

#pragma mark - HSDatePickerViewControllerDelegate
- (void)hsDatePickerPickedDate:(NSDate *)date tag:(NSString *)tag {
    NSLog(@"Date picked %@   with tag: %@", date, tag);
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = @"yyyy.MM.dd HH:mm:ss";
    self.dateLabel.text = [dateFormater stringFromDate:date];
    
    self.selectedDate = date;
}

//optional
- (void)hsDatePickerWillCancel {
    NSLog(@"Picker did cancel");
}

@end
