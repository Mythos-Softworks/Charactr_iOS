#import <UIKit/UIKit.h>

@protocol MSScionLegendHandler;

/// Cell to handle display of, and interaction with, Scion Legend rating.
@interface MSScionLegendCell : UITableViewCell

/// Set up the cell to display |legend| and send updates to |handler|.
- (void)setLegend:(NSInteger)legend handler:(id<MSScionLegendHandler>)handler;

@end

/// Protocol for a handler object that a cell can inform about updates.
@protocol MSScionLegendHandler <NSObject>

/// Called when the user presses the Increment button for the Legend rating.
/// Return: the new value.
- (NSInteger)legendRatingIncrementButtonPressed;

/// Called when the user presses the Decrement button for the Legend rating.
/// Return: the new value.
- (NSInteger)legendRatingDecrementButtonPressed;

@end
