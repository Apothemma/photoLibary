//
//  PhotoCell.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//

import UIKit
import SDWebImage

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with intValue: Int)
}


class PhotoCell: UICollectionViewCell, SelfConfiguringCell {

    
    static var reuseId: String = "PhotoCell"

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true

        return imageView
    }()

    var unspachPhot: UnsplashPhoto! {
        didSet {
            let photoUrl = unspachPhot.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImageView.sd_setImage(with: url)

        }
    }
    
    

    override var isSelected: Bool {
        didSet {
            updatePhotoImageView()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPhotoImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updatePhotoImageView() {
        
        photoImageView.alpha = isSelected ? 0.7 : 1
    }

    private func setupPhotoImageView() {
        addSubview(photoImageView)
        
        photoImageView.frame = self.bounds

        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    func configure(with intValue: Int) {
        print(123)
    }
}
