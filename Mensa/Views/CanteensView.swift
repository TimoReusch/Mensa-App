//
//  CanteensView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct Canteen: Identifiable, Hashable {
    var id = UUID()
    let name: String
}

struct Stock: Identifiable, Hashable {
    var id = UUID()
    let tickers: String
}

struct CanteensView: View {
    let Canteens: [Canteen] = [
        .init(name: "Hubland"),
        .init(name: "Studentenhaus")
    ]
    
    var body: some View {
        ScrollView{
            VStack{
                HStack(alignment: .bottom){
                    Text("Today")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.title2)
                    }
                }
                .padding()
            }
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}

struct CanteensView_Previews: PreviewProvider {
    static var previews: some View {
        CanteensView()
            .preferredColorScheme(.dark)
    }
}
