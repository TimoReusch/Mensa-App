//
//  SettingsView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var price: Price = .student
    @State private var location: Location = .wuerzburg
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Allgemeines")){
                        List {
                            Picker("💸 Preise", selection: $price) {
                                Text("Student").tag(Price.student)
                                Text("Beschäftigter").tag(Price.employee)
                                Text("Gast").tag(Price.guest)
                            }
                        }
                        List {
                            Picker("📍 Studienort", selection: $location) {
                                Text("Würzburg").tag(Location.wuerzburg)
                                Text("Schweinfurt").tag(Location.schweinfurt)
                                Text("Bamberg").tag(Location.bamberg)
                                Text("Aschaffenburg").tag(Location.aschaffenburg)
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
