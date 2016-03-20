#import "UIView+MSLayout.h"

#import "UILabel+MSLabels.h"

static const CGFloat kDefaultTitlePadding = 8.0;
static const CGFloat kInteractiveViewWidthFraction = 0.125;
static const CGFloat kTitleViewWidthFraction = 0.5;

@implementation UIView (MSLayout)

- (CGFloat)layoutTitleView:(UIView *)titleView withXOffset:(CGFloat)xOffset {
  CGSize boundSize = self.bounds.size;
  CGFloat width = boundSize.width * kTitleViewWidthFraction;
  if (xOffset == 0.0) {
    // There's no leading interactive view here, so add padding + width.
    xOffset = kDefaultTitlePadding;
    width += boundSize.width * kInteractiveViewWidthFraction - kDefaultTitlePadding;
  }

  titleView.frame = CGRectMake(xOffset, 0.0, width, boundSize.height);

  return xOffset + width;
}

- (CGFloat)layoutTitleView:(UIView *)titleView
              subtitleView:(UIView *)subtitleView
               withXOffset:(CGFloat)xOffset {
  CGSize boundSize = self.bounds.size;
  CGFloat width = boundSize.width * kTitleViewWidthFraction;
  if (xOffset == 0.0) {
    // There's no leading interactive view here, so add padding + width.
    xOffset = kDefaultTitlePadding;
    width += boundSize.width * kInteractiveViewWidthFraction - kDefaultTitlePadding;
  }
  CGFloat titleHeight =
      boundSize.height * kMSLabelTitleFontSize / (kMSLabelTitleFontSize + kMSLabelSubtitleFontSize);

  titleView.frame = CGRectMake(xOffset, 0.0, width, titleHeight);
  subtitleView.frame = CGRectMake(xOffset, titleHeight, width, boundSize.height - titleHeight);

  return xOffset + width;
}

- (CGFloat)layoutInteractiveView:(UIView *)interactiveView withXOffset:(CGFloat)xOffset {
  CGSize boundSize = self.bounds.size;
  CGFloat width = boundSize.width * kInteractiveViewWidthFraction;

  interactiveView.frame = CGRectMake(xOffset, 0.0, width, boundSize.height);

  return xOffset + width;
}

- (CGFloat)layoutPrimaryInteractiveView:(UIView *)primaryInteractiveView
               secondaryInteractiveView:(UIView *)secondaryInteractiveView
                            withXOffset:(CGFloat)xOffset {
  CGSize boundSize = self.bounds.size;
  CGFloat width = boundSize.width * kInteractiveViewWidthFraction;
  CGFloat primaryHeight =
      boundSize.height * kMSLabelTitleFontSize / (kMSLabelTitleFontSize + kMSLabelSubtitleFontSize);

  primaryInteractiveView.frame = CGRectMake(xOffset, 0.0, width, primaryHeight);
  secondaryInteractiveView.frame = CGRectMake(xOffset,
                                              primaryHeight,
                                              width,
                                              boundSize.height - primaryHeight);

  return xOffset + width;
}

@end
