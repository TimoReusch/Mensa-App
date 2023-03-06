//
//  SettingsView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    
    @AppStorage("userStatus") private var price = "priceStudent"
    @AppStorage("userLocation") private var location = "Würzburg"
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(){
                        List {
                            Picker("💸 Preise", selection: $price) {
                                Text("Student").tag("priceStudent")
                                Text("Beschäftigter").tag("priceEmployee")
                                Text("Gast").tag("priceGuest")
                            }
                        }
                    }
                    Section(header: Text("Hier schmeckt's am besten"),
                            footer: Text("Du kannst hier die Mensen & Cafeterien auswählen, die du meistens besuchst. Die heutigen Menüs und Öffnungszeiten werden dir dann in deinem Feed angezeigt. Mit einem Klick auf die jeweilige Mensa/Cafeteria erhältst du eine Detailansicht mit weiteren Informationen (z.B. Auslastung, Menüplan & Öffnungszeiten für die komplette Woche).")){
                        NavigationLink{
                            
                        } label: {
                            Text("🍽️ Meine Mensen")
                        }
                        NavigationLink{
                            
                        } label: {
                            Text("☕️ Meine Cafeterien")
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .navigationBarItems(
                trailing: Button(action: {
                    self.showSettings.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                }))
        }
    }
}

struct BindingViewSettingsViewContainer : View {
     @State
     private var value = false

     var body: some View {
          SettingsView(showSettings: $value)
     }
}

#if DEBUG
struct BindingViewSettingsViewContainer_Previews : PreviewProvider {
    static var previews: some View {
        BindingViewSettingsViewContainer()
    }
}
#endif
