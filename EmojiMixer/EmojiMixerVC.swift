
import UIKit

class EmojiMixerVC: UIViewController {
    
    private let undoButton = UIBarButtonItem()
    private let addButton = UIBarButtonItem()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let emojies = [
        // Улыбки и лица
        "😀", "😂", "😊", "😍", "😜",
        // Жесты и руки
        "👍", "👎", "👌", "👏", "🙏",
        // Люди и деятельность
        "💃", "🕺", "👫", "👩‍❤️‍👨", "👨‍👩‍👧",
        // Животные и природа
        "🐶", "🐱", "🐰", "🦁", "🐼",
        // Еда и напитки
        "🍏", "🍕", "🍔", "🍣", "🍫",
        // Путешествия и транспорт
        "✈️", "🚗", "🚀", "🚁", "🚲",
        // Символы и объекты
        "💡", "📱", "💻", "⌛️", "🔒"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        setupNavigationBar()
        setupCollectionView()
        
    }
    
    
    // MARK: - NavigationBar
    
    private func setupNavigationBar() {
        setupNavBarItemLeft()
        setupNavBarItemRight()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Emoji Mixer"
        
    }
    
    private func setupNavBarItemLeft() {
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))//1
        addButton.image = image
        addButton.tintColor = .black
        addButton.target = self
        addButton.action = #selector(addButtonDidTap)
        navigationItem.leftBarButtonItem = addButton
    }
    
    private func setupNavBarItemRight() {
        undoButton.title = "Undo"
        undoButton.tintColor = .black
        undoButton.target = self
        undoButton.action = #selector(undoButtonDidTap)
        navigationItem.rightBarButtonItem = undoButton
    }
    
    // MARK: - CollectionView
    
    func setupCollectionView() {
        
        //register
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        //DataSourse
        collectionView.dataSource = self
        
        setupCollectionConstraints()
    }
    
    func setupCollectionConstraints() {
            // Устанавливаем авто-лайаут
            collectionView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    
    // MARK: - @objc
    @objc private func addButtonDidTap() {
        print("Add tapped!")
    }
    
    @objc private func undoButtonDidTap() {
        print("Undo tapped!")
    }
    
}


// MARK: - UICollectionViewDataSource

extension EmojiMixerVC: UICollectionViewDataSource {
    
    //кол-во элементов
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    //настройка ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray // Цвет фона для ячейки
        return cell
    }
}
