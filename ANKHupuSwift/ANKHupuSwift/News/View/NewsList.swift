//
//  NormalNewsList.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

//            NavigationLink(destination: NewsNormalRow(data: newsData)) {
//                NewsNormalRow(data: newsData)
//            }

import SwiftUI

struct NewsList: View {
  
    @ObservedObject var store = DataStore()
    var tag: String
    var body: some View {
        List(store.newsDataList) {newsData in
            NewsNormalRow(data: newsData)
        }
        .padding(.top,40)
        .onAppear(perform: {
            if self.tag == "NBA"{
                self.store.fetchDalily()
            }
        })
    }
}

struct NormalNewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList(tag:"test")
    }
}
