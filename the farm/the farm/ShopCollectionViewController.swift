import UIKit

class ShopCollectionViewController: UICollectionViewController {
    
    // Создаем массив элементов коллекции
    var collectionItems: [CollectionItem] = [
        CollectionItem(image: UIImage(named: "image1"), label1: "Label 1", label2: "Label 2"),
        CollectionItem(image: UIImage(named: "image2"), label1: "Label 3", label2: "Label 4"),
        CollectionItem(image: UIImage(named: "image3"), label1: "Label 5", label2: "Label 6")
    ]
    
    //MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Возвращает количество секций в коллекции
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Возвращает количество элементов в секции коллекции
        return collectionItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Создаем ячейку коллекции
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MyCollectionViewCell else {
            fatalError("Unable to dequeue MyCollectionViewCell")
        }
        
        // Настраиваем элементы ячейки
        let collectionItem = collectionItems[indexPath.row]
        cell.configure(with: collectionItem)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ShopCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // Настраиваем размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let collectionWidth = collectionView.frame.width
        let widthPerItem = (collectionWidth - padding) / 2
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // Настраиваем отступы между ячейками в ряду
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
