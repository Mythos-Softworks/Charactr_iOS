#import <UIKit/UIKit.h>

@interface UIButton(MSButtons)

/// Button used for adding entries.
+ (instancetype)addButtonWithTarget:(id)target action:(SEL)action;

/// Button initialized with given target and action.
+ (instancetype)buttonWithTarget:(id)target action:(SEL)action;

/// Button used for decrementing values.
+ (instancetype)decrementButtonWithTarget:(id)target action:(SEL)action;

/// Button used for incrementing values.
+ (instancetype)incrementButtonWithTarget:(id)target action:(SEL)action;

/// Button used to represent a toggle with a checkbox.
+ (instancetype)toggleCheckboxButtonWithTarget:(id)target action:(SEL)action;

/// Button used to represent a toggle with a 'light'.
+ (instancetype)toggleLightButtonWithTarget:(id)target action:(SEL)action;

@end
