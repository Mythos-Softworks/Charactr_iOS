#import "MSPointPool.h"

@interface MSNamedPointPool : MSPointPool

@property(nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
