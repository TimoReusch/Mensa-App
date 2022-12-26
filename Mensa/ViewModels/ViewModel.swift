//
//  ViewModel.swift
//  Mensa
//
//  Created by Timo Reusch on 29.10.22.
//

import Foundation
import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var canteens = [Canteen]()
    
    func getCanteens(location: String?){
        let db = Firestore.firestore()
        var query: Query = db.collection("foodProviders").whereField("category", isEqualTo: "Canteen").whereField("name", isNotEqualTo: "Sprachenzentrum")
        if(location != nil){
            query = query.whereField("location", in: [location!])
        }
        
        query.getDocuments { snapshot, error in
            if error == nil {
                // No errors present
                if let snapshot = snapshot {
                    // Update list property in main thread
                    DispatchQueue.main.async {
                        self.canteens = snapshot.documents.map { d in
                            let weekdays: [String] = ["mon", "tue", "wed", "thu", "fri"]
                            var weekdaysArray: [OpeningHoursItem] = []
                            
                            for day in weekdays {
                                let currentDay = d["hours_\(day)"] as? [Any] ?? []
                                weekdaysArray.append(OpeningHoursItem(
                                    id: UUID(),
                                    opensAt: currentDay[0] as? String ?? "",
                                    closesAt: currentDay[1] as? String ?? "",
                                    getFoodTill: currentDay[2] as? String ?? "",
                                    isOpen: currentDay[3] as? Bool ?? false
                                ))
                            }
                            
                            let openingHours: OpeningHours = OpeningHours(
                                id: UUID(),
                                monday: weekdaysArray[0],
                                tuesday: weekdaysArray[1],
                                wednesday: weekdaysArray[2],
                                thursday: weekdaysArray[3],
                                friday: weekdaysArray[4]
                            )
                            
                            return Canteen(
                                id: UUID(),
                                firebaseId: d["id"] as? Int ?? 0,
                                name: d["name"] as? String ?? "",
                                location: d["location"] as? String ?? "",
                                type: d["type"] as? String ?? "",
                                info: d["info"] as? String ?? "",
                                additionalInfo: d["additionalInfo"] as? String ?? "",
                                address: d["address"] as? String ?? "",
                                description_de: d["description_de"] as? String ?? "",
                                openingHours: openingHours
                            )
                        }
                    }
                }
            }
        }
    }
}
