#import <UIKit/UIKit.h>

extern const CGFloat kMSLabelTitleFontSize;
extern const CGFloat kMSLabelSubtitleFontSize;

@interface UILabel (MSLabels)

+ (instancetype)boldTitleLabelWithText:(NSString *)text;

+ (instancetype)labelWithText:(NSString *)text;

+ (instancetype)subtitleLabelWithText:(NSString *)text;

+ (instancetype)subvalueLabel;

+ (instancetype)titleLabelWithText:(NSString *)text;

+ (instancetype)valueLabel;

@end
