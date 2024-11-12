
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
    
    func makeNewMix() -> String?  {
        guard let first = emojies.randomElement() else {return nil}
        guard let second = emojies.randomElement() else {return nil}
        guard let third = emojies.randomElement() else {return nil}
        let randomMix = first + second + third
        print(randomMix)
        return randomMix
    }
    
    func addRandomEmoji() {
        
        guard let randomEmoji = makeNewMix() else {
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
