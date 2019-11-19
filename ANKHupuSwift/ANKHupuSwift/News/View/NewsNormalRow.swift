//
//  NewsNormalCell.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

import SwiftUI
import Combine

struct NewsNormalRow: View {
    
    let data:News
   
    var body: some View {
        
        HStack {
            VStack {
                Text(verbatim: data.title!)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.system(size: 17))
                Spacer()
                HStack {
                    Image("comment")
                        .resizable()
                        .frame(width: 13, height: 13)
                    Text(verbatim: data.replies!)
                        .foregroundColor(Color(red: 138.0/255, green: 138.0/255, blue: 138.0/255, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 13))
                    Image("light")
                        .resizable()
                        .frame(width: 13, height: 13)
                    Text(verbatim: data.lights!)
                        .foregroundColor(Color(red: 138.0/255, green: 138.0/255, blue: 138.0/255, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 13))
                    Spacer()
                    Text(verbatim: "置顶")
                        .font(.system(size: 13))
                        .foregroundColor(Color.red)
                    Text(verbatim: "专题")
                        .font(.system(size: 13))
                        .foregroundColor(Color.red)
                }
            }
            Spacer()
            ImageViewContainer(imageURL: data.img!)
                .frame(width: 100, height: 75)
        }
        .frame(height: 106)
        .padding(.trailing,15)
        .padding(.leading,14)
        .padding(.top,15)
    }
}

struct NewsNormalCell_Previews: PreviewProvider {
    static var previews: some View {
        
        NewsNormalRow(data: News(id: "id", title: "这个是一个预览的测试的标题，要很长很长才能看得出效果", replies: "12345678", uptime: "uptime", img: "img", read: "read", lights: "374"))
    }
}

@available(iOS 13.0, *)
struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL

    init(imageURL: String) {
        remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }

    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty) ? UIImage(imageLiteralResourceName: "IUIU") : UIImage(data: remoteImageURL.data)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

@available(iOS 13.0, *)
class RemoteImageURL: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    @Published var data = Data() {
        didSet {
            update()
        }
    }
    
    func update() {
        didChange.send(data)
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}
