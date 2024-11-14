
import UIKit

protocol EmojiMixerDelegateProtocol: AnyObject {
    var emojis: [String] { get }             // Массив доступных эмодзи
    var visibleEmojis: [EmojiMix] { get set } // Массив видимых эмодзи
    func makeNewMix() -> EmojiMix? 
    func addRandomEmoji()
    func undoLastEmoji() -> Int?
}
