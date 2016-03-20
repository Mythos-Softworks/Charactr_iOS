#import <UIKit/UIKit.h>

@interface UIView (MSLayout)

/// Sets the frame of |titleView|, based on the receiver's bounds and |xOffset|.
/// Returns the new total offset.
- (CGFloat)layoutTitleView:(UIView *)titleView withXOffset:(CGFloat)xOffset;

/// Sets the frames of |titleView| and |subtitleView|, based on the receiver's bounds and |xOffset|.
/// Returns the new total offset.
- (CGFloat)layoutTitleView:(UIView *)titleView
              subtitleView:(UIView *)subtitleView
               withXOffset:(CGFloat)xOffset;

/// Sets the frame of |interactiveView|, based on the receiver's bounds and |xOffset|.
/// Returns the new total offset.
- (CGFloat)layoutInteractiveView:(UIView *)interactiveView withXOffset:(CGFloat)xOffset;

/// Sets the frames of |primaryInteractiveView| and |secondaryInteractiveView|, based on the
/// receiver's bounds and |xOffset|.
/// Returns the new total offset.
- (CGFloat)layoutPrimaryInteractiveView:(UIView *)primaryInteractiveView
               secondaryInteractiveView:(UIView *)secondaryInteractiveView
                            withXOffset:(CGFloat)xOffset;

@end
