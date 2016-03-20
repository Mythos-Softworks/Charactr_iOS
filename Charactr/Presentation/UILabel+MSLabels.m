#import "UILabel+MSLabels.h"

const CGFloat kMSLabelTitleFontSize = 19.0;
const CGFloat kMSLabelSubtitleFontSize = 15.0;

@implementation UILabel (MSLabels)

+ (instancetype)boldTitleLabelWithText:(NSString *)text {
  UILabel *label = [self labelWithText:text];
  label.font = [UIFont boldSystemFontOfSize:kMSLabelTitleFontSize];
  return label;
}

+ (instancetype)labelWithText:(NSString *)text {
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = text;
  return label;
}

+ (instancetype)subtitleLabelWithText:(NSString *)text {
  UILabel *label = [self labelWithText:text];
  label.font = [UIFont systemFontOfSize:kMSLabelSubtitleFontSize];
  return label;
}

+ (instancetype)subvalueLabel {
  UILabel *label = [self subtitleLabelWithText:nil];
  label.textAlignment = NSTextAlignmentCenter;
  return label;
}

+ (instancetype)titleLabelWithText:(NSString *)text {
  UILabel *label = [self labelWithText:text];
  label.font = [UIFont systemFontOfSize:kMSLabelTitleFontSize];
  return label;
}

+ (instancetype)valueLabel {
  UILabel *label = [self titleLabelWithText:nil];
  label.textAlignment = NSTextAlignmentCenter;
  return label;
}

@end
