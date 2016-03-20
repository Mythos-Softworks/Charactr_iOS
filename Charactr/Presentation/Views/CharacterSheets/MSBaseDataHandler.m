#import "MSBaseDataHandler.h"

@implementation MSBaseDataHandler

- (void)handleDataForTable:(UITableView *)table delegate:(id<MSDataHandlerDelegate>)delegate {
  table.dataSource = self;
  table.delegate = self;
  _table = table;
  _delegate = delegate;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return nil;
}

#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Nop.
}

@end
