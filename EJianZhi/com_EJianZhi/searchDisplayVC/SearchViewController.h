//
//  SearchViewController.h
//  com_EJianZhi
//
//  Created by Mac on 2/1/15.
//  Copyright (c) 2015 Studio Of Spicy Hot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISearchDisplayController *mySearchDisplayController;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
