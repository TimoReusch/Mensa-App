//
//  CanteenViewModel.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation
import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var canteens = [Canteen]()
    
    func getCanteens(location: String?){
        let db = Firestore.firestore()
        var query: Query = db.collection("foodProviders").whereField("category", isEqualTo: "Canteen")
        
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
                            return Canteen(
                                id: UUID(),
                                name: d["name"] as? String ?? "",
                                location: d["location"] as? String ?? "",
                                type: d["type"] as? String ?? "",
                                info: d["info"] as? String ?? "",
                                additionalInfo: d["additionalInfo"] as? String ?? "",
                                address: d["address"] as? String ?? "",
                                description_de: d["description_de"] as? String ?? ""
                            )
                        }
                    }
                }
            }
        }
    }
}
