
import UIKit

protocol EmojiMixerDelegateProtocol: AnyObject {
    var emojies: [String] { get }             // Массив доступных эмодзи
    var visibleEmojies: [String] { get set } // Массив видимых эмодзи
    var color: UIColor {get}
    func makeNewMix() -> String?
    func addRandomEmoji()
    func undoLastEmoji() -> Int?
}
