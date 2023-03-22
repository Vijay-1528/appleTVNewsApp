//
//  NewsDetailCell.swift
//  TVNews
//
//  Created by VIJAY M on 28/02/23.
//

import UIKit

class NewsDetailCell: UICollectionViewCell {
    
    // OUTLET PROPERTIES
    
    @IBOutlet weak var imgView: RemoteImageView!
//    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var unfocusedConstraint: NSLayoutConstraint!
    
    var focusedConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        focusedConstraint = detailLbl.topAnchor.constraint(equalTo: imgView.focusedFrameGuide.bottomAnchor, constant: 1)
    }
    
    override func updateConstraints() {
         super.updateConstraints()
        focusedConstraint.isActive = isFocused
        unfocusedConstraint.isActive = !isFocused
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        coordinator.addCoordinatedAnimations({
            self.layoutIfNeeded()
        })
    }
    
}
