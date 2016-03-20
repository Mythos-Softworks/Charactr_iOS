#import <UIKit/UIKit.h>

#import "MSScionAbility.h"

@protocol MSScionAbilityHandler;

/// Cell to handle display of, and interaction with, Scion abilities.
@interface MSScionAbilityCell : UITableViewCell

/// Set up the cell to display |ability| and send updates to |handler|.
- (void)setAbility:(MSScionAbility *)ability handler:(id<MSScionAbilityHandler>)handler;

@end

/// Protocol for a handler object that a cell can inform about updates.
@protocol MSScionAbilityHandler <NSObject>

/// Called when the user presses the Increment button for the ability value.
/// Return: the new ability value.
- (NSInteger)abilityIncrementButtonPressedInCell:(MSScionAbilityCell *)cell;

/// Called when the user presses the Decrement button for the ability value.
/// Return: the new ability value.
- (NSInteger)abilityDecrementButtonPressedInCell:(MSScionAbilityCell *)cell;

/// Called when the user presses the Favored button for the ability.
/// Return: the new favored status.
- (BOOL)favoredAbilityButtonPressedInCell:(MSScionAbilityCell *)cell;

/// Called when the user presses the Add Ability button for a parent ability.
- (void)addAbilityButtonPressedInCell:(MSScionAbilityCell *)cell;

@end
