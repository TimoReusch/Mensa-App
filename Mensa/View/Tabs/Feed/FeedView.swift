//
//  FeedView.swift
//  Mensa
//
//  Created by Timo Reusch on 06.03.23.
//

import SwiftUI

struct FeedView: View {
    @State private var showSettings = false
    @State private var showAbout = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text(getTodaysDate())
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    Spacer()
                }
                
                NavigationLink{
                    // FoodProviderDetailView(id: …)
                } label: {
                    Card(type: "Mensa", title: "Mensastraße", todaysOpeningHours: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "12:00", getFoodTill: "11:30", isOpen: true), additionalInfo: "Wegen Krankheit geschlossen", imageName: "burse_am_studentenhaus_wuerzburg")
                }
            }
            .navigationTitle("Heute")
            .navigationDestination(for: FoodProvider.self) { foodProvider in
                FoodProviderDetailView(foodProvider: foodProvider)
            }
            .navigationBarItems(
                leading: Button(action: {
                    self.showAbout.toggle()
                }, label: {
                    Image("App Logo")
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
                }),
                trailing: Button(action: {
                    self.showSettings.toggle()
                }, label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }))
            .sheet(isPresented: $showSettings){
                SettingsView(showSettings: $showSettings)
            }
            .sheet(isPresented: $showAbout) {
                AboutView(showAbout: $showAbout)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
