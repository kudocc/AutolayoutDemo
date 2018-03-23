//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by rui yuan on 2018/3/24.
//  Copyright © 2018年 rui yuan. All rights reserved.
//

#import "ViewController.h"
#import "ConstraintHelper.h"

@interface AutoTableViewCell : UITableViewCell

@property (nonatomic) UIImageView *avatarView;
@property (nonatomic) UILabel *textView;
@property (nonatomic) UIImageView *coverImageView;

@end

@implementation AutoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    // avatar
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.avatarView];
    
    // cover
    self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.coverImageView.layer.cornerRadius = 2;
    self.coverImageView.layer.masksToBounds = YES;
    self.coverImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.coverImageView];
    
    // text view
    self.textView = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textView.numberOfLines = 0;
    [self.contentView addSubview:self.textView];
    
    ConstraintHelper *helper = [ConstraintHelper createHelperWithAvatar:self.avatarView content:self.textView right:self.coverImageView];
    helper.optionalRightViewSize = [NSValue valueWithCGSize:CGSizeMake(50, 50)];
    helper.optionalAvatarSize = [NSValue valueWithCGSize:CGSizeMake(40, 40)];
    [helper setUpConstraint];
}

@end


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 70;
    tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    tableView.separatorColor = [UIColor blackColor];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [UIView new];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableView = tableView;
    [self.tableView registerClass:AutoTableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textView.text = @"hi, can you help me fix the problem";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
