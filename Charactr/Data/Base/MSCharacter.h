#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
  kMSCharacterTypeScion = 0,
} MSCharacterType;

@protocol MSCharacter <NSObject>

@property(readonly) MSCharacterType characterType;

@end
