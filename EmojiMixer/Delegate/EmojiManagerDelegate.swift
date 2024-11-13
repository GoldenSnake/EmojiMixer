
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
    var visibleEmojis = [EmojiMix]()
    
    func makeNewMix() -> EmojiMix?  {
        guard let first = emojies.randomElement() else {return nil}
        guard let second = emojies.randomElement() else {return nil}
        guard let third = emojies.randomElement() else {return nil}
        let color = makeColor((first, second, third))
        print(color)
        
        let randomMix = first + second + third
        print(randomMix)
        return EmojiMix(emojis: randomMix, backgroundColor: color)
    }
    
    func addRandomEmoji() {
        
        guard let randomEmoji = makeNewMix() else {
            print("addRandomEmoji: Не удалось выбрать randomEmoji")
            return}
        visibleEmojis.append(randomEmoji)
    }
    
    func undoLastEmoji() -> Int? {
        if !visibleEmojis.isEmpty { // Проверяем, что есть хотя бы один элемент в массиве
            let lastIndex = visibleEmojis.count - 1 // Определяем индекс последнего элемента
            visibleEmojis.removeLast() // Удаляем последний эмодзи из массива
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
