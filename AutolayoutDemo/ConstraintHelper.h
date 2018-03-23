#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConstraintHelper : NSObject

@property (nonatomic, readonly) UIView *avatarView;
@property (nonatomic) NSValue *optionalAvatarSize;

@property (nonatomic, readonly) UIView *contentView;

@property (nonatomic, readonly) UIView *rightView;
@property (nonatomic) NSValue *optionalRightViewSize;

+ (instancetype)createHelperWithAvatar:(UIView *)avatarView
                               content:(UIView *)contentView
                                 right:(UIView *)rightView;

- (void)setUpConstraint;

@end
