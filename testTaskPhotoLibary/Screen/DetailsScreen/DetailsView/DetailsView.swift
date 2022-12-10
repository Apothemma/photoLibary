//
//  DetailsView.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import UIKit
import SDWebImage

var data = ["urlImage": "", "userPhotoUrl": "", "userName": "", "countLike": "", "date": ""]
var kf: Double = 1.0


class DetailsView: UIView {
    private var photoData: UnsplashPhoto?
    
    let sharedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "upload"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 25)
        label.text = "Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "left"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let photoImage: UIImageView = {
        let image = UIImageView()
        let url = URL(string: data["urlImage"]!)
        image.sd_setImage(with: url)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userPhotoImage: UIImageView = {
        let image = UIImageView()
        let url = URL(string: data["userPhotoUrl"]!)
        image.sd_setImage(with: url)
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 25)
        label.text = data["userName"]
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        let text = data["countLike"]! + " likes"
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 20)
        label.text = data["date"]
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDetailsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDetailsView() {
        addSubview(photoImage)
        addSubview(userPhotoImage)
        addSubview(userNameLabel)
        addSubview(likeLabel)
        addSubview(dateLabel)
        addSubview(likeButton)
        addSubview(sharedButton)
        addSubview(titleLabel)
        addSubview(backButton)
        
        
        let width = 350
        var height = kf * Double(width)
        if height > 510.0 {
            height = Double(510)
        }
        
        
        
        photoImage.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        photoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoImage.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        photoImage.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: photoImage.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: photoImage.topAnchor, constant: -10).isActive = true
        
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: photoImage.leftAnchor, constant: 4).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        sharedButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        sharedButton.rightAnchor.constraint(equalTo: photoImage.rightAnchor, constant: -4).isActive = true
        sharedButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sharedButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        userPhotoImage.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 20).isActive = true
        userPhotoImage.leftAnchor.constraint(equalTo: photoImage.leftAnchor).isActive = true
        userPhotoImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userPhotoImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        userNameLabel.centerYAnchor.constraint(equalTo: userPhotoImage.centerYAnchor).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: userPhotoImage.rightAnchor, constant: 20).isActive = true
        
        likeButton.centerYAnchor.constraint(equalTo: userNameLabel.centerYAnchor, constant: 3).isActive = true
        likeButton.rightAnchor.constraint(equalTo: photoImage.rightAnchor, constant: 0).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        likeLabel.leftAnchor.constraint(equalTo: userPhotoImage.leftAnchor, constant: 3).isActive = true
        likeLabel.topAnchor.constraint(equalTo: userPhotoImage.bottomAnchor, constant: 10).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo: likeLabel.leftAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor).isActive = true
        
    }
    
    
    
    func delegateDataPhotos(userName: String?, countLike: String?, dateAt: String?, photoUser: String?, image: String?) {
        if userName != nil {
            data["userName"] = userName!
            data["countLike"] = countLike!
            data["date"] = dateAt!
            data["userPhotoUrl"] = photoUser!
            data["urlImage"] = image!
            kf = 1.15
            
        }
    }
    
    func delegateDataPhotos(photosData: UnsplashPhoto) {
        photoData = photosData
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        data["urlImage"] = photosData.urls["regular"]
        kf = Double(photosData.height) / Double(photosData.width)
        data["userPhotoUrl"] = photosData.user.profile_image["medium"]
        data["userName"] = photosData.user.name
        
        if photosData.likes > 999 && photosData.likes < 1000000 {
            var countLike = String(photosData.likes / 1000) + ","
            if String(photosData.likes % 1000).count == 3 {
                countLike += String(photosData.likes % 1000)
            } else if String(photosData.likes % 1000).count == 2 {
                countLike += "0" + String(photosData.likes % 1000)
            } else if String(photosData.likes % 1000).count == 1 {
                countLike += "00" + String(photosData.likes % 1000)
            } else if String(photosData.likes % 1000).count == 0 {
                countLike += "000"
            }
            data["countLike"] = countLike
        } else if photosData.likes > 999999 {
            let countLike = String(photosData.likes / 1000000) + "," + String((photosData.likes % 1000000) / 1000) + "," + String(photosData.likes % 1000)
            data["countLike"] = countLike
        } else {
            data["countLike"] = String(photosData.likes)
        }
        
        
        var year = ""
        var month = ""
        var day = ""
        var i = 0
        for char in photosData.created_at {
            year += String(char)
            i += 1
            if i == 4 {
                i = 0
                break
            }
        }
        for char in photosData.created_at {
            i += 1
            if i == 6 {
                if Int(String(char)) != 0 {
                    month += String(char)
                }
            } else if i == 7 {
                month += String(char)
                i = 0
                break
            }
        }
        for char in photosData.created_at {
            i += 1
            if i == 9 {
                if Int(String(char)) != 0 {
                    day += String(char)
                }
            } else if i == 10 {
                day += String(char)
                i = 0
                break
            }
        }
        
        let monthh = ["1": "Jan", "2": "Feb", "3": "Mar", "4": "Apr", "5": "May", "6": "June", "7": "July", "8": "Aug", "9": "Sep", "10": "Oct", "11": "Nov", "12": "Dec"]
        
        data["date"] = "Publiched on " + monthh[month]! + " \(day), \(year)"
    }
    
    
}

