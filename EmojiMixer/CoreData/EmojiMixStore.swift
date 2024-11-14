import UIKit
import CoreData

enum EmojiMixStoreError: Error {
    case decodingErrorInvalidEmojies
    case decodingErrorInvalidColorHex
}


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
    
    func fetchEmojiMixes() throws -> [EmojiMix] {
        let fetchRequest = EmojiMixCoreData.fetchRequest()
        let emojiMixesFromCoreData = try context.fetch(fetchRequest)
        return try emojiMixesFromCoreData.map { try self.emojiMix(from: $0) }
    }


    func addNewEmojiMix(_ emojiMix: EmojiMix) throws {
        let emojiMixCoreData = EmojiMixCoreData(context: context)
        updateExistingEmojiMix(emojiMixCoreData, with: emojiMix)
        try context.save()
        print("Save")
    }

    func updateExistingEmojiMix(_ emojiMixCorData: EmojiMixCoreData, with mix: EmojiMix) {
        emojiMixCorData.emojis = mix.emojis
        emojiMixCorData.colorHex = uiColorMarshalling.hexString(from: mix.backgroundColor)
    }
    
    func emojiMix(from emojiMixCorData: EmojiMixCoreData) throws -> EmojiMix {
        guard let emojis = emojiMixCorData.emojis else {
            throw EmojiMixStoreError.decodingErrorInvalidEmojies
        }
        guard let colorHex = emojiMixCorData.colorHex else {
            throw EmojiMixStoreError.decodingErrorInvalidEmojies
        }
        return EmojiMix(
            emojis: emojis,
            backgroundColor: uiColorMarshalling.color(from: colorHex)
        )
    }

    
}

