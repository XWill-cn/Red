//
//  WaterfallVC.swift
//  Red
//
//  Created by 徐维 on 2021/2/19.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip
private let reuseIdentifier = "Cell"

class WaterfallVC: UICollectionViewController {
    var channel = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout;()
        layout.columnCount = 2 //两列
        layout.minimumColumnSpacing = kWaterfallPadding //列之间的间距
        layout.minimumInteritemSpacing = kWaterfallPadding//上下的cell 间距
        layout.sectionInset = UIEdgeInsets(top: 0, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding)//上下左右间距
        // layout.itemRenderDirection = .rightToLeft// (从右向左布局照片)
    }

  

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 13
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterfallCellID, for: indexPath) as! WaterfallCell
    
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1)")
        return cell
    }

  

}
// MARK: - CHTCollectionViewDelegateWaterfallLayout
extension WaterfallVC : CHTCollectionViewDelegateWaterfallLayout{
func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath!) -> CGSize {
    UIImage(named: "\(indexPath.item + 1)")!.size//图片是从1开始计数的
    }
}
  
// 用于复用
extension WaterfallVC : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    IndicatorInfo(title: channel)
    }
}
