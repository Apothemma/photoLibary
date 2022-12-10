//
//  FavouriteCell.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 09.12.2022.
//

import UIKit
import CoreData

class FavouriteCell: UICollectionViewCell {
    static var reuseId: String = "FavouriteCell"
    
    let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userPhotoImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 14
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heartRed"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func loadData (userName: String?, urlUserPhoto: String?, urlPhoto: String?) {
        if userName == nil {
            let defoultURL = "https://images.unsplash.com/photo-1505118380757-91f5f5632de0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODY2MzF8MHwxfHNlYXJjaHw2fHxzdW1tZXJ8ZW58MHx8fHwxNjcwNTQxMjEz&ixlib=rb-4.0.3&q=80&w=1080"
            userNameLabel.text = "userName"
            photoImage.sd_setImage(with: URL(string: defoultURL))
            userPhotoImage.sd_setImage(with: URL(string: defoultURL))
        } else {
            if userName!.count > 15 {
                userNameLabel.text = userName
                userNameLabel.font = UIFont(name: "ChalkboardSE-Regular", size: 12)
            } else {
                userNameLabel.text = userName
            }
            photoImage.sd_setImage(with: URL(string: urlPhoto!))
            userPhotoImage.sd_setImage(with: URL(string: urlUserPhoto!))
        }
    }
    
    override var isSelected: Bool {
        didSet {
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(photoImage)
        addSubview(userPhotoImage)
        addSubview(userNameLabel)
        addSubview(likeButton)
        
        photoImage.frame = self.bounds
        
        likeButton.addTarget(self, action: #selector(didDeleteFavouritePhoto), for: .touchUpInside)

        
        photoImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photoImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        
        userPhotoImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        userPhotoImage.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 5).isActive = true
        userPhotoImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        userPhotoImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        userNameLabel.centerYAnchor.constraint(equalTo: userPhotoImage.centerYAnchor).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: userPhotoImage.rightAnchor, constant: 5).isActive = true
        
        likeButton.centerYAnchor.constraint(equalTo: userNameLabel.centerYAnchor).isActive = true
        likeButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    @objc
    func didDeleteFavouritePhoto () {
        let fethRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PhotosCoreData")

        do {
            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
            for value in results as! [PhotosCoreData]{
                if value.userName == userNameLabel.text || value.userName == nil {
                    CoreDataManager.instatnse.context.delete(value)
                }
            }
        } catch {
            print("error")
        }
        CoreDataManager.instatnse.saveContext()
    }
}
