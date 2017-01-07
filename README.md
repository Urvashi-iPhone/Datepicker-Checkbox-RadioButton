# Datepicker-and-Checkbox

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
