//
//  NearByVC.swift
//  Red
//
//  Created by 徐维 on 2021/2/1.
//

import UIKit
import XLPagerTabStrip



class NearByVC: UIViewController,IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
      IndicatorInfo(title: "附近")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

}


}
