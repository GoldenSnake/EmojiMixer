
import Foundation
import UIKit


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
    var color = UIColor()
    
    func makeNewMix() -> String?  {
        guard let first = emojies.randomElement() else {return nil}
        guard let second = emojies.randomElement() else {return nil}
        guard let third = emojies.randomElement() else {return nil}
        color = makeColor((first, second, third))
        print(color)
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
    
    func makeColor(_ emojis: (String, String, String)) -> UIColor {
        func cgfloat256(_ t: String) -> CGFloat {
            let value = t.unicodeScalars.reduce(Int(0)) { r, t in
                return r + Int(t.value)
            }
            return CGFloat(value % 128) / 255.0 + 0.25
        }
        return UIColor(
            red: cgfloat256(emojis.0),
            green: cgfloat256(emojis.1),
            blue: cgfloat256(emojis.2),
            alpha: 1
        )
    }
}
