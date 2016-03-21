//
//  FirstViewController.m
//  todoList
//
//  Created by Victor Wu on 3/14/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import "FirstViewController.h"
#import "WFTaskManager.h"
#import "WFTask.h"
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UIButton *taskPickDate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *taskPriority;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *addTaskButton;

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *currentLocation;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"dd-MM-yyyy HH:mm";
    
    self.addTaskButton.layer.cornerRadius = 5.0;
    self.addTaskButton.layer.borderWidth = 1.0;
    self.addTaskButton.layer.borderColor = self.addTaskButton.tintColor.CGColor;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.locationManager requestWhenInUseAuthorization];
//}

#pragma mark - Core Location Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"Updated new location");
    self.currentLocation = [locations lastObject];
}

- (IBAction)dueDateSelected:(id)sender {
    self.taskLabel.text = [self.dateFormatter stringFromDate:self.taskDatePicker.date];
}

- (IBAction)pickDateButtonTouched:(id)sender {
    [self.taskTextField resignFirstResponder];
    [self.descriptionTextView resignFirstResponder];
}

- (IBAction)addTaskButtonTouched:(id)sender {
    if([self.taskTextField.text isEqualToString:@""]) {
        [self showMissingInfoAlert];
        return;
    }
    
    WFTask *newTask = [[WFTask alloc] initWithTitle:self.taskTextField.text taskDescription:self.descriptionTextView.text dueDate:self.taskDatePicker.date priority:self.taskPriority.selectedSegmentIndex];
    newTask.location = self.currentLocation;
    [[WFTaskManager sharedInstance] addTask:newTask];
    [self resetForm];
}

- (void)resetForm {
    self.taskTextField.text = @"";
    self.descriptionTextView.text = @"";
    self.taskLabel.text = @"Due Date";
}

- (void)showMissingInfoAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"You need a title for the task to save it." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction= [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
    }];
    
}

@end
