#import <UIKit/UIKit.h>

#import "MSCharacter.h"
#import "MSCharacterStorageObject.h"

@interface MSCharacterSheetViewController : UIViewController

@property(nonatomic, strong) id<MSCharacter> character;
@property(nonatomic, strong) MSCharacterStorageObject *info;

// Designated initializer.
- (instancetype)initWithCharacter:(id<MSCharacter>)character info:(MSCharacterStorageObject *)info;

/// Called when the user taps the info button on the navigation bar.
/// Subclasses must override this method.
- (void)infoButtonPressed:(UIBarButtonItem *)infoButton;

@end
