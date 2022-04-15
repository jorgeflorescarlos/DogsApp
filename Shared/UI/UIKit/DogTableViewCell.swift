//
//  DogTableViewCell.swift
//  DogsApp (iOS)
//
//  Created by Jorge Flores Carlos on 15/04/22.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    static let identifier = "DogTableViewCell"
    static let nib = UINib(nibName: "DogTableViewCell", bundle: .main)
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var dogDescription: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var card: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photo.layer.cornerRadius = 10.0
        photo.clipsToBounds = true
        card.layer.cornerRadius = 10.0
        dogDescription.textColor = UIColor(hexString: Constants.Colors.mainColor)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with dog: Dog) {
        name.text = dog.name
        dogDescription.text = dog.description
        age.text = "\(dog.age) years"
        photo.load(url: URL(string: dog.image)!)
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
