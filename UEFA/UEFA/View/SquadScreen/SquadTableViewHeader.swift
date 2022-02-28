//
//  SquadTableViewHeader.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import UIKit

class SquadTableViewHeader: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: Private
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SquadTableViewHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    // MARK: Public
    
    public func setHeader(name: String, backgroundColor: UIColor) {
        sectionNameLabel.text = name
        contentView.backgroundColor = backgroundColor
    }
}
