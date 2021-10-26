import UIKit
import PagingCollectionViewLayout

class MenuViewController: UIViewController {
    
    let cellWidth = (1 - 0.2) * UIScreen.main.bounds.width
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    let cellSpacing = (1 / 8) * UIScreen.main.bounds.width
    let cellHeight = (6 / 10) * UIScreen.main.bounds.height
    
    let menu = Menu()
    let cellId = Constants.Strings.heroesCell.rawValue
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.Strings.labelText.rawValue
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.Strings.logoName.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.setup()
        design()
        registerCollectionViewCells()
        applyConstraints()
    }
    
    private func design() {
        view.backgroundColor = .black
    }
    
    private func registerCollectionViewCells() {
        self.collectionView.register(UINib(nibName: Constants.Strings.heroesCell.rawValue, bundle: nil), forCellWithReuseIdentifier: Constants.Strings.heroesCell.rawValue)
    }
    
    fileprivate func setUpImageView() {
        imageView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: -180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setUpLabel() {
        label.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: -70).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setUpCollectionView() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
    }
    
    private func applyConstraints() {
        view.addSubview(collectionView)
        view.addSubview(label)
        view.addSubview(imageView)
        
        setUpImageView()
        setUpLabel()
        setUpCollectionView()
    }
}

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HeroesCell
        cell.heroImage.image = menu.heroes[indexPath.item].image
        cell.heroImage.backgroundColor = .white
        cell.nameLabel.text = menu.heroes[indexPath.item].name
        return cell
    }
}
