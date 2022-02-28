//
//  SquadTableViewCell.swift
//  UEFA
//
//  Created by Ovidiu Pop on 27.02.2022.
//

import UIKit

class SquadTableViewCell: UITableViewCell {
    
    public static let cellIdentifier = "SquadTableViewCellIdentifier"
    public static let nib = "SquadTableViewCell"
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNamelLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    private var viewModel: SquadCellViewModel?
    
    public static func register(tableView: UITableView) {
        tableView.register(UINib(nibName: nib,
                                 bundle: Bundle(for: SquadTableViewCell.self)),
                           forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Public
    
    public func setup(viewModel: SquadCellViewModel) {
        self.viewModel = viewModel
        guard let playerAvatar = UIImage.playerAvatar() else { return }
        playerImageView.image = playerAvatar
        playerNamelLabel.text = viewModel.playerName
        countryNameLabel.text = viewModel.country
        statusLabel.text = viewModel.status
    }
}
