//
//  DessertCell.swift
//  MealDB
//
//  Created by csuftitan on 10/27/23.
//

import UIKit

class DessertCell: UICollectionViewCell {

    @IBOutlet weak var dessertBackgroundView: UIView!
    @IBOutlet weak var dessertImageView: UIImageView!
    @IBOutlet weak var dessertLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var meal: Dessert.Meal? {
        didSet { // Property Observer
            dessertDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        let size:CGFloat = (screenWidth) / 2.4
        widthConstraint.constant = size
        heightConstraint.constant = size
        
        dessertBackgroundView.backgroundColor = .white
        dessertBackgroundView.clipsToBounds = true
        dessertBackgroundView.layer.cornerRadius = 5
        
        dessertImageView.clipsToBounds = true
        dessertImageView.layer.cornerRadius = 5
        dessertImageView.contentMode = .scaleAspectFill
        dessertImageView.dropShadow()
        
        dessertLabel.textColor = .white
        dessertLabel.numberOfLines = 2
        dessertLabel.textAlignment = .center
        dessertLabel.clipsToBounds=true
        dessertLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }

    func dessertDetailConfiguration() {
        guard let meal else { return }
        dessertLabel.text = meal.strMeal
        dessertImageView.setImage(with: meal.strMealThumb)
    }
}
