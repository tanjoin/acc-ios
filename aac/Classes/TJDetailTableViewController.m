//
//  TJDetailTableViewController.m
//  aac
//

#import "TJDetailTableViewController.h"

@interface TJDetailTableViewController ()
@property(copy, nonatomic, nonnull) NSArray<Class> *cellClasses;
@property(strong, nonatomic, nonnull) UITableViewCell *heightCell;
@end

@implementation TJDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                              target:self
                                              action:@selector(didTapMessageButton)];
    
    _heightCell = [[UITableViewCell alloc] init];
    _heightCell.textLabel.numberOfLines = 0;
    _heightCell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;

    self.cellClasses = @[UITableViewCell.class];
    for (Class clz in self.cellClasses) {
        [self.tableView registerClass:clz forCellReuseIdentifier:NSStringFromClass(clz)];
    }
}

- (void)didTapMessageButton
{
    if (!_campaign) {
        return;
    }
    
    if (_campaign.urls.count == 0) {
        return;
    }
    
    NSString *url = _campaign.urls[0];
    
    // open with Chrome
    NSURL *inputURL = [NSURL URLWithString:url];
    NSString *scheme = inputURL.scheme;
    NSString *chromeScheme = nil;
    if ([scheme isEqualToString:@"http"]) {
        chromeScheme = @"googlechrome";
    } else if ([scheme isEqualToString:@"https"]) {
        chromeScheme = @"googlechromes";
    }
    
    if (chromeScheme) {
        NSString *absoluteString = [inputURL absoluteString];
        NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
        NSString *urlNoScheme =
        [absoluteString substringFromIndex:rangeForScheme.location];
        NSString *chromeURLString =
        [chromeScheme stringByAppendingString:urlNoScheme];
        NSURL *chromeURL = [NSURL URLWithString:chromeURLString];
        
        // Open the URL with Chrome.
        [[UIApplication sharedApplication] openURL:chromeURL options:@{} completionHandler:^(BOOL success) {
            if (!success) {
                [[UIApplication sharedApplication] openURL:inputURL options:@{} completionHandler:nil];
            }
        }];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = _campaign.identifier;
            break;
        case 1:
            cell.textLabel.text = _campaign.title;
            break;
        case 2:
            cell.textLabel.text = _campaign.serviceTitle;
            break;
        case 3:
            cell.textLabel.text = _campaign.date.toString;
            break;
        case 4:
            cell.textLabel.text = _campaign.descriptionText;
            break;
        default:
            cell.textLabel.text = nil;
            break;
    }
    return cell;
}

@end
