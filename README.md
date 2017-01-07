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

import class #import "THDatePickerViewController.h" and give delegate <THDatePickerDelegate>

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
<h3>RADIO BUTTON</h3>

```c
@property (weak, nonatomic) IBOutlet UIButton *r1;
@property (weak, nonatomic) IBOutlet UIButton *r2;
@property (weak, nonatomic) IBOutlet UIButton *r3;
-(void)radiobuttonSelected:(id)sender;
```
```c
-(void)radiobuttonSelected:(id)sender
{
    switch ([sender tag])
    {
        case 0:
            if([_r1 isSelected]==YES)
            {
                [_r1 setSelected:NO];
                [_r2 setSelected:YES];
                [_r3 setSelected:YES];
            }
            else{
                [_r1 setSelected:YES];
                [_r2 setSelected:NO];
                [_r3 setSelected:NO];
            }
            
            break;
        case 1:
            if([_r2 isSelected]==YES)
            {
                [_r2 setSelected:NO];
                [_r1 setSelected:YES];
                [_r3 setSelected:YES];
            }
            else{
                [_r2 setSelected:YES];
                [_r1 setSelected:NO];
                [_r3 setSelected:NO];
            }
            
            break;
        case 2:
            if([_r3 isSelected]==YES)
            {
                [_r3 setSelected:NO];
                [_r1 setSelected:YES];
                [_r2 setSelected:YES];
            }
            else{
                [_r3 setSelected:YES];
                [_r1 setSelected:NO];
                [_r2 setSelected:NO];
            }
            
            break;
        default:
            break;
    }
    
}
-(void)viewDidAppear:(BOOL)animated

{
    
    [_r1 setTag:0];
    [_r1 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1.png"] forState:UIControlStateNormal];
    [_r1 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1 copy.png"] forState:UIControlStateSelected];
    [_r1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_r2 setTag:1];
    [_r2 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1.png"] forState:UIControlStateNormal];
    [_r2 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1 copy.png"] forState:UIControlStateSelected];
    [_r2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_r3 setTag:2];
    [_r3 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1.png"] forState:UIControlStateNormal];
    [_r3 setBackgroundImage:[UIImage imageNamed:@"Ellipse 1 copy.png"] forState:UIControlStateSelected];
    [_r3 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
}


```
