#import <UIKit/UIKit.h>

#import "MSScionAttribute.h"

@protocol MSScionAttributeHandler;

/// Cell to handle display of, and interaction with, Scion attributes.
@interface MSScionAttributeCell : UITableViewCell

/// Set up the cell to display |attribute| and send updates to |handler|.
- (void)setAttribute:(MSScionAttribute *)attribute handler:(id<MSScionAttributeHandler>)handler;

@end

/// Protocol for a handler object that a cell can inform about updates.
@protocol MSScionAttributeHandler <NSObject>

/// Called when the user presses the Increment button for the main attribute value.
/// Return: the new attribute value.
- (NSInteger)attributeIncrementButtonPressedInCell:(MSScionAttributeCell *)cell;

/// Called when the user presses the Decrement button for the main attribute value.
/// Return: the new attribute value.
- (NSInteger)attributeDecrementButtonPressedInCell:(MSScionAttributeCell *)cell;

/// Called when the user presses the Increment button for the epic attribute value.
/// Return: the new epic attribute value.
- (NSInteger)epicAttributeIncrementButtonPressedInCell:(MSScionAttributeCell *)cell;

/// Called when the user presses the Decrement button for the epic attribut value.
/// Return: the new epic attribute value.
- (NSInteger)epicAttributeDecrementButtonPressedInCell:(MSScionAttributeCell *)cell;

/// Called when the user presses the Favored button for the attribute.
/// Return: the new favored status.
- (BOOL)favoredAttributeButtonPressedInCell:(MSScionAttributeCell *)cell;

@end
