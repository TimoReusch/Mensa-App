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
                    Section(header: Text("Allgemeines")){
                        List {
                            Picker("💸 Preise", selection: $price) {
                                Text("Student").tag("priceStudent")
                                Text("Beschäftigter").tag("priceEmployee")
                                Text("Gast").tag("priceGuest")
                            }
                        }
                    }
                    Section(header: Text("Hier schmeckt's am besten"),
                            footer: Text("Du kannst hier die Mensa auswählen, die du meistens besuchst. Der Menüplan wird dir dann im \"Lieblingsmensa\"-Tab (welches auch die Startseite der App ist), sowie dem Homescreen-Widget angezeigt.")){
                        NavigationLink{
                            
                        } label: {
                            Text("♥️ Lieblingsmensa")
                        }
                    }
                    Section(){
                        NavigationLink{
                            AboutView()
                        } label: {
                            Text("Über das Projekt")
                        }
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .navigationBarItems(
                trailing: Button(action: {
                    self.showSettings.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                }))
        }
    }
}

struct BindingViewExamplePreviewContainer_2 : View {
     @State
     private var value = false

     var body: some View {
          SettingsView(showSettings: $value)
     }
}

#if DEBUG
struct BindingViewExample_2_Previews : PreviewProvider {
    static var previews: some View {
        BindingViewExamplePreviewContainer_2()
    }
}
#endif
