//
//  DataStore.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

import Foundation
import Alamofire

struct News: Identifiable {
    var id: String
    var title: String
    var author: String
    var date: String
    var content: String
    var thumbnail: String
}

final class DataStore:ObservableObject{
    
    @Published var newsList: [News] = []
    
    func fetchDalily(){
        
        
        let urlStr = "http://onapp.yahibo.top/public/?s=api/test/list"
        Alamofire.request(urlStr).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
        }
        
        let daliy: NSArray = ["fas","fasfd"]
        for (index, newsDict) in daliy.enumerated() {
            if let newsDict = newsDict as? [String: Any] {
                let news = News(id: String(index), title: newsDict["title"] as! String, author: newsDict["author"] as! String, date: newsDict["date"] as! String, content: newsDict["content"] as! String, thumbnail: newsDict["thumbnail"] as! String)
                newsList.append(news)
            }
        }
    }
    
}
 
