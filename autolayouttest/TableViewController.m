//
//  TableViewController.m
//  autolayouttest
//
//  Created by diamond on 27.11.14.
//  Copyright (c) 2014 diamond. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UIScrollViewDelegate>
{
    UIScrollView* _scrollView;
    UIImageView* _imageView;
}
@property NSMutableArray* images;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [[NSMutableArray alloc]init];
    for (int i = 0; i<40; i++) {
        UIImage* image = [UIImage imageNamed:@"quantum.png"];
        [self.images addObject:image];
    }
    CGRect scrollViewFrame = [[UIScreen mainScreen]bounds];
    scrollViewFrame.origin.x -= 10;
    scrollViewFrame.size.width += 20;
    scrollViewFrame.size.height = scrollViewFrame.size.height /3;
    CGSize frameSize = CGSizeMake(scrollViewFrame.size.width, scrollViewFrame.size.height);
    _scrollView = [[UIScrollView alloc]initWithFrame:scrollViewFrame];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake([self imageCount] * frameSize.width, frameSize.height);
    _scrollView.pagingEnabled = NO;
    _scrollView.userInteractionEnabled = YES;
    //_scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    for (int i = 0; i < [self imageCount]; i++) {
        NSInteger nsint = 0;
        UIImageView* iVForScrollView = [self ImageViewWithFrame:CGRectMake(frameSize.width * i +10, frameSize.height-frameSize.height,scrollViewFrame.size.width - 20, frameSize.height) andIndex:nsint];
        [_scrollView addSubview:iVForScrollView];
    }
    self.tableView.tableHeaderView = [[UIView alloc]init];
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0,frameSize.width, frameSize.height);
    
    [self.tableView.tableHeaderView addSubview:_scrollView];
    [self.tableView addSubview:self.tableView.tableHeaderView];
    
//    [self.tableView.tableHeaderView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
//                                                         attribute:NSLayoutAttributeHeight
//                                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                            toItem:self.tableView.tableHeaderView
//                                                         attribute:NSLayoutAttributeHeight
//                                                        multiplier:1.0
//                                                        constant:200]];
//    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

-(UIImageView*)ImageViewWithFrame:(CGRect)frame andIndex:(NSInteger)index
{
    _imageView = [[UIImageView alloc]initWithFrame:frame];
    [_imageView setImage:[self.images objectAtIndex:index]];
    CGRect labFrame = CGRectMake(10, 10, 44, 44);
    UILabel* label = [[UILabel alloc]initWithFrame:labFrame];
    label.text = [NSString stringWithFormat:@"%ld", (long)index];
    [_imageView addSubview:label];
    return _imageView;
}


-(NSInteger)imageCount
{
    return [self.images count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
