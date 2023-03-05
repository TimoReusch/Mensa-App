//
//  SettingsView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct SettingsView: View {
    
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
                        List {
                            Picker("📍 Studienort", selection: $location) {
                                Text("Würzburg").tag("Würzburg")
                                Text("Schweinfurt").tag("Schweinfurt")
                                Text("Bamberg").tag("Bamberg")
                                Text("Aschaffenburg").tag("Aschaffenburg")
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
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
