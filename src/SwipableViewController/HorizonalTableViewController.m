//
//  HorizonalTableViewController.m
//
//  modified by dby 2016-04-03.
//

#import "HorizonalTableViewController.h"
#import "SwipableConfig.h"

@interface HorizonalTableViewController ()

@end

static NSString *kHorizonalCellID = @"HorizonalCell";

@implementation HorizonalTableViewController

- (instancetype)initWithViewControllers:(NSArray *)controllers
{
    self = [super init];
    if (self) {
        _controllers = [NSMutableArray arrayWithArray:controllers];
        for (UIViewController *controller in controllers) {
            [self addChildViewController:controller];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [UITableView new];
    
    self.tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollsToTop     = NO;
    self.tableView.transform        = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.pagingEnabled    = YES;
    self.tableView.backgroundColor  = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:243.0/255 alpha:1.0];
    self.tableView.bounces          = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kHorizonalCellID];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _controllers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.width;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell           = [self.tableView dequeueReusableCellWithIdentifier:kHorizonalCellID forIndexPath:indexPath];
    cell.contentView.transform      = CGAffineTransformMakeRotation(M_PI_2);
    cell.contentView.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:243.0/255 alpha:1.0];
    cell.selectionStyle             = UITableViewCellSeparatorStyleNone;
    
    UIViewController *controller    = _controllers[indexPath.row];
    controller.view.frame           = cell.contentView.bounds;
    [cell.contentView addSubview:controller.view];
    
    return cell;
}

#pragma mark - <UIScrollViewDelegate>
//
// 减速停止的时候开始执行
//
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    debugMethod();
    [self scrollStop:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    debugMethod();
    [self scrollStop:NO];
    if (_viewDidScroll) { _viewDidScroll(); }
}

#pragma mark -

- (void)scrollToViewAtIndex:(NSUInteger)index
{
    debugLog(@"scrollToViewAtIndex index: %lu", (unsigned long)index);
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                          atScrollPosition:UITableViewScrollPositionNone
                                  animated:NO];
    
    _currentIndex = index;
    if (_viewDidAppear) {_viewDidAppear(index);}
}

- (void)scrollStop:(BOOL)didScrollStop
{
    CGFloat horizonalOffset = self.tableView.contentOffset.y;
    CGFloat screenWidth     = self.tableView.frame.size.width;
    CGFloat offsetRatio     = (NSUInteger)horizonalOffset % (NSUInteger)screenWidth / screenWidth;
    NSUInteger focusIndex   = (horizonalOffset + screenWidth / 2) / screenWidth;
    
    if (horizonalOffset != focusIndex * screenWidth) {
        NSUInteger animationIndex = horizonalOffset > focusIndex * screenWidth ? focusIndex + 1: focusIndex - 1;
        if (focusIndex > animationIndex) {offsetRatio = 1 - offsetRatio;}
        if (_scrollView) {
            _scrollView(offsetRatio, focusIndex, animationIndex);
        }
    }

    if (didScrollStop) {
        
        [_controllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
            if ([vc isKindOfClass:[UITableViewController class]]) {
                ((UITableViewController *)vc).tableView.scrollsToTop = (idx == focusIndex);
            }
        }];
        
        _currentIndex = focusIndex;
        if (_changeIndex) {_changeIndex(focusIndex);}
    }
}

@end