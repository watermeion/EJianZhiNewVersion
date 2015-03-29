//
//  MLThirdVC.m
//  EJianZhi
//
//  Created by RAY on 15/1/19.
//  Copyright (c) 2015年 麻辣工作室. All rights reserved.
//

#import "MLThirdVC.h"
#import "CDCommon.h"
#import "CDSessionManager.h"
#import "CDChatRoomController.h"
#import "MLContactCell.h"

enum : NSUInteger {
    kTagNameLabel = 10000,
};

@interface MLThirdVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MLThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.tableView.tableFooterView=tempView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPeerId)];
    
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionUpdated:) name:NOTIFICATION_SESSION_UPDATED object:nil];
}

- (void)addPeerId{
    CDChatRoomController *controller = [[CDChatRoomController alloc] init];
    [[CDSessionManager sharedInstance] addChatWithPeerId:@"cici1234"];
    controller.otherId = @"cici1234";
    controller.type = CDChatRoomTypeSingle;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[CDSessionManager sharedInstance] chatRooms] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BOOL nibsRegistered = NO;
    
    static NSString *Cellidentifier=@"MLContactCell";
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"MLContactCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:Cellidentifier];
        nibsRegistered = YES;
    }
    
    MLContactCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier forIndexPath:indexPath];

    NSDictionary *chatRoom = [[[CDSessionManager sharedInstance] chatRooms] objectAtIndex:indexPath.row];
    CDChatRoomType type = [[chatRoom objectForKey:@"type"] integerValue];
    NSString *otherid = [chatRoom objectForKey:@"otherid"];
    NSMutableString *nameString = [[NSMutableString alloc] init];
    if (type == CDChatRoomTypeGroup) {
        [nameString appendFormat:@"group:%@", otherid];
    } else {
        [nameString appendFormat:@"%@", otherid];
    }
    
    cell.userTitleLabel.text=nameString;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *chatRoom = [[[CDSessionManager sharedInstance] chatRooms] objectAtIndex:indexPath.row];
    CDChatRoomType type = [[chatRoom objectForKey:@"type"] integerValue];
    NSString *otherid = [chatRoom objectForKey:@"otherid"];
    CDChatRoomController *controller = [[CDChatRoomController alloc] init];
    controller.type = type;
    if (type == CDChatRoomTypeGroup) {
        AVGroup *group = [[CDSessionManager sharedInstance] joinGroup:otherid];
        controller.group = group;
        controller.otherId = otherid;
    } else {
        controller.otherId = otherid;
    }
    [self.navigationController pushViewController:controller animated:YES];
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
}

- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

- (void)sessionUpdated:(NSNotification *)notification {
    [self.tableView reloadData];
}


@end
