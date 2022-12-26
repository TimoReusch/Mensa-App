//
//  CanteenDetail.swift
//  Mensa
//
//  Created by Timo Reusch on 26.12.22.
//

import SwiftUI

struct CanteenDetail: View {
    var canteen: Canteen
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                // Banner image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image("hubland-nord")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: 300)
                }
                .frame(height: 300)
                
                LinearGradient(colors: [
                    .black.opacity(0.3),
                    .black.opacity(0.1),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Type")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("Title")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .padding()
            }
            Text(canteen.name)
        }
    }
}
/*
struct CanteenDetail_Previews: PreviewProvider {
    static var previews: some View {
        CanteenDetail()
    }
}
*/
