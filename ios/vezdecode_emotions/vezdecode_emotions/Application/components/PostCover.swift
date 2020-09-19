//
//  PostCover.swift
//  VKDonations
//
//  Created by Den Matyash on 11.09.2020.
//  Copyright © 2020 Den. All rights reserved.
//

import Foundation
import UIKit

class PostCover: UIView {

    private let contentView = UIView()
    
    private let imageIcon = UIImageView(image: UIImage(named: "ic_image"))
    
    private let photoView = UIImageView().apply {
        $0.contentMode = .scaleAspectFill
    }
    
    private let closeView = CloseView().apply {
        $0.isHidden = true
    }
    
    var onClick: (() -> ()) = {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        buildViewTree()
        setConstraints()
        
        layer.cornerRadius = 10
        clipsToBounds = true
        
        layer.run {
            $0.cornerRadius = 10
            $0.borderWidth = 0.5
            $0.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            $0.backgroundColor = UIColor(red: 0.949, green: 0.953, blue: 0.961, alpha: 1).cgColor
        }
        
        onTap(target: self, action: #selector(coverTapped))
        closeView.onTap(target: self, action: #selector(deletePhoto))
    }
    
    private func buildViewTree() {
        addSubview(imageIcon)
        addSubview(photoView)
        addSubview(closeView)
    }
    
    private func setConstraints() {
        imageIcon.centerInSuperview()
        photoView.edgesToSuperview()
        
        closeView.run {
            $0.width(16)
            $0.height(16)
            $0.trailingToSuperview(offset: 4)
            $0.topToSuperview(offset: 4)
        }
    }
    
    @objc func coverTapped() {
        if photoView.image == nil {
            onClick()
        }
    }
    
    func setPhoto(_ image: UIImage) {
        photoView.image = image
        layoutSubviews()
        closeView.isHidden = false
    }
    
    @objc func deletePhoto() {
        photoView.image = nil
        layoutSubviews()
        closeView.isHidden = true
    }
}
