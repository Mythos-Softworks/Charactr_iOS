#import "MSScionCharacterSheetView.h"

@implementation MSScionCharacterSheetView

- (instancetype)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    self.backgroundColor = [UIColor grayColor];

    _attributesTableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                        style:UITableViewStylePlain];
    [self addSubview:_attributesTableView];

    _abilitiesTableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                       style:UITableViewStylePlain];
    [self addSubview:_abilitiesTableView];

    _featuresTableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
    [self addSubview:_featuresTableView];

    _combatTableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                    style:UITableViewStylePlain];
    [self addSubview:_combatTableView];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];

  CGSize boundSize = self.bounds.size;
  CGFloat tableWidth = boundSize.width / 4.0;
  CGFloat tableHeight = boundSize.height;

  _attributesTableView.frame = CGRectMake(0.0,
                                          0.0,
                                          tableWidth,
                                          tableHeight);
  _abilitiesTableView.frame = CGRectMake(tableWidth,
                                         0.0,
                                         tableWidth,
                                         tableHeight);
  _featuresTableView.frame = CGRectMake(tableWidth * 2.0,
                                        0.0,
                                        tableWidth,
                                        tableHeight);
  _combatTableView.frame = CGRectMake(tableWidth * 3.0,
                                      0.0,
                                      tableWidth,
                                      tableHeight);
}

@end
