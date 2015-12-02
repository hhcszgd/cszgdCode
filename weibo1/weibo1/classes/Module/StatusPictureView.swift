//
//  StatusPictureView.swift
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

class StatusPictureView: UICollectionView {
    //配图视图 设置模型数据
    var imgURLs: [NSURL]? {
        didSet { //相当于OC的重写set方法
//            print("写点什么表示一下\(imgURLs?.count)")
            //接收到值以后,根据值里有几个图片url,计算出collectionView的大小
            let collectioinViewSize : CGSize = calculatorSize()
            //调整宽高的约束约束
//            self.snp_makeConstraints { (make) -> Void in
//                make.size.equalTo(collectioinViewSize)
//            }
            self.snp_updateConstraints { (make) -> Void in
                make.size.equalTo(collectioinViewSize)
            }
            //刷新视图,显示最新视图界面
            reloadData()
        }
    }
    /*
    单图会按照图片等比例显示
    多图的图片大小固定
    多图如果是4张，会按照 2 * 2 显示
    多图其他数量，按照 3 * 3 九宫格显示
    */func calculatorSize () -> (CGSize){
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
    let imgCount = imgURLs?.count
        if imgCount == 0{return CGSizeZero}
        if imgCount == 1 {
            layout.itemSize = CGSizeMake(100, 100)
            return CGSizeMake(100+margin, 100+margin)
        }
        if imgCount == 4 {
            layout.itemSize = CGSizeMake(screenW/3, screenW/3)
            return CGSizeMake(screenW/3 * 2, screenW/3 * 2 )
        }
        let row = CGFloat((imgCount! - 1) / 3 + 1)
        
        return  CGSizeMake(screenW, (screenW/3-10) * row + margin * (row - 1))
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {//重写初始化方法, 设置布局属性
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = pictureCellMargin
        layout.minimumLineSpacing = pictureCellMargin
        super.init(frame: CGRectZero, collectionViewLayout: layout)
        //注册cell
        registerClass(PictureCell.self, forCellWithReuseIdentifier: pictureCellID)
        //设置数据源
        dataSource = self
        self.backgroundColor = UIColor.purpleColor()

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


//MARK: 数据源方法
extension StatusPictureView: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("每条微博图片数量\(imgURLs?.count)")
        return imgURLs?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pictureCellID, forIndexPath: indexPath) as! PictureCell
        cell.imageURL = imgURLs![indexPath.item]
        return cell
    }
}


class PictureCell: UICollectionViewCell { //自定义cell
    //定义外部设置属性
    var imageURL: NSURL? { // 加载传过来的图片链接,并加载显示出来
        didSet {
            cellImgView.sd_setImageWithURL(imageURL)
        }
    }
    //MARK: 重写构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(cellImgView)
        cellImgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView.snp_edges)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 设置UI 及布局
    
    //MARK: 懒加载所有的子控件
    lazy var cellImgView : UIImageView = {
        let temp : UIImageView = UIImageView()
        temp.clipsToBounds = true
        temp.contentMode = .ScaleAspectFit
        return temp
    }()
    //图片默认显示  scaletofill
}
