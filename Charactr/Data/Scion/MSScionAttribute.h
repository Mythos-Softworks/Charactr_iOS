#import <Foundation/Foundation.h>

@interface MSScionAttribute : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic) NSInteger value;
@property(nonatomic) NSInteger epicValue;
@property(nonatomic) BOOL favored;

- (instancetype)initWithName:(NSString *)name;

@end
