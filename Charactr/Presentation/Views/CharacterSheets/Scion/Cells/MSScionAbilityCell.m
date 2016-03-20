#import "MSScionAbilityCell.h"

#import "UIButton+MSButtons.h"
#import "UILabel+MSLabels.h"
#import "UIView+MSLayout.h"

@implementation MSScionAbilityCell {
  id<MSScionAbilityHandler> _handler;

  UILabel *_abilityNameLabel;

  UILabel *_abilityValueLabel;
  UIButton *_abilityIncrementButton;
  UIButton *_abilityDecrementButton;

  UIButton *_addAbilityButton;

  UIButton *_favoredButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
    UIView *contentView = self.contentView;

    _abilityNameLabel = [UILabel titleLabelWithText:@"Ability"];
    [contentView addSubview:_abilityNameLabel];

    _abilityValueLabel = [UILabel valueLabel];
    [contentView addSubview:_abilityValueLabel];

    _abilityIncrementButton =
        [UIButton incrementButtonWithTarget:self action:@selector(incrementAbilityValue:)];
    [contentView addSubview:_abilityIncrementButton];

    _abilityDecrementButton =
        [UIButton decrementButtonWithTarget:self action:@selector(decrementAbilityValue:)];
    [contentView addSubview:_abilityDecrementButton];

    _addAbilityButton = [UIButton addButtonWithTarget:self action:@selector(addAbility:)];
    [contentView addSubview:_addAbilityButton];

    _favoredButton = [UIButton toggleCheckboxButtonWithTarget:self
                                                       action:@selector(toggleFavored:)];
    [contentView addSubview:_favoredButton];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  CGFloat totalOffset = 0.0;

  totalOffset = [self layoutInteractiveView:_favoredButton withXOffset:totalOffset];

  totalOffset = [self layoutTitleView:_abilityNameLabel withXOffset:totalOffset];

  _addAbilityButton.frame = CGRectMake(totalOffset,
                                       0.0,
                                       self.bounds.size.width - totalOffset,
                                       self.bounds.size.height);

  totalOffset = [self layoutInteractiveView:_abilityDecrementButton withXOffset:totalOffset];

  totalOffset = [self layoutInteractiveView:_abilityValueLabel withXOffset:totalOffset];

  totalOffset = [self layoutInteractiveView:_abilityIncrementButton withXOffset:totalOffset];
}

#pragma mark

- (void)setAbility:(MSScionAbility *)ability handler:(id<MSScionAbilityHandler>)handler {
  if (ability.parentAbility) {
    _abilityNameLabel.text =
    [NSString stringWithFormat:@"> %@", ability.name];
    [_favoredButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  } else {
    _abilityNameLabel.text = ability.name;
    [_favoredButton setTitleColor:[UIColor colorWithRed:0.0
                                                  green:0.5
                                                   blue:1.0
                                                  alpha:1.0]
                         forState:UIControlStateNormal];
  }

  BOOL expandable = ability.expandable;
  _abilityIncrementButton.hidden = expandable;
  _abilityDecrementButton.hidden = expandable;
  _abilityValueLabel.hidden = expandable;
  _addAbilityButton.hidden = !expandable;

  [self setAbilityValue:ability.value];
  [self setFavored:ability.favored];

  _handler = handler;
}

#pragma mark Interface Events

- (void)incrementAbilityValue:(UIButton *)sender {
  [self setAbilityValue:[_handler abilityIncrementButtonPressedInCell:self]];
}

- (void)decrementAbilityValue:(UIButton *)sender {
  [self setAbilityValue:[_handler abilityDecrementButtonPressedInCell:self]];
}

- (void)addAbility:(UIButton *)sender {
  [_handler addAbilityButtonPressedInCell:self];
}

- (void)toggleFavored:(UIButton *)sender {
  [self setFavored:[_handler favoredAbilityButtonPressedInCell:self]];
}

#pragma mark Private Methods

- (void)setAbilityValue:(NSInteger)value {
  _abilityValueLabel.text = [NSString stringWithFormat:@"%d", value];
  _abilityIncrementButton.enabled = value < 10;
  _abilityDecrementButton.enabled = value > 0;
  [self setNeedsDisplay];
}

- (void)setFavored:(BOOL)favored {
  _favoredButton.selected = favored;
  [self setNeedsDisplay];
}

@end
