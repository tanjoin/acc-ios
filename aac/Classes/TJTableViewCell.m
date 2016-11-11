//
//  TJTableViewCell.m
//  aac
//

#import "TJTableViewCell.h"

@interface TJTableViewCell ()

@property (strong, nonatomic, nonnull) IBOutlet UILabel *idLabel;

@property (strong, nonatomic, nonnull) IBOutlet UILabel *serviceTitleLabel;

@property (strong, nonatomic, nonnull) IBOutlet UILabel *dayLabel;

@property (strong, nonatomic, nonnull) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic, nonnull) IBOutlet UILabel *descriptionLabel;

@end

@implementation TJTableViewCell

#pragma mark - Initializer

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
  self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
}

#pragma mark -

- (void)layoutSubviews
{
  [self.idLabel setPreferredMaxLayoutWidth:CGRectGetWidth(self.idLabel.bounds)];
  [self.serviceTitleLabel setPreferredMaxLayoutWidth:CGRectGetWidth(self.serviceTitleLabel.bounds)];
  [self.dayLabel setPreferredMaxLayoutWidth:CGRectGetWidth(self.dayLabel.bounds)];
  [self.titleLabel setPreferredMaxLayoutWidth:CGRectGetWidth(self.titleLabel.bounds)];
  [self.descriptionLabel setPreferredMaxLayoutWidth:CGRectGetWidth(self.descriptionLabel.bounds)];
  
  [super layoutSubviews];
}

#pragma mark - Getter & Setter

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

- (void)setCampaign:(TJCampaign *)campaign
{
  _campaign = campaign;
  if (_campaign) {
    _idLabel.text = _campaign.identifier;
    _serviceTitleLabel.text = _campaign.serviceTitle;
    _dayLabel.text = nil;
    _titleLabel.text = _campaign.title;
    _descriptionLabel.text = _campaign.descriptionText;
    [self layoutIfNeeded];
  }
}

@end
