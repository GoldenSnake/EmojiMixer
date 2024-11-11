
import UIKit

class EmojiMixerVC: UIViewController {
    
    private let undoButton = UIBarButtonItem()
    private let addButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
    }
    // MARK: - NavigationBar
    
    private func setupNavigationBar() {
        
        setupNavBarItemLeft()
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
    
    
    // MARK: - @objc
    @objc private func addButtonDidTap() {
        print("Add tapped!")
    }
    
    @objc private func undoButtonDidTap() {
        print("Undo tapped!")
    }
    
}

