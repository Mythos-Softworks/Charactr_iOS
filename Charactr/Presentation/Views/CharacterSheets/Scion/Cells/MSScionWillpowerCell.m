#import "MSScionWillpowerCell.h"

#import "UIButton+MSButtons.h"
#import "UILabel+MSLabels.h"
#import "UIView+MSLayout.h"

@implementation MSScionWillpowerCell {
  id<MSScionWillpowerHandler> _handler;

  UILabel *_maxNameLabel;
  UILabel *_maxValueLabel;
  UIButton *_maxIncrementButton;
  UIButton *_maxDecrementButton;

  UILabel *_currentNameLabel;
  UILabel *_currentValueLabel;
  UIButton *_currentIncrementButton;
  UIButton *_currentDecrementButton;

  NSInteger _maxTempValue;
  NSInteger _currentTempValue;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    UIView *contentView = self.contentView;

    // Max willpower elements.
    _maxNameLabel = [UILabel titleLabelWithText:@"Willpower"];
    [contentView addSubview:_maxNameLabel];

    _maxValueLabel = [UILabel valueLabel];
    [contentView addSubview:_maxValueLabel];

    _maxIncrementButton =
        [UIButton incrementButtonWithTarget:self action:@selector(incrementMaxValue:)];
    [contentView addSubview:_maxIncrementButton];

    _maxDecrementButton =
        [UIButton decrementButtonWithTarget:self action:@selector(decrementMaxValue:)];
    [contentView addSubview:_maxDecrementButton];

    // Current willpower elements.
    _currentNameLabel = [UILabel subtitleLabelWithText:@"Remaining"];
    [contentView addSubview:_currentNameLabel];

    _currentValueLabel = [UILabel subvalueLabel];
    [contentView addSubview:_currentValueLabel];

    _currentIncrementButton =
        [UIButton incrementButtonWithTarget:self action:@selector(incrementCurrentValue:)];
    [contentView addSubview:_currentIncrementButton];

    _currentDecrementButton =
        [UIButton decrementButtonWithTarget:self action:@selector(decrementCurrentValue:)];
    [contentView addSubview:_currentDecrementButton];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  CGFloat totalOffset = 0.0;

  totalOffset = [self layoutTitleView:_maxNameLabel
                         subtitleView:_currentNameLabel
                          withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_maxDecrementButton
                          secondaryInteractiveView:_currentDecrementButton
                                       withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_maxValueLabel
                          secondaryInteractiveView:_currentValueLabel
                                       withXOffset:totalOffset];

  totalOffset = [self layoutPrimaryInteractiveView:_maxIncrementButton
                          secondaryInteractiveView:_currentIncrementButton
                                       withXOffset:totalOffset];
}

#pragma mark

- (void)setWillpower:(MSPointPool *)willpower handler:(id<MSScionWillpowerHandler>)handler {
  [self setMaxValue:willpower.maxPool];
  [self setCurrentValue:willpower.currentPool];
  _handler = handler;
}

#pragma mark Interface Events

- (void)incrementMaxValue:(UIButton *)sender {
  [self setMaxValue:[_handler maxWillpowerIncrementButtonPressed]];
}

- (void)decrementMaxValue:(UIButton *)sender {
  [self setMaxValue:[_handler maxWillpowerDecrementButtonPressed]];
}

- (void)incrementCurrentValue:(UIButton *)sender {
  [self setCurrentValue:[_handler currentWillpowerIncrementButtonPressed]];
}

- (void)decrementCurrentValue:(UIButton *)sender {
  [self setCurrentValue:[_handler currentWillpowerDecrementButtonPressed]];
}

#pragma mark Private Methods

- (void)setMaxValue:(NSInteger)value {
  _maxValueLabel.text = [NSString stringWithFormat:@"%ld", (long)value];
  _maxIncrementButton.enabled = value < 10;
  _maxDecrementButton.enabled = value > 0;

  _maxTempValue = value;
  if (_currentTempValue >= _maxTempValue) {
    [self setCurrentValue:_maxTempValue];
  } else {
    [self setNeedsDisplay];
  }
}

- (void)setCurrentValue:(NSInteger)value {
  _currentValueLabel.text = [NSString stringWithFormat:@"%ld", (long)value];
  _currentIncrementButton.enabled = value < _maxTempValue;
  _currentDecrementButton.enabled = value > 0;

  _currentTempValue = value;
  [self setNeedsDisplay];
}

@end
