//
//  SquadTableViewFooter.swift
//  UEFA
//
//  Created by Ovidiu Pop on 28.02.2022.
//

import UIKit

class SquadTableViewFooter: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var footerLabel: UILabel!
    
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
        Bundle.main.loadNibNamed("SquadTableViewFooter", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        
        footerLabel.text = UEFAConsts.SquadDetails.squadTableViewFooterLabel
    }
}
