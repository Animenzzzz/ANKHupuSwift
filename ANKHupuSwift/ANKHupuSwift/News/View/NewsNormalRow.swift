//
//  NewsNormalCell.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

import SwiftUI


struct NewsNormalRow: View {
    
    var data:News
   
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
        
            Image(data.img!)
                .resizable()
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
