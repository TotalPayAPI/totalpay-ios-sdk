//
//  AkuratecoButton.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit

final class AkuratecoButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        backgroundColor = .orange
        contentEdgeInsets = .init(top: 13, left: 13, bottom: 13, right: 13)
        layer.cornerRadius = 8
        
        tintColor = .white
    }
}
