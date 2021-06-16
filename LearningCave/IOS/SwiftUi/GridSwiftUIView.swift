//
//  GridSwiftUIView.swift
//  Tumble
//
//  Created by Shilpa M on 02/06/21.
//

import SwiftUI

struct GridSwiftUIView: View {
    let data = (1...10).map{"items\($0)"}
    let rows = [
        GridItem(.fixed(100))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment : .center) {
                ForEach(data, id : \.self) { item in
                    Text("Heading\(item)")
                }
            }
        }
        
    }
}

struct GridSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GridSwiftUIView()
    }
}
