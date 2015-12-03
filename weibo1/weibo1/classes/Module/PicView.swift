//
//  Weibo
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

private let pictureCellID = "pictureCellID"
private let pictureCellMargin: CGFloat = 5

class PicView: UICollectionView {
    
    
    //配图视图 设置模型数据
    var imageURLs: [NSURL]? {
        didSet {
//            testLabel.text = "\(imageURLs?.count ?? 0)"
            let pSize = caclePictureViewSize()
            self.snp_updateConstraints { (make) -> Void in
                make.size.equalTo(pSize)
            }
            
            
            //属性视图
            reloadData()
        }
    }
    /*
    单图会按照图片等比例显示
    多图的图片大小固定
    多图如果是4张，会按照 2 * 2 显示
    多图其他数量，按照 3 * 3 九宫格显示
    */
    
    private func caclePictureViewSize() -> CGSize {
        
        let imageCount = imageURLs?.count ?? 0
        let maxWidth = screenW - 2 * StatusCellMargin
        let itemWidth = (maxWidth - 2 * pictureCellMargin) / 3.001
        
        
        //设置collectionView itemSize
        //设置cell的大小
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        
        if imageCount == 0 {
            return CGSizeZero
        }
        
        if imageCount == 1 {
            //TODO: 先显示固定大小
            //获取图片]
            //默认的图片大小
            var imageSize = CGSizeMake(180, 120)
            //获取图片的url地址 当做 获取缓存的key
            let key = imageURLs?.first?.absoluteString ?? ""
            //从 磁盘缓存中获取图片
            let image = SDWebImageManager.sharedManager().imageCache.imageFromDiskCacheForKey(key)
            if image != nil {
                imageSize = image.size
            }
            
            imageSize.width = imageSize.width > maxWidth ? maxWidth : imageSize.width
            imageSize.height = imageSize.height > 250 ? 250 : imageSize.height
            
            layout.itemSize = imageSize
            return imageSize
        }
        
        if imageCount == 4 {
            //浮点数的精度问题会导致iPhone5上四张配图显示有问题
            let pW = itemWidth * 2.01 + pictureCellMargin
            return CGSizeMake(pW, pW)
        }
        
        //程序走到这里 就是其他多张情况
        //多图其他数量，按照 3 * 3 九宫格显示
        
        /*
        1,2,3   -> 1
        4,5,6   -> 2
        7,8,9   -> 3
        
        先除 ->  +1  -> 分子 -1
        */
        let row = CGFloat((imageCount - 1) / 3 + 1)
        
        return  CGSizeMake(maxWidth, itemWidth * row + pictureCellMargin * (row - 1))
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = pictureCellMargin
        layout.minimumLineSpacing = pictureCellMargin
        super.init(frame: CGRectZero, collectionViewLayout: layout)
        //注册cell
        registerClass(PictureCell1.self, forCellWithReuseIdentifier: pictureCellID)
        
        //设置数据源
        dataSource = self
        backgroundColor = UIColor.whiteColor()
        
        //添加测试label
        setupUI()
        
    }
    
    private func setupUI() {
//        addSubview(testLabel)
//        testLabel.snp_makeConstraints { (make) -> Void in
//            make.center.equalTo(self.center)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //懒加载测试label
//    private lazy var testLabel: UILabel = UILabel()
    
}


//MARK: 数据源方法
extension PicView: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                print(imageURLs?.count)
        return imageURLs?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pictureCellID, forIndexPath: indexPath) as! PictureCell1
        cell.imageURL = imageURLs![indexPath.item]
        return cell
    }
}


class PictureCell1: UICollectionViewCell {
    
    
    //定义外部设置属性
    var imageURL: NSURL? {
        didSet {
            iconView.sd_setImageWithURL(imageURL)
        }
    }
    
    //MARK: 重写构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: 设置UI 及布局
    private func setupUI() {
        contentView.addSubview(iconView)
        
        //设置布局
        iconView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView.snp_edges)
        }
        
    }
    
    //MARK: 懒加载所有的子控件
    //图片默认显示  scaletofill
    private lazy var iconView: UIImageView = {
        let iv = UIImageView()
        //使用 sb / xib 默认设置剪裁
        iv.clipsToBounds = true
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    
    
}
