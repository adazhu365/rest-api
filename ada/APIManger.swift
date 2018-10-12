
import UIKit
import SwiftyJSON
class APIManager: NSObject {
    
    let baseURL = "http://stardock.cs.virginia.edu/louslist/Courses/view/CS"
    static let sharedInstance = APIManager()
    
    func getPostWithId(postId: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
    
        let url : String = baseURL + String("/" + postId + "?json")
        
        
    let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
    request.httpMethod = "GET"
    let session = URLSession.shared
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
        if(error != nil){
            onFailure(error!)
        } else{
            let result = JSON(data: data!)
            onSuccess(result)
        }
    })
    task.resume()
}

}
