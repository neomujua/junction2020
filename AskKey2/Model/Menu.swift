import Foundation
import Firebase

struct Menu {
    let ref: DatabaseReference?
    let key: String
    let title: String
    let contents: String?
    let price: String
    //데이터스냅샷을 받아와서 그 데이터로 설정해주는 코드입니다.
    init?(snapshot: DataSnapshot) {
        let value = snapshot.value as! [String:AnyObject]
            let title = value["title"] as! String
            let contents = value["description"] as! String
            let price = value["price"] as! String
            
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.contents = contents
        self.price = price
    }
}
