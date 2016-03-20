#import <UIKit/UIKit.h>

#import "MSCharacter.h"

@protocol MSDataHandlerDelegate;

/// Object to act as DataSource and Delegate for a TableView as part of a character sheet.
@interface MSBaseDataHandler : NSObject<UITableViewDataSource, UITableViewDelegate> {
  @protected

  /// Object to handle updates that the handler cannot.
  id<MSDataHandlerDelegate> _delegate;

  /// Table for which this object acts as DataSource and Delegate.
  UITableView *_table;
}

/// Set up table and delegate properties.
/// Subclasses should use this opportunity to register their cell classes with the table.
- (void)handleDataForTable:(UITableView *)table delegate:(id<MSDataHandlerDelegate>)delegate;

@end

/// Protocol for an object to receive updates from the handler that it can't handle.
@protocol MSDataHandlerDelegate <NSObject>

/// Called when the user actually selects the cell at the given index path, as opposed to just
/// interacting with its elements.
- (void)dataHandler:(MSBaseDataHandler *)dataHandler didSelectIndexPath:(NSIndexPath *)indexPath;

/// Called when the user does something that should present a view controller.
- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion;

@end
