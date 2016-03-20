#import "MSCharacterSheetViewController.h"

#import "MSScionCharacter.h"

@interface MSScionCharacterSheetViewController : MSCharacterSheetViewController

// (Type override.)
- (instancetype)initWithCharacter:(MSScionCharacter *)character info:(MSCharacterStorageObject *)info;

@end
