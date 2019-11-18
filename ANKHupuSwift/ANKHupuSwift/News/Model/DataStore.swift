//
//  DataStore.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class News: NSObject,Identifiable {
    var id: String?
    var title: String?
    var replies: String?
    var uptime: String?
    var img: String?
    var read: String?
    var lights: String?
    
    init(id: String?,title: String?,replies: String?,uptime: String?,img: String?,read: String?,lights: String?) {
        super.init()
        self.id = id
        self.title = title
        self.replies = replies
        self.uptime = uptime
        self.img = img
        self.read = read
        self.lights = lights
    }

}

final class DataStore:ObservableObject{
    
    @Published var newsDataList: [News] = []
    
    func fetchDalily(){
        
        let urlStr = "https://games.mobileapi.hupu.com/3/7.3.12/nba/getNews?news_first_navi=NBA&first_navi_numbers=2&preload=0&direc=next&num=20&client=c77bc7cfa00b1800f399938c4b3720aae4783b2a&clientId=30980511&advId=E12875A5-1076-4C57-9488-B5311B604032&_ssid=VFQtUXVXYW4xN0Y&night=0&crt=1557906702&time_zone=Asia%2FShanghai&sign=3366090f5a1d473a7b9ff3904c816af7"
        Alamofire.request(urlStr).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                let dataDic = json as? NSDictionary
                let dicData = (dataDic!.object(forKey: "result")) as? NSDictionary
                let realData = dicData?.object(forKey: "data") as? [NSDictionary]
                
                for item in realData!{
                    let news1 = News(id: item.object(forKey: "nid") as? String, title: item.object(forKey: "title") as? String, replies: item.object(forKey: "replies") as? String, uptime: item.object(forKey: "uptime") as? String, img: item.object(forKey: "img") as? String, read: item.object(forKey: "read") as? String, lights: item.object(forKey: "lights") as? String)
                    self.newsDataList.append(news1)
                }
             
            case .failure(let error):
                print("\(error)")
                break
            }
        }
    }
    
}
 
