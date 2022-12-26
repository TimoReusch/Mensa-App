//
//  CanteenView.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct CanteensView: View {
    @EnvironmentObject private var globalStore: GlobalStore
    
    @ObservedObject var model = ViewModel()
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(model.canteens) { canteen in
                        NavigationLink(value: canteen){
                            Card(type: canteen.type,
                                 title: canteen.name,
                                 todaysOpeningHours: canteen.openingHours.monday,
                                 additionalInfo: canteen.additionalInfo,
                                 pictureId: canteen.firebaseId
                            )
                        }
                    }
                }
            }
            .navigationTitle("Mensen")
            .navigationDestination(for: Canteen.self) { canteen in
                CanteenDetail(canteen: canteen)
            }
        }
    }
    
    init() {
        model.getCanteens(location: "Würzburg")
    }
}

struct CanteensView_Previews: PreviewProvider {
    static var previews: some View {
        CanteensView()
    }
}
