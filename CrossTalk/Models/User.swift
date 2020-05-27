import UIKit

//has to be reference type - representation of user only one time

class User {
    static let local = User()
    
    let id = UUID()
    var name: String { UIDevice.current.name }
    
    private init() {}
}
