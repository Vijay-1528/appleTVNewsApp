//
//  NewsCell.swift
//  TVNews
//
//  Created by VIJAY M on 28/02/23.
//

import UIKit

class NewsCell: UICollectionViewCell {
    // OUTLET PROPERTIES
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var unfocusedConstrains: NSLayoutConstraint!
    
    var focusedConstraints: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        focusedConstraints = descLbl.topAnchor.constraint(equalTo: detailImg.focusedFrameGuide.bottomAnchor, constant: 15)
    }
    
    override func updateConstraints() {
         super.updateConstraints()
        focusedConstraints.isActive = isFocused
        unfocusedConstrains.isActive = !isFocused
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        coordinator.addCoordinatedAnimations({
            self.layoutIfNeeded()
        })
    }
    
}
