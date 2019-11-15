//
//  NormalNewsList.swift
//  ANKHupuSwift
//
//  Created by Animenzzz on 2019/11/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

import SwiftUI

struct NewsList: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.newsDataList) {newsss in
            Text("\(newsss.title!)")
        }
        .onAppear(perform: { self.store.fetchDalily()})
    }
}

struct NormalNewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
