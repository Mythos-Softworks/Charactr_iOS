#import <Foundation/Foundation.h>

@interface MSScionAbility : NSObject<NSCoding>

@property(nonatomic, strong) NSString *name;
@property(nonatomic) NSInteger value;
@property(nonatomic) BOOL favored;

/// These properties are used for abilities that require specialization.
/// (e.g. Art, Science)
@property(nonatomic) BOOL expandable;
@property(nonatomic, weak) MSScionAbility *parentAbility;

- (instancetype)initWithName:(NSString *)name expandable:(BOOL)expandable;
- (instancetype)initWithName:(NSString *)name
               parentAbility:(MSScionAbility *)parentAbility;
- (instancetype)init NS_UNAVAILABLE;

@end
