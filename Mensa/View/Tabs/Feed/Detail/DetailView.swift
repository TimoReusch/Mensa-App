//
//  CanteenDetail.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct FoodProviderDetailView: View {
    @State private var descriptionExpanded: Bool = false
    @State private var menusExpanded: Bool = true
    @State private var selectedDay = 0
    
    let columns = [
        GridItem(.flexible(maximum: 20), alignment: .top),
        GridItem(.flexible(), alignment: .topLeading)
    ]
    
    var foodProvider: FoodProvider
    let weekdays: [String] = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"]
    
    var body: some View {
        ScrollView{
            VStack {
                GeometryReader{proxy in
                    Image("burse_am_studentenhaus_wuerzburg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: 150)
                }.frame(height: 210)
                
                DisclosureGroup("Über diese Mensa", isExpanded: $descriptionExpanded) {
                    Text(foodProvider.description_de)
                        .padding(.top)
                }
                .tint(Color("logo_green"))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("secondary_accent"))
                )
                .padding([.top, .leading, .trailing])
                
                SegmentedControlView(selectedIndex: $selectedDay, titles: weekdays)
                
                switch(selectedDay) {
                case 0:
                    VStack{
                        HStack {
                            Image(systemName: "clock")
                            if(foodProvider.openingHours.monday.isOpen){
                                Text("\(foodProvider.openingHours.monday.opensAt) - \(foodProvider.openingHours.monday.getFoodTill) (\(foodProvider.openingHours.monday.closesAt)) Uhr")
                                    .lineSpacing(10)
                            } else {
                                Text("Geschlossen")
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("secondary_accent"))
                        )
                        .padding(.top)
                        
                        MenuView(meals: foodProvider.menusCurrentWeek.monday)
                    }
                case 1: Text("2")
                case 2: Text("3")
                default:
                    Text("Keine Daten für diesen Tag.")
                }
            }
            
            VStack{
                Text("Adresse & Google Maps Widget")
                Text("Auslastung")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(foodProvider.type).font(.system(size: 12.0)).foregroundColor(.gray)
                    Text(foodProvider.name).font(.subheadline).fontWeight(.bold)
                }
            }
        }
    }
}


struct FoodProviderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodProviderDetailView(foodProvider: TestFoodProviders().foodProvider1)
    }
}
