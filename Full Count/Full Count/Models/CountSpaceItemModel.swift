import Foundation

// This is an immutable struct
struct CountSpaceItemModel: Identifiable, Codable {
    let id: String
    var title: String
    var value: Double
    var favorite: Bool

    // Prevent accidental changes to the date by making properties immutable outside of initialization
    init(id: String = UUID().uuidString, title: String, value: Double, favorite: Bool) {
        self.id = id // Allows manual setting or auto-creation of ID
        self.title = title
        self.value = value
        self.favorite = favorite
    }

    // Creates a new instance with an added value
    func addToValue(addAmount: Double) -> CountSpaceItemModel {
        return CountSpaceItemModel(id: id, title: title, value: value + addAmount, favorite: favorite)
    }

    // Updates the value in place
    mutating func addToValue(amount: Double) {
        self.value += amount
    }
    
    // Updates the value in place
    mutating func newFavorite(fav: Bool) {
        self.favorite = fav
    }

    // Updates the title in place
    mutating func updateTitle(newTitle: String) {
        self.title = newTitle
    }

    // Creates a new instance with a subtracted value
    func subtractToValue(addAmount: Double) -> CountSpaceItemModel {
        return CountSpaceItemModel(id: id, title: title, value: value - addAmount, favorite: favorite)
    }
}
