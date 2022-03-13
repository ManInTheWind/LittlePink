//
//  HomeVCViewController.swift
//  LittlePink
//
//  Created by kangkang on 2022/3/10.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        //MARK: selectedbar下方的条的样式
        
        //1.整体bar--在sb上设置
        
        //2.selectedBar -- 按钮下方的条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        //3.buttonBarItem -- 文本或图片的按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16.0)
        
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
        let followVC = self.storyboard!.instantiateViewController(identifier: kFollowVCID)
        let discoverVC = self.storyboard!.instantiateViewController(identifier: kDiscoverVCID)
        let nearByVC = self.storyboard!.instantiateViewController(identifier: kNearByVCID)
        return [discoverVC,followVC,nearByVC]
    }

}
