#import "MSScionFeaturesDataHandler.h"

#import "MSScionLegendCell.h"
#import "MSScionWillpowerCell.h"

static const CGFloat kDefaultCellHeight = 44.0;
static NSString *const kLegendCellIdentifier = @"kLegendCellIdentifier";
static const CGFloat kWillpowerCellHeight = 54.0;
static NSString *const kWillpowerCellIdentifier = @"kWillpowerCellIdentifier";

@interface MSScionFeaturesDataHandler ()<MSScionLegendHandler, MSScionWillpowerHandler>

@end

@implementation MSScionFeaturesDataHandler

- (void)handleDataForTable:(UITableView *)table delegate:(id<MSDataHandlerDelegate>)delegate {
  [super handleDataForTable:table delegate:delegate];

  [table registerClass:[MSScionWillpowerCell class]
      forCellReuseIdentifier:kWillpowerCellIdentifier];
  [table registerClass:[MSScionLegendCell class] forCellReuseIdentifier:kLegendCellIdentifier];
}

#pragma mark <MSScionLegendHandler>

- (NSInteger)legendRatingIncrementButtonPressed {
  _character.legend++;
  return _character.legend;
}

- (NSInteger)legendRatingDecrementButtonPressed {
  _character.legend--;
  return _character.legend;
}

#pragma mark <MSScionWillpowerHandler>

- (NSInteger)maxWillpowerIncrementButtonPressed {
  _character.willpower.maxPool++;
  return _character.willpower.maxPool;
}

- (NSInteger)maxWillpowerDecrementButtonPressed {
  _character.willpower.maxPool--;
  return _character.willpower.maxPool;
}

- (NSInteger)currentWillpowerIncrementButtonPressed {
  _character.willpower.currentPool++;
  return _character.willpower.currentPool;
}

- (NSInteger)currentWillpowerDecrementButtonPressed {
  _character.willpower.currentPool--;
  return _character.willpower.currentPool;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
//  return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell;

  switch (indexPath.row) {
    case 0: {
      MSScionWillpowerCell *willpowerCell =
          [tableView dequeueReusableCellWithIdentifier:kWillpowerCellIdentifier];
      [willpowerCell setWillpower:_character.willpower handler:self];
      cell = willpowerCell;
      break;
    }

    case 1: {
      MSScionLegendCell *legendCell =
          [tableView dequeueReusableCellWithIdentifier:kLegendCellIdentifier];
      [legendCell setLegend:_character.legend handler:self];
      cell = legendCell;
      break;
    }
  }

  return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat cellHeight = 0;

  switch (indexPath.row) {
    case 0:
      cellHeight = kWillpowerCellHeight;
      break;

    case 1:
      cellHeight = kDefaultCellHeight;
      break;
  }

  return cellHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable highlighting for dice pool selection.
  return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // TODO: Enable selection for dice pool selection.
  return nil;
}

@end
