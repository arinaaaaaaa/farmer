//
//  AnimalPicView.swift
//  the farm
//
//  Created by arina on 11.05.2023.
//

import UIKit

class AnimalPic: UIView {
    
    let animalPic = UIImageView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        animalPic.contentMode = .scaleAspectFit
        addSubview(animalPic)
        animalPic.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animalPic.topAnchor.constraint(equalTo: topAnchor),
            animalPic.leadingAnchor.constraint(equalTo: leadingAnchor),
            animalPic.trailingAnchor.constraint(equalTo: trailingAnchor),
            animalPic.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ imageName: String = "launch dog") {
        animalPic.image = UIImage(named: imageName)
    }
}
