//
//  NewFeatureCollectionVC.swift
//  weibo1
//
//  Created by WY on 15/11/29.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit
import SnapKit
private let reuseIdentifier = "Cell"
let imemCount = 4
class NewFeatureCollectionVC: UICollectionViewController {


    init () {
        let layout1 = UICollectionViewFlowLayout()
    //尼玛为什么没有提示
        layout1.itemSize = UIScreen.mainScreen().bounds.size
//        layout1.minimumInteritemSpacing = 220//行间距
        layout1.minimumLineSpacing = 0//列间距
        layout1.scrollDirection = UICollectionViewScrollDirection.Horizontal
    super.init(collectionViewLayout: layout1)
        collectionView?.pagingEnabled = true//要放在父类初始化方法以后, 才会有collectionView
        collectionView?.bounces = false
        collectionView?.showsHorizontalScrollIndicator = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(CustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imemCount
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCell
    
        // Configure the cell
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.redColor() : UIColor.greenColor()
        cell.idx = indexPath.item
        
        
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.item)
        let cell = collectionView.visibleCells().last as! CustomCell
        let index = collectionView.indexPathForCell(cell)
        let indexItem = index?.item ?? 0
        if indexItem == imemCount - 1 {//判断是不是最后一页
            cell.btnStartAnimat()
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

//MARK: 自定义cell
class CustomCell : UICollectionViewCell {
    //添加一个记录下标的属性用来标记图片
    var idx = 0{
        didSet{
             imgView.image = UIImage(named: "new_feature_\(idx + 1)")/////////////
            btn.hidden = true
//            if idx == 3 {btn.hidden = false}
        }
    }
    
    //添加一个imageView属性和按钮属性
    lazy var imgView = UIImageView(image: UIImage(named: "new_feature_1"))
    lazy var btn : UIButton = {
        var temp = UIButton()
        temp.setTitle("点击体验", forState: UIControlState.Normal)
        temp.setBackgroundImage(UIImage(named: "new_feature_finish_button"), forState: .Normal)

        temp.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), forState: .Highlighted)
        temp.sizeToFit()
        return temp
    }()
    //调整每个cell的图片
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    func layoutUI(){
        contentView.addSubview(imgView)
        contentView.addSubview(btn)
        imgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView.snp_edges)
        }
        btn.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(contentView.snp_centerX)
            make.centerY.equalTo(contentView.snp_bottom).offset(-110)
        }
    
    }
    func btnStartAnimat (){
        btn.hidden = false
        btn.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(2.0, delay: 0, options: [], animations: { () -> Void in
            //执行动画
            self.btn.transform = CGAffineTransformMakeScale(1, 1)
            }) { (_ ) -> Void in
                //啥也不淡
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}