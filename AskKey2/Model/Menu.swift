import Foundation
import Firebase

struct Menu {
    let ref: DatabaseReference?
    let key: String
    let title: String
    let contents: String?
    let price: Int
    //데이터스냅샷을 받아와서 그 데이터로 설정해주는 코드입니다.
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let contents = value["contents"] as? String,
            let price = value["price"] as? Int else {
            return nil
        }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.contents = contents
        self.price = price
    }
}
