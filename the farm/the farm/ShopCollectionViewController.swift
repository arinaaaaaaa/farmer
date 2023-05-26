import UIKit

class ShopCollectionViewController: UICollectionViewController {
    private let sectionInsets = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
    
    // Создаем массив элементов коллекции
    var collectionItems: [CollectionItem] = [
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790"),
        CollectionItem(image: UIImage(named: "launch dog"), name: "Сиба-ину Тако", cost: "790")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let itemsPerRow: CGFloat = 2
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingWidth
        let itemWidth = availableWidth / itemsPerRow
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*1.4)
        layout.sectionInset = sectionInsets
        layout.minimumLineSpacing = sectionInsets.left
        layout.minimumInteritemSpacing = sectionInsets.left
        
        collectionView.collectionViewLayout = layout
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MyCollectionViewCell else {
            fatalError("Unable to dequeue MyCollectionViewCell")
        }
        
        let collectionItem = collectionItems[indexPath.row]
        cell.configure(with: collectionItem)
        
        return cell
    }
}

class CollectionItem {
    var image: UIImage?
    var name: String
    var cost: String
    
    init(image: UIImage?, name: String, cost: String) {
        self.image = image
        self.name = name
        self.cost = cost
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let cost: UILabel = {
        let costLabel = UILabel()
        costLabel.font = UIFont.boldSystemFont(ofSize: 14)
        costLabel.textColor = .white
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        return costLabel
    }() // add cost label
    
    let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1.0, green: 0.82, blue: 0.56, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(name)
        contentView.addSubview(buyButton)

        buyButton.addSubview(cost)
        buyButton.addSubview(coinImageView)
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            myImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            name.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 8),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),

            // Update constraints for cost and coinImageView
            cost.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
            cost.trailingAnchor.constraint(equalTo: coinImageView.leadingAnchor, constant: -8),
            coinImageView.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
            coinImageView.trailingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: -8),
            
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buyButton.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            buyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            buyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        contentView.backgroundColor = UIColor(red: 1.0, green: 0.886, blue: 0.737, alpha: 1.0)
        contentView.layer.cornerRadius = 5.00
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with collectionItem: CollectionItem) {
        myImageView.image = collectionItem.image
        name.text = collectionItem.name
        cost.text = collectionItem.cost // set cost label text
    }
}
