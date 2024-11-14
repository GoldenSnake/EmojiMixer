
import Foundation
import UIKit


final class EmojiManagerDelegate: EmojiMixerDelegateProtocol {
    
    let emojis = [
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
        guard let first = emojis.randomElement() else {return nil}
        guard let second = emojis.randomElement() else {return nil}
        guard let third = emojis.randomElement() else {return nil}
        let color = makeColor((first, second, third))
        print(color)
        
        let randomMix = first + second + third
        print(randomMix)
        return EmojiMix(emojis: randomMix, backgroundColor: color)
    }
    
    func addRandomEmoji() -> EmojiMix? {
        
        guard let randomEmoji = makeNewMix() else {
            print("addRandomEmoji: Не удалось выбрать randomEmoji")
            return nil}
        visibleEmojis.append(randomEmoji)
        return randomEmoji
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
