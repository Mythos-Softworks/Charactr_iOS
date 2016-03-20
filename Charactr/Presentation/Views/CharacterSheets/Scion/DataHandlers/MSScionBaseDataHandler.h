#import "MSBaseDataHandler.h"

#import "MSScionCharacter.h"

/// Base DataHandler object for Scion character sheets.
@interface MSScionBaseDataHandler : MSBaseDataHandler {
  @protected

  /// Character that this DataHandler is responsible for.
  MSScionCharacter *_character;
}

- (instancetype)initWithCharacter:(MSScionCharacter *)character
    NS_DESIGNATED_INITIALIZER;

- (instancetype)init
    NS_UNAVAILABLE;

@end
