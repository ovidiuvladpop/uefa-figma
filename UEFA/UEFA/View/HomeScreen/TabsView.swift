//
//  TabsView.swift
//  UEFA
//
//  Created by Ovidiu Pop on 26.02.2022.
//

import UIKit

class TabsView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var matchesButton: UIButton!
    @IBOutlet weak var groupsButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var squadButton: UIButton!
    
    public var actionButtons: [UIButton]
    private var underlineViews: [UIView]
    
    // MARK: Init
    
    override init(frame: CGRect) {
        self.actionButtons = [UIButton]()
        self.underlineViews = [UIView]()
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        self.actionButtons = [UIButton]()
        self.underlineViews = [UIView]()
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: Private
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TabsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        
        setupButtons()
        actionButtons = [overviewButton, matchesButton, groupsButton, statsButton, squadButton]
        actionButtons.forEach { actionButton in
            underlineViews.append(actionButton.customize())
        }
    }
    
    private func setupButtons() {
        overviewButton.setTitle(UEFAConsts.HomeScreen.HomeScreenTabs.overview, for: .normal)
        matchesButton.setTitle(UEFAConsts.HomeScreen.HomeScreenTabs.matches, for: .normal)
        groupsButton.setTitle(UEFAConsts.HomeScreen.HomeScreenTabs.groups, for: .normal)
        statsButton.setTitle(UEFAConsts.HomeScreen.HomeScreenTabs.stats, for: .normal)
        squadButton.setTitle(UEFAConsts.HomeScreen.HomeScreenTabs.squad, for: .normal)
    }
    
    // MARK: Public
    
    public func highlightTabElement(index: Int) {
        actionButtons.forEach { button in
            button.isSelected = button.tag == index
        }
        
        underlineViews.forEach { view in
            view.backgroundColor = view.tag == index ? UIColor(red: 90 / 255, green: 247 / 255, blue: 220 / 255, alpha: 1) : .clear
        }
    }
}

extension UIButton {
    func customize() -> UIView {
        setTitleColor(UIColor(red: 90 / 255, green: 247 / 255, blue: 220 / 255, alpha: 1), for: .selected)
        setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.8), for: .normal)
        
        let underlineView = UIView.init(frame: CGRect.init(x: self.bounds.minX, y: self.bounds.maxY, width: self.bounds.size.width, height: 3))
        underlineView.backgroundColor = .clear
        underlineView.tag = tag
        addSubview(underlineView)
        
        return underlineView
    }
}
