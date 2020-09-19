//
//  DonationsViewController.swift
//  VKDonations
//
//  Created by Den Matyash on 11.09.2020.
//  Copyright © 2020 Den. All rights reserved.
//

import UIKit

class PodcastsViewController: ClosableUIViewController {
    
    private let containerView = UIView()
    
    private let label = BodyLabel().apply {
        $0.text = "У вас еще нет постов"
        $0.textAlignment = .center
    }
    
    private let actionButton = CommonButton().apply {
        $0.setTitle("Создать пост", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Посты"
        
        buildViewTree()
        setConstraints()
        
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func buildViewTree() {
        view.addSubview(containerView)
        [label, actionButton].forEach(containerView.addSubview)
    }
    
    private func setConstraints() {
        containerView.run {
            $0.centerInSuperview()
            $0.horizontalToSuperview()
        }
        
        label.run {
            $0.centerXToSuperview()
            $0.topToSuperview()
        }
        
        actionButton.run {
            $0.topToBottom(of: label, offset: 24)
            $0.centerXToSuperview()
            $0.bottomToSuperview()
        }
    }
    
    @objc func buttonTapped() {
        print("here")
        presentModal(AddPostViewController())
    }
}
