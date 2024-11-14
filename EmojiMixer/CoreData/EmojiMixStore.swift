import UIKit
import CoreData

final class EmojiMixStore {
    private let context: NSManagedObjectContext
    private let uiColorMarshalling = UIColorMarshalling()

    convenience init() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        self.init(context: context)
    }

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func addNewEmojiMix(_ emojiMix: EmojiMix) throws {
        let emojiMixCoreData = EmojiMixCoreData(context: context)
        updateExistingEmojiMix(emojiMixCoreData, with: emojiMix)
        try context.save()
    }

    func updateExistingEmojiMix(_ emojiMixCorData: EmojiMixCoreData, with mix: EmojiMix) {
        emojiMixCorData.emojis = mix.emojis
        emojiMixCorData.colorHex = uiColorMarshalling.hexString(from: mix.backgroundColor)
    }
}

