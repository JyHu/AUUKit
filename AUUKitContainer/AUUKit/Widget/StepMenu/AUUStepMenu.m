//
//  AUUStepMenu.m
//  AUUKitContainer
//
//  Created by 胡金友 on 15/8/3.
//  Copyright (c) 2015年 北京爱康泰科技有限责任公司. All rights reserved.
//

#import "AUUStepMenu.h"
#import "AUUKit.h"

#define kFirstStepTableTag 100
#define kSecondStepTableTag 101
#define kThirdStepTableTag 102

static NSString *fcellReusefulIdentifier = @"firstStepCellReusefulIdentifier";
static NSString *scellReusefulIdentifier = @"secondStepCellReusefulIdentifier";
static NSString *tcellReusefulIdentifier = @"thirdStepCellReusefulIdentifier";

static NSTimeInterval defaultMenuChangeAnimationDuraiont = 0.35;
static CGFloat perMenuItemCellHeight = 44.0f;


@interface AUUStepMenu() <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView *firstStepTable;
@property (retain, nonatomic) UITableView *secondStepTable;
@property (retain, nonatomic) UITableView *thirdStepTable;

@property (retain, nonatomic) NSArray *secondStepDatasource;
@property (retain, nonatomic) NSArray *thirdStepDatasource;

@property (assign, nonatomic) NSInteger selectedIndexF;
@property (assign, nonatomic) NSInteger selectedIndexS;
@property (assign, nonatomic) NSInteger selectedIndexT;

@property (retain, nonatomic) NSString *selectedTitleF;
@property (retain, nonatomic) NSString *selectedTitleS;
@property (retain, nonatomic) NSString *selectedTitleT;

@end

@implementation AUUStepMenu

- (id)init
{
    return [self initWithFrame:kScreenBounds];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
    return self;
}

- (id)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource
{
    self = [self initWithFrame:frame];
    
    if (!self) return nil;
    
    self.dataSource = dataSource;
    
    return self;
}

- (void)setDataSource:(NSArray *)dataSource
{
    if (dataSource)
    {
        _dataSource = dataSource;
        
        [self removeAllSubViews];
        self.dataSource = nil;
        self.secondStepDatasource = nil;
        self.thirdStepDatasource = nil;
        
        self.secondStepTable = nil;
        self.firstStepTable = nil;
        self.thirdStepTable = nil;
        
        self.selectedIndexF = -1;
        self.selectedIndexS = -1;
        self.selectedIndexT = -1;
        
        self.selectedTitleF = nil;
        self.selectedTitleS = nil;
        self.selectedTitleT = nil;
        
        CGFloat tableHeight = (dataSource.count * perMenuItemCellHeight < self.height ? dataSource.count * perMenuItemCellHeight + 0.1 : self.height);
        
        self.firstStepTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, tableHeight) style:UITableViewStyleGrouped];
        self.firstStepTable.tag = kFirstStepTableTag;
        self.firstStepTable.delegate = self;
        self.firstStepTable.dataSource = self;
        self.firstStepTable.backgroundColor = [UIColor blueColor];
        self.firstStepTable.animationDurationWhenFrameChanged = defaultMenuChangeAnimationDuraiont;
        [self addSubview:self.firstStepTable];
    }
}

#pragma mark - table view datasource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == kFirstStepTableTag)
    {
        return self.dataSource.count;
    }
    else if (tableView.tag == kSecondStepTableTag)
    {
        return self.secondStepDatasource.count;
    }
    else if (tableView.tag == kThirdStepTableTag)
    {
        return self.thirdStepDatasource.count;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellForRowAtIndexPath:indexPath
                identifier:[@[fcellReusefulIdentifier, scellReusefulIdentifier, tcellReusefulIdentifier]
                            objectAtIndex:(tableView.tag - 100)]];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 10e-10)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kZero;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kZero;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return perMenuItemCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [self dataForTableView:tableView indexPath:indexPath];
    
    NSString *title = @"null";
    NSArray *nextStepDatasource = nil;
    CGFloat tableHeight = 0;
    
    if ([data isKindOfClass:[NSString class]])
    {
        title = (NSString *)data;
    }
    else if ([data isKindOfClass:[NSDictionary class]])
    {
        title = [[(NSDictionary *)data allKeys] firstObject];
        nextStepDatasource = [[(NSDictionary *)data allValues] firstObject];
        tableHeight = (nextStepDatasource.count * perMenuItemCellHeight < self.height ? nextStepDatasource.count * perMenuItemCellHeight + 0.1: self.height);
    }
    
    if (tableView.tag == kFirstStepTableTag)
    {
        self.selectedIndexF = indexPath.row;
        self.selectedTitleF = title;
        
        if (nextStepDatasource && nextStepDatasource.count > 0)
        {
            self.secondStepDatasource = nextStepDatasource;
            
            if (!self.secondStepTable)
            {
                self.secondStepTable = [[UITableView alloc] initWithFrame:CGRectMake(self.width, 0, 0, tableHeight) style:UITableViewStyleGrouped];
                self.secondStepTable.delegate = self;
                self.secondStepTable.dataSource = self;
                self.secondStepTable.tag = kSecondStepTableTag;
                self.secondStepTable.backgroundColor = [UIColor blueColor];
                self.secondStepTable.animationDurationWhenFrameChanged = defaultMenuChangeAnimationDuraiont;
                [self addSubview:self.secondStepTable];
                
                [self reloadFrame];
            }
            else
            {
                [self.secondStepTable reloadData];
            }
        }
        else
        {
            [self hideSecondTable];
        }
    }
    else if (tableView.tag == kSecondStepTableTag)
    {
        self.selectedIndexS = indexPath.row;
        self.selectedTitleS = title;
        
        if (nextStepDatasource && nextStepDatasource.count > 0)
        {
            self.thirdStepDatasource = nextStepDatasource;
            
            if (!self.thirdStepTable)
            {
                self.thirdStepTable = [[UITableView alloc] initWithFrame:CGRectMake(self.width, 0, 0, tableHeight) style:UITableViewStyleGrouped];
                self.thirdStepTable.delegate = self;
                self.thirdStepTable.dataSource = self;
                self.thirdStepTable.tag = kThirdStepTableTag;
                self.thirdStepTable.backgroundColor = [UIColor blueColor];
                self.thirdStepTable.animationDurationWhenFrameChanged = defaultMenuChangeAnimationDuraiont;
                [self addSubview:self.thirdStepTable];
                
                [self reloadFrame];
            }
            else
            {
                [self.thirdStepTable reloadData];
            }
        }
        else
        {
            [self hideThirdTable];
        }
    }
    else if (tableView.tag == kThirdStepTableTag)
    {
        self.selectedTitleT = title;
        self.selectedIndexT = indexPath.row;
    }
}

#pragma mark - help methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    id data = [self dataForTableView:tableView indexPath:indexPath];
    
    if ([data isKindOfClass:[NSString class]])
    {
        cell.textLabel.text = (NSString *)data;
    }
    else if ([data isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *tempDict = (NSDictionary *)data;
        
        cell.textLabel.text = [[tempDict allKeys] firstObject];
    }
    else
    {
        cell.textLabel.text = @"null";
    }
    
    return cell;
}

- (id)dataForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    id data;
    
    if (tableView.tag == kFirstStepTableTag)
    {
        data = [self.dataSource objectAtIndex:indexPath.row];
    }
    else if (tableView.tag == kSecondStepTableTag)
    {
        data = [self.secondStepDatasource objectAtIndex:indexPath.row];
    }
    else if (tableView.tag == kThirdStepTableTag)
    {
        data = [self.thirdStepDatasource objectAtIndex:indexPath.row];
    }
    else
    {
        data  = nil;
    }
    
    return data;
}

- (void)reloadFrame
{
    if (self.thirdStepTable)
    {
        CGFloat perWidth = self.width / 3.0;
        
        self.firstStepTable.width = perWidth;
        self.secondStepTable.width = perWidth;
        self.secondStepTable.xOrigin = perWidth;
        self.thirdStepTable.width = perWidth;
        self.thirdStepTable.xOrigin = 2 * perWidth;
    }
    else if (self.secondStepTable)
    {
        CGFloat perWidth = self.width / 2.0;
        
        self.firstStepTable.width = perWidth;
        self.secondStepTable.width = perWidth;
        self.secondStepTable.xOrigin = perWidth;
    }
    else
    {
        self.firstStepTable.width = self.width;
    }
}

- (void)hideThirdTable
{
    if (self.thirdStepTable)
    {
        [UIView animateWithDuration:defaultViewAnimationDuration animations:^{
            
            self.thirdStepTable.xOrigin = self.width;
            self.thirdStepTable.alpha = 0;
            self.secondStepTable.width = self.width / 2.0;
            self.firstStepTable.width = self.width / 2.0;
            self.secondStepTable.xOrigin = self.width / 2.0;
            
        } completion:^(BOOL finished) {
            
            [self.thirdStepTable removeFromSuperview];
            self.thirdStepTable = nil;
            self.selectedTitleT = nil;
            self.selectedIndexT = -1;
        }];
    }
}

- (void)hideSecondTable
{
    if (self.secondStepTable)
    {
        [UIView animateWithDuration:defaultViewAnimationDuration animations:^{
            
            self.secondStepTable.xOrigin = self.width;
            self.secondStepTable.alpha = 0;
            self.thirdStepTable.xOrigin = self.width;
            self.thirdStepTable.alpha = 0;
            self.firstStepTable.width = self.width;
            
        } completion:^(BOOL finished) {
            
            [self.secondStepTable removeFromSuperview];
            self.secondStepTable = nil;
            self.selectedTitleS = nil;
            self.selectedIndexS = -1;
            self.secondStepDatasource = nil;
            
            [self.thirdStepTable removeFromSuperview];
            self.thirdStepTable = nil;
            self.selectedTitleT = nil;
            self.selectedIndexT = -1;
            self.thirdStepDatasource = nil;
            
        }];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.thirdStepTable)
    {
        [self hideThirdTable];
    }
    else if (self.secondStepTable)
    {
        [self hideSecondTable];
    }
}

@end
