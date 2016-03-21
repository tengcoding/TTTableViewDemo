//
//  ViewController.m
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/18.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "ViewController.h"
#import "TTCars.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *Cars;

@property (nonatomic,strong) UITableView *tableView;



@end

@implementation ViewController

- (NSArray *)Cars{
    if (_Cars == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in array) {
            TTCars *car = [TTCars carsWithDict:dict];
            [arrayM addObject:car];
        }
        _Cars = arrayM;
    }
    return _Cars;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.Cars.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    TTCars *cars = self.Cars[section];
    return cars.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTCars *cars = self.Cars[indexPath.section];
    NSString *name = cars.cars[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = name;
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    TTCars *cars = self.Cars[section];
    return cars.index;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    TTCars *cars = self.Cars[section];
    return cars.desc;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (TTCars *car in self.Cars) {
        [arr addObject:car.index];
    }
    return arr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
