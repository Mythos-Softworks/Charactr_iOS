#import "UIButton+MSButtons.h"

@implementation UIButton(MSButtons)

+ (instancetype)addButtonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [self buttonWithTarget:target action:action];
  // TODO: Set image.
  [button setTitle:@"+" forState:UIControlStateNormal];

  return button;
}

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
  [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
  [button setTitleColor:[UIColor colorWithRed:0.0
                                        green:0.5
                                         blue:1.0
                                        alpha:1.0]
               forState:UIControlStateNormal];
  return button;
}

+ (instancetype)decrementButtonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [self buttonWithTarget:target action:action];
  // TODO: Set image.
  [button setTitle:@"-" forState:UIControlStateNormal];

  return button;
}

+ (instancetype)incrementButtonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [self buttonWithTarget:target action:action];
  // TODO: Set image.
  [button setTitle:@"+" forState:UIControlStateNormal];

  return button;
}

+ (instancetype)toggleCheckboxButtonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [self buttonWithTarget:target action:action];
  // TODO: Set images.
  [button setTitle:@"-" forState:UIControlStateNormal];
  [button setTitle:@"X" forState:UIControlStateSelected];
  button.titleLabel.font = [UIFont systemFontOfSize:15.0];

  return button;
}

+ (instancetype)toggleLightButtonWithTarget:(id)target action:(SEL)action {
  UIButton *button = [self buttonWithTarget:target action:action];
  // TODO: Set images.
  [button setTitle:@"-" forState:UIControlStateNormal];
  [button setTitle:@"X" forState:UIControlStateSelected];
  button.titleLabel.font = [UIFont systemFontOfSize:21.0];

  return button;
}

@end
