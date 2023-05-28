import UIKit

extension UIImage {
    func grayscaleImage() -> UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir") else { return nil }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        guard let output = currentFilter.outputImage else { return nil }
        if let cgimg = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgimg)
        }
        return nil
    }
}

class HistoryTableViewController: UITableViewController {

    let cellId = "cellId"
    
    let dataArray = [("launch dog", "Вы были сконцентрированы 120 минут", "27.04.2023"),
                     ("launch dog", "Вы были сконцентрированы 60 минут", "27.04.2023"),
                     ("launch dog", "Сессия не завершена", "27.04.2023")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 80
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 0.06)

        let data = dataArray[indexPath.row]
        
        // Создание круга в качестве фона
        let circleView = UIView(frame: CGRect(x: 16, y: 8, width: 65, height: 65))
        if (data.1 == "Сессия не завершена") {
            circleView.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        }
        else {
            circleView.backgroundColor = UIColor(red: 1, green: 208/255, blue: 144/255, alpha: 1)
        }
        circleView.layer.cornerRadius = circleView.frame.width/2
        circleView.layer.masksToBounds = true
        circleView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(circleView)

        // Создание картинки
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFit
        if data.1 == "Сессия не завершена" {
            imageView.image = UIImage(named: data.0)?.grayscaleImage()
        } else {
            imageView.image = UIImage(named: data.0)
        }

        imageView.center = circleView.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(imageView)
        
    

        // Отображение заголовка
        let titleLabel = UILabel()
        titleLabel.text = data.1
        titleLabel.font = .systemFont(ofSize: 15, weight: .light)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(titleLabel)
        
        // Отображение даты
        let dateLabel = UILabel()
        dateLabel.text = data.2
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .gray
        dateLabel.numberOfLines = 0 // разрешает перенос текста на несколько строк
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(dateLabel)

        // Настройка constraints
        NSLayoutConstraint.activate([
            circleView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            circleView.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            circleView.widthAnchor.constraint(equalToConstant: 65),
            circleView.heightAnchor.constraint(equalToConstant: 65),
            imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: circleView.heightAnchor, multiplier: 0.8),
            titleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: circleView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -16)
        ])

        return cell
    }

}
