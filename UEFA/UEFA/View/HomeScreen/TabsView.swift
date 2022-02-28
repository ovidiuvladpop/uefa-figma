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
    public var underlineViews: [UIView]
    
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
    }
    
    public func highlightUnderlineView(index: Int, color: UIColor) {
        underlineViews.forEach { view in
            view.backgroundColor = view.tag == index ? color : .clear
        }
    }
}

extension UIButton {
    func customize() -> UIView {
        let underlineView = UIView.init(frame: CGRect.init(x: self.bounds.minX, y: self.bounds.maxY - 3, width: self.bounds.size.width, height: 3))
        underlineView.backgroundColor = .clear
        underlineView.tag = tag
        addSubview(underlineView)
        
        return underlineView
    }
}
