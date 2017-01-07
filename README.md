# Datepicker-and-Checkbox

<h3>CHECKBOX</h3>
```c

Go to Storybord

take view and this view give class BEMCheckBox

then create outlet of this BEMCheckBox view and implement this

```

```c
@interface ViewController ()
@property (weak, nonatomic) IBOutlet BEMCheckBox *checkbox;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.checkbox.onAnimationType = BEMAnimationTypeBounce;
    self.checkbox.offAnimationType = BEMAnimationTypeBounce;
    
}

- (void)didTapCheckBox:(BEMCheckBox*)checkBox
{
    NSLog(@"checked");
}

```
<h3>DATE PICKER</h3>
```c
Install Pod:

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ‘8.1’
target 'YOGA' do
  pod 'THCalendarDatePicker', '~> 1.2.6'
end
```

```c
Go to Storybord
Take Button ->create outlet and action

@property (weak, nonatomic) IBOutlet UIButton *btndate;
- (IBAction)BtnDate:(id)sender;

import class #import "THDatePickerViewController.h"

property define:
@property (nonatomic, strong) THDatePickerViewController * datePicker;
@property (nonatomic, retain) NSDate * curDate;
@property (nonatomic, retain) NSDateFormatter * formatter;

```
```c
- (void)viewDidLoad {
    [super viewDidLoad];
    _btndate.layer.cornerRadius = 5.0f;
    _btndate.layer.borderColor = [[UIColor blackColor] CGColor];
    _btndate.layer.borderWidth = 1.0f;
    
    //Date Picker
    self.curDate = [NSDate date];
    self.formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"dd/MM/yyyy"];
    [self refreshTitle];
   
}
-(void)refreshTitle {
    [self.btndate setTitle:(self.curDate ? [_formatter stringFromDate:_curDate] : @"No date selected") forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)BtnDate:(id)sender
{
    if(!self.datePicker)
        self.datePicker = [THDatePickerViewController datePicker];
    self.datePicker.date = self.curDate;
    self.datePicker.delegate = self;
    [self.datePicker setAllowClearDate:NO];
    [self.datePicker setClearAsToday:YES];
    [self.datePicker setAutoCloseOnSelectDate:NO];
    [self.datePicker setAllowSelectionOfSelectedDate:YES];
    [self.datePicker setDisableYearSwitch:YES];
    //[self.datePicker setDisableFutureSelection:NO];
    [self.datePicker setDaysInHistorySelection:12];
    [self.datePicker setDaysInFutureSelection:0];
    //    [self.datePicker setAllowMultiDaySelection:YES];
    //    [self.datePicker setDateTimeZoneWithName:@"UTC"];
    //[self.datePicker setAutoCloseCancelDelay:5.0];
    [self.datePicker setSelectedBackgroundColor:[UIColor colorWithRed:125/255.0 green:208/255.0 blue:0/255.0 alpha:1.0]];
    [self.datePicker setCurrentDateColor:[UIColor colorWithRed:242/255.0 green:121/255.0 blue:53/255.0 alpha:1.0]];
    [self.datePicker setCurrentDateColorSelected:[UIColor yellowColor]];
    
    [self.datePicker setDateHasItemsCallback:^BOOL(NSDate *date) {
        int tmp = (arc4random() % 30)+1;
        return (tmp % 5 == 0);
    }];
    //[self.datePicker slideUpInView:self.view withModalColor:[UIColor lightGrayColor]];
    [self presentSemiViewController:self.datePicker withOptions:@{
                                                                  KNSemiModalOptionKeys.pushParentBack    : @(NO),
                                                                  KNSemiModalOptionKeys.animationDuration : @(1.0),
                                                                  KNSemiModalOptionKeys.shadowOpacity     : @(0.3),
                                                                  }];
 
}
#pragma mark - THDatePickerDelegate

- (void)datePickerDonePressed:(THDatePickerViewController *)datePicker {
    self.curDate = datePicker.date;
    [self refreshTitle];
    [self dismissSemiModalView];
}

- (void)datePickerCancelPressed:(THDatePickerViewController *)datePicker {
    [self dismissSemiModalView];
}

- (void)datePicker:(THDatePickerViewController *)datePicker selectedDate:(NSDate *)selectedDate {
    NSLog(@"Date selected: %@",[_formatter stringFromDate:selectedDate]);
}

```
