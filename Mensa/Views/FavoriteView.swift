//
//  FavoriteView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Test: Identifiable, Decodable {
    let id: String?
    let address: String;
}

struct FavoriteView: View {
    @EnvironmentObject private var globalStore: GlobalStore
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
         VStack{
            
             
             
             /*
         LottieView(filename: "19705-chef", loop: true).frame(height: 400, alignment: .center)
         
         Text("Sieht so aus, als hättest du noch keine Lieblingsmensa festgelegt. Du kannst dies in den Einstellungen tun.")
         .font(.callout)
         .multilineTextAlignment(.center)
         .foregroundColor(.secondary)
         .padding()
         
         Button{
         globalStore.selectedTab = 4
         } label: {
         Text("Zu den Einstellungen")
         }
         .padding(.top)
             */
         }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
