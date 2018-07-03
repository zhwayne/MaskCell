//
//  ViewController.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "ViewController.h"
#import "SwitchTableViewCell.h"
#import "CurtainTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[SwitchTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[CurtainTableViewCell class] forCellReuseIdentifier:@"cell2"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10000;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (arc4random() % 2 == 0) {
        return [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    }
    
    return [tableView dequeueReusableCellWithIdentifier:@"cell1"];
}


@end
