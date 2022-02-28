//
//  HeaderView.swift
//  UEFA
//
//  Created by Ovidiu Pop on 25.02.2022.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
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
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    // MARK: Public
    
    public func setBackground(image: UIImage) {
        backgroundView.image = image
    }
}
