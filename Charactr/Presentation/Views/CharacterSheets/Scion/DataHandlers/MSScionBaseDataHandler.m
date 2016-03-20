#import "MSScionBaseDataHandler.h"

@implementation MSScionBaseDataHandler

- (instancetype)initWithCharacter:(MSScionCharacter *)character {
  if ((self = [super init])) {
    _character = character;
  }
  return self;
}

@end
