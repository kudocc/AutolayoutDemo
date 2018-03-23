#import "ConstraintHelper.h"


@interface ConstraintHelper ()

@property (nonatomic) UIView *avatarView;
@property (nonatomic) UIView *contentView;
@property (nonatomic) UIView *rightView;

@end

@implementation ConstraintHelper

+ (instancetype)createHelperWithAvatar:(UIView *)avatarView
                               content:(UIView *)contentView
                                 right:(UIView *)rightView {
    ConstraintHelper *helper = [ConstraintHelper new];
    helper.avatarView = avatarView;
    helper.contentView = contentView;
    helper.rightView = rightView;
    return helper;
}

- (void)setUpConstraint {
    self.avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *superView = [self.avatarView superview];
    
    // left
    [self.avatarView.topAnchor constraintEqualToAnchor:superView.topAnchor constant:15].active = YES;
    [self.avatarView.leadingAnchor constraintEqualToAnchor:superView.leadingAnchor constant:15].active = YES;
    if (self.optionalAvatarSize) {
        CGSize size = [self.optionalAvatarSize CGSizeValue];
        [self.avatarView.widthAnchor constraintEqualToConstant:size.width].active = YES;
        [self.avatarView.heightAnchor constraintEqualToConstant:size.height].active = YES;
    }
    [self.avatarView.bottomAnchor constraintLessThanOrEqualToAnchor:superView.bottomAnchor constant:-15].active = YES;
    
    // right
    [self.rightView.trailingAnchor constraintEqualToAnchor:superView.trailingAnchor constant:-15].active = YES;
    [self.rightView.topAnchor constraintEqualToAnchor:self.avatarView.topAnchor].active = YES;
    if (self.optionalRightViewSize) {
        CGSize size = [self.optionalRightViewSize CGSizeValue];
        [self.rightView.widthAnchor constraintEqualToConstant:size.width].active = YES;
        [self.rightView.heightAnchor constraintEqualToConstant:size.height].active = YES;
    }
    [self.rightView.bottomAnchor constraintLessThanOrEqualToAnchor:superView.bottomAnchor constant:-15].active = YES;
    
    // middle
    [self.contentView.topAnchor constraintGreaterThanOrEqualToAnchor:superView.topAnchor constant:15].active = YES;
    NSLayoutConstraint *constraint = [self.contentView.centerYAnchor constraintEqualToAnchor:self.avatarView.centerYAnchor];
    constraint.priority = UILayoutPriorityDefaultLow-2;
    constraint.active = YES;
    [self.contentView.bottomAnchor constraintLessThanOrEqualToAnchor:superView.bottomAnchor constant:-15].active = YES;
    [self.contentView.leadingAnchor constraintEqualToAnchor:self.avatarView.trailingAnchor constant:10].active = YES;
    [self.contentView.trailingAnchor constraintEqualToAnchor:self.rightView.leadingAnchor constant:-10].active = YES;
    [self.contentView setContentHuggingPriority:UILayoutPriorityDefaultLow-1 forAxis:UILayoutConstraintAxisVertical];
    [self.contentView setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh+1 forAxis:UILayoutConstraintAxisVertical];
    [self.contentView setContentHuggingPriority:UILayoutPriorityDefaultLow-1 forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentView setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh+1 forAxis:UILayoutConstraintAxisHorizontal];
}

@end
