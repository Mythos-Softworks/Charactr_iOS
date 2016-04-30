#import <UIKit/UIKit.h>

#import "MSNamedPointPool.h"

@protocol MSScionVirtueHandler;

/// Cell to handle display of, and interaction with, a Scion virtues list.
@interface MSScionVirtuesCell : UITableViewCell

/// Set up the cell to display |virtues| and send updates to |handler|.
- (void)setVirtues:(NSArray<MSNamedPointPool *> *)virtues handler:(id<MSScionVirtueHandler>)handler;

@end

/// Protocol for a handler object that a cell can inform about updates.
@protocol MSScionVirtueHandler <NSObject>

/// Called when the user presses the Increment button for a virtue.
/// Return: the new virtue value.
- (NSInteger)virtueIncrementButtonPressedInCell:(MSScionVirtuesCell *)cell atIndex:(NSInteger)index;

/// Called when the user presses the Decrement button for a virtue.
/// Return: the new virtue value.
- (NSInteger)virtueDecrementButtonPressedInCell:(MSScionVirtuesCell *)cell atIndex:(NSInteger)index;

@end
