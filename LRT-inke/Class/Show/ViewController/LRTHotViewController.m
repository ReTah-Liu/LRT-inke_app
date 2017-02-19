//
//  LRTHotViewController.m
//  LRT-inke
//
//  Created by ReTah_Liu on 17/2/17.
//  Copyright © 2017年 ReTah_Liu. All rights reserved.
//

#import "LRTHotViewController.h"
#import "LRTLiveHandler.h"
#import "LRTLiveCell.h"

static NSString *identifier = @"LRTLiveCell";

@interface LRTHotViewController ()

@property (nonatomic, strong) NSMutableArray *datalist;

@end

@implementation LRTHotViewController

- (NSMutableArray *)datalist
{
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
    
    [self loadData];
}

- (void)initUI
{
    [self.tableView registerNib:[UINib nibWithNibName:@"LRTLiveCell" bundle:nil] forCellReuseIdentifier:identifier];
}

-(void)loadData
{
    [LRTLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        
        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        
        NSLog(@"%@", obj);
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LRTLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.live = self.datalist[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70 + SCREEN_WIDTH;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
