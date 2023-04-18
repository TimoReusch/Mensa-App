//
//  MenuView.swift
//  Mensa
//
//  Created by Timo Reusch on 10.04.23.
//

import SwiftUI

struct MenuView: View {
    let meals: [Meal]
    
    var body: some View {
        Grid(alignment: .top, horizontalSpacing: 1, verticalSpacing: 1) {
            ForEach(meals) { meal in
                GridRow {
                    Text(convertIngredientsToEmoji(text: meal.ingredients))
                    VStack(alignment: .leading){
                        Text(meal.name)
                            .bold()
                            .multilineTextAlignment(.leading)
                        
                        Text("Enthält: \(meal.allergens.joined(separator: ", "))")
                            .padding(.top, 0.05)
                            .foregroundColor(.secondary)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    Text(meal.priceStudent)
                }
                .padding()
                Divider()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(meals: TestMenuForOneDay().threeMenu)
    }
}
