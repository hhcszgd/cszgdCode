//
//  ViewController.m
//  1125LunBo
//
//  Created by WY on 15/11/25.
//  Copyright © 2015年 WY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property(nonatomic,strong)NSArray * imgArr ;
@property(nonatomic,strong)NSIndexPath * indexPath ;
@property(nonatomic,assign)NSInteger  currentItem ;
@property(nonatomic,strong)NSTimer * time ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"----%@",self.imgArr);
    UICollectionViewLayout * layout = [[UICollectionViewLayout alloc]init];
    [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addTimer];
}
-(void)addTimer
{
    NSTimer * time = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.time=time;
    [[NSRunLoop mainRunLoop ] addTimer:time forMode:NSRunLoopCommonModes];
}
-(void)removeTimer
{
    [self.time invalidate];
    self.time=nil;
}
-(void )nextImage{
    NSIndexPath *currentIndexPath = [[self.myCollectionView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:self.imgArr.count/2];
    [self.myCollectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    NSInteger item  = currentIndexPathReset.item + 1 ;
    NSInteger section = currentIndexPathReset.section;
//     NSLog(@"----%d",section);
    if (item==self.imgArr.count) {
        section ++ ;
        item = 0 ;
    }
    self.currentItem = item ;
        [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:section] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];

}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
     NSLog(@"----%@",@(decelerate));
    [self addTimer];
}


-(NSString * )imgArr {
    if(_imgArr==nil){
        NSMutableArray * arrM = [NSMutableArray array];
        _imgArr = [[NSArray alloc]init];
        for (int i =1; i < 3; i++) {
            NSString * tempStr = [NSString stringWithFormat:@"minion_%02d",i];
            [arrM addObject:tempStr];
        }
        _imgArr = arrM;
        
    }
    return _imgArr;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 30;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.contentView addSubview: [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imgArr[indexPath.item]]]];
    self.indexPath = indexPath ;
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger item =(NSInteger) (self.myCollectionView.contentOffset.x/self.myCollectionView.bounds.size.width) % self.imgArr.count;
    [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:item inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
