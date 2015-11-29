//
//  NewFeatureCollectionVC.swift
//  weibo1
//
//  Created by WY on 15/11/29.
//  Copyright © 2015年 WY. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

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
        return 5
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCell
    
        // Configure the cell
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.redColor() : UIColor.greenColor()
        return cell
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
    //添加一个imageView属性和按钮属性
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imgView = UIImageView(image: UIImage(named: "new_feature_1"))
    
    


}