//
//  Card.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct Card: View {
    var type: String
    var title: String
    var todaysOpeningHours: OpeningHoursItem
    var additionalInfo: String
    var pictureId: Int
    
    let columns = [
        GridItem(.fixed(22), alignment: .center),
        GridItem(.flexible(), alignment: .leading)
        ]
    
    let pictureHeight: CGFloat = 250
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            ZStack(alignment: .topLeading){
                // Banner image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image("\(pictureId)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: pictureHeight)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                }
                .frame(height: pictureHeight)
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.1),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                
                VStack(alignment: .leading, spacing: 5){
                    Text(type)
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .padding()
            }
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 4){
                    LazyVGrid(columns: columns, spacing: 10){
                        Image(systemName: "clock")
                        if(todaysOpeningHours.isOpen){
                            Text("\(todaysOpeningHours.opensAt) - \(todaysOpeningHours.closesAt) Uhr")
                                .lineSpacing(10)
                            
                            Text("\(Image(systemName: "fork.knife"))")
                            Text("Essensausgabe bis \(todaysOpeningHours.getFoodTill) Uhr")
                        } else {
                            Text("Geschlossen")
                        }
                            
                        if(additionalInfo != ""){
                            Image(systemName: "info.bubble")
                                .foregroundColor(.red)
                            Text("\(additionalInfo)")
                                .foregroundColor(.red)
                        }
                    }
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding([.horizontal, .bottom])
        }
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("BG"))
                .shadow(radius: 5)
        }
        .padding()
    }
}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(type: "Mensa", title: "Mensastraße", todaysOpeningHours: OpeningHoursItem(id: UUID(), opensAt: "10:00", closesAt: "12:00", getFoodTill: "11:30", isOpen: true), additionalInfo: "Wegen Krankheit geschlossen", pictureId: 10)
    }
}
