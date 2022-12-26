//
//  Card.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct Card: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            ZStack(alignment: .topLeading){
                // Banner image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image("hubland-nord")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: 300)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                }
                .frame(height: 300)
                
                LinearGradient(colors: [
                    .black.opacity(0.3),
                    .black.opacity(0.1),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                
                VStack(alignment: .leading, spacing: 5){
                    Text(splitName(name: title)[0])
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(splitName(name: title)[1])
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .padding()
            }
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 4){
                    Text("openinghours")
                    //todaysOpeningHours(openingHours: item.openingHours)
                        .lineSpacing(10)
                    Text("additionalInfo")
                    //if(item.additionalInfo != ""){
                    //    Text(item.additionalInfo)
                    //}
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
        Card(title: "Test")
    }
}
