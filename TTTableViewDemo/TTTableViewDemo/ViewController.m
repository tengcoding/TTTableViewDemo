//
//  ViewController.m
//  TTTableViewDemo
//
//  Created by 梁腾 on 16/3/18.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "ViewController.h"
#import "TTCars.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

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

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = cars.title;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TTCars *cars = self.Cars[indexPath.section];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"编辑" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = indexPath.row;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *txtname = [alert textFieldAtIndex:0];
    txtname.text = cars.title;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        UITextField *txtName = [alertView textFieldAtIndex:0];
        NSString *userInput = txtName.text;
        TTCars *cars = self.Cars[[self.tableView indexPathForSelectedRow].section];
        NSString *str = cars.cars[alertView.tag];
        NSLog(@"%@",str);
        cars.title = userInput;
        
        [self.tableView reloadRowsAtIndexPaths:@[[self.tableView indexPathForSelectedRow]] withRowAnimation:UITableViewRowAnimationBottom];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
        
        // 注意: 这里直接写入数据是不行的!!(原因:self.heros集合中保存的是模型对象, 不是字典数据)
        // 通过数组的writeToFile:方法, 只能写入一些基本的数据, 无法把对象直接写入到文件
        // 要想把一个对象直接写入到文件中, 需要使用"归档"的方式.
        [self.Cars writeToFile:path atomically:YES];
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
