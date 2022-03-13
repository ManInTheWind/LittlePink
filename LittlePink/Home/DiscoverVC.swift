//
//  DiscoverVC.swift
//  LittlePink
//
//  Created by kangkang on 2022/3/10.
//

import UIKit
import XLPagerTabStrip

class DiscoverVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        
        settings.style.selectedBarHeight = 0.0
        settings.style.buttonBarItemBackgroundColor = .clear
        
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14.0)
        super.viewDidLoad()
        
        containerView.bounces = false
        //4.改变选中的item的label选中颜色
        changeCurrentIndexProgressive = {
            (oldCell : ButtonBarViewCell?,
             newCell: ButtonBarViewCell?,
             progressPercentage: CGFloat,
             changeCurrentIndex: Bool,
             animated: Bool
            ) -> Void in
            
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }

        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        var vcs: [UIViewController] = []
        for channel in kChannels {
            
            let vc = self.storyboard!.instantiateViewController(identifier: kWaterFallVCID) as WaterFallVC
            vc.channel = channel
            vcs.append(vc)
        }
        return vcs
        
        
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "发现")
    }
    
}
