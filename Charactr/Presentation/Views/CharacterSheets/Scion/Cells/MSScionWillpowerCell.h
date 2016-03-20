#import <UIKit/UIKit.h>

#import "MSPointPool.h"

@protocol MSScionWillpowerHandler;

/// Cell to handle display of, and interaction with, Scion willpower.
@interface MSScionWillpowerCell : UITableViewCell

/// Set up the cell to display |willpower| and send updates to |handler|.
- (void)setWillpower:(MSPointPool *)willpower handler:(id<MSScionWillpowerHandler>)handler;

@end

/// Protocol for a handler object that a cell can inform about updates.
@protocol MSScionWillpowerHandler <NSObject>

/// Called when the user presses the Increment button for the Max Willpower value.
/// Return: the new value.
- (NSInteger)maxWillpowerIncrementButtonPressed;

/// Called when the user presses the Decrement button for the Max Willpower value.
/// Return: the new value.
- (NSInteger)maxWillpowerDecrementButtonPressed;

/// Called when the user presses the Increment button for the Current Willpower value.
/// Return: the new value.
- (NSInteger)currentWillpowerIncrementButtonPressed;

/// Called when the user presses the Decrement button for the Current Willpower value.
/// Return: the new value.
- (NSInteger)currentWillpowerDecrementButtonPressed;

@end
