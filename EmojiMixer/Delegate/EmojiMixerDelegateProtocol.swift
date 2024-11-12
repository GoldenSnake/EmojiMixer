
import Foundation

protocol EmojiMixerDelegateProtocol: AnyObject {
    var emojies: [String] { get }             // Массив доступных эмодзи
    var visibleEmojies: [String] { get set } // Массив видимых эмодзи
    func makeNewMix() -> String?
    func addRandomEmoji()
    func undoLastEmoji() -> Int?
}
