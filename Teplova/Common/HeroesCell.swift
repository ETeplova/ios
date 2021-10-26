import UIKit

class HeroesCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(hero:Hero) {
        self.heroImage.image = hero.image
        self.heroImage.backgroundColor = .black
        backgroundColor = .black
    }
}
