//
//  HomeVC.swift
//  Red
//
//  Created by 徐维 on 2021/2/1.
//

import UIKit
import XLPagerTabStrip


class HomeVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        // MARK: 设置最上面的Bar 关注 附近 发现
        
        
        
        //2.最上方选中按钮下方的条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main Color")!
        settings.style.selectedBarHeight = 3
        //3.buttonbaritem 文本图片 按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        settings.style.buttonBarItemLeftRightMargin = 0
        
        
        super.viewDidLoad()
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel//未被选中的颜色
            newCell?.label.textColor = .label //选中之后的颜色
        }
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) ->
    [UIViewController] {
        let FollowVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let DiscoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        let NearByVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
        return [DiscoveryVC, FollowVC, NearByVC]
        
    }
   
}
