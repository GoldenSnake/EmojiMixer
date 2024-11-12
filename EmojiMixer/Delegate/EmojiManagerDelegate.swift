
import Foundation


final class EmojiManagerDelegate: EmojiMixerDelegateProtocol {
    
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
        "💡", "📱", "💻", "⌛️", "🔒",
        "🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏", "🍐", "🍒", "🍓", "🫐", "🥝", "🍅", "🫒", "🥥", "🥑", "🍆", "🥔", "🥕", "🌽", "🌶️", "🫑", "🥒", "🥬", "🥦", "🧄", "🧅", "🍄"
    ]
    
    //пустой массив для добавления эмодзи
    var visibleEmojies = [String]()
    
    func makeNewMix() {
        
    }
    
    func addRandomEmoji() {
        guard let randomEmoji = emojies.randomElement() else {
            print("addRandomEmoji: Не удалось выбрать randomEmoji")
            return}
        visibleEmojies.append(randomEmoji)
    }
    
    func undoLastEmoji() -> Int? {
        if !visibleEmojies.isEmpty { // Проверяем, что есть хотя бы один элемент в массиве
            let lastIndex = visibleEmojies.count - 1 // Определяем индекс последнего элемента
            visibleEmojies.removeLast() // Удаляем последний эмодзи из массива
            return lastIndex
        }
        return nil
    }
}
