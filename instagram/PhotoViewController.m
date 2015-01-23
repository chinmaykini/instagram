//
//  PhotoViewController.m
//  instagram
//
//  Created by Chinmay Kini on 1/22/15.
//  Copyright (c) 2015 Chinmay Kini. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@interface PhotoViewController ()

@property ( nonatomic, strong) NSArray *data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.tableView.rowHeight = 320;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
     NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=876ab4c7f3c04e7c963dcf0332a50035"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"response: %@", responseDictionary);
        
        self.data = responseDictionary[@"data"];
        [self.tableView reloadData];
    }];
    
    UINib *photoCellNib = [UINib nibWithNibName:@"PhotoTableViewCell" bundle:nil];
    [self.tableView registerNib:photoCellNib forCellReuseIdentifier:@"PhotoTableViewCell"];


    // Do any additional setup after loading the view from its nib.
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    PhotoTableViewCell *photocell = [tableView dequeueReusableCellWithIdentifier:@"PhotoTableViewCell" forIndexPath:indexPath];
    NSDictionary *photoData = self.data[indexPath.row];
    NSLog(@"%@",[photoData valueForKeyPath:@"likes.count"]);
//
//    cell.textLabel.text = [NSString stringWithFormat:@"This is Section %ld row %ld",indexPath.section, indexPath.row];
    photocell.instaUser.text = [photoData valueForKeyPath:@"user.username"];
//    photocell.instaLike.text = [photoData valueForKeyPath:@"likes.count"];
    return photocell;
}

@end
