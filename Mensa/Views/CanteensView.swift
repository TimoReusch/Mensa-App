//
//  CanteensView.swift
//  Mensa
//
//  Created by Timo Reusch on 25.08.22.
//

import SwiftUI

struct CanteensView: View {
    @State var currentCanteen: CanteenItem?
    
    @EnvironmentObject private var globalStore: GlobalStore
    
    // Matched Geometry Effect
    @Namespace var animation
    
    // Detail Animation Properties
    @State var animateView: Bool = false
    @State var animateContent: Bool = false
    @State var scrollOffset: CGFloat = 0
    
    let statusBarModifier = NavigationBarModifier(backgroundColor: .systemBackground)
        
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 0){
                HStack(alignment: .bottom){
                    Text("Mensen")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.title2)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .opacity(globalStore.showDetailView ? 0 : 1)
                
                ForEach(canteens) { item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                            currentCanteen = item
                            globalStore.showDetailView = true
                        }
                    } label: {
                        CardView(item: item)
                            .scaleEffect(currentCanteen?.id == item.id && globalStore.showDetailView ? 1 : 0.93)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(globalStore.showDetailView ? (currentCanteen?.id == item.id ? 1 : 0) : 1)
                }
            }
        }
        .modifier(statusBarModifier)
        .overlay {
            if let currentItem = currentCanteen, globalStore.showDetailView {
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .background(alignment: .top){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("BG"))
                .frame(height: animateView ? nil : 250, alignment: .top)
                .opacity(animateView ? 1 : 0)
                .ignoresSafeArea()
        }
        //.background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
    
    // CardView
    @ViewBuilder
    func CardView(item: CanteenItem)->some View{
        VStack(alignment: .leading, spacing: 15){
            ZStack(alignment: .topLeading){
                // Banner image
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image(item.mensaImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: 300)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                }
                .frame(height: 300)
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.2),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                
                VStack(alignment: .leading, spacing: 5){
                    Text("Mensateria")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(item.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .padding()
                .offset(y: currentCanteen?.id == item.id && animateView ? safeArea().top : 0)
            }
            
            HStack(spacing: 12){
                VStack(alignment: .leading, spacing: 4){
                    Text("Öffnugnszeiten")
                    Text("Gerade geschlossen")
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding([.horizontal, .bottom])
        }
        .background{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("BG"))
                .if(!globalStore.showDetailView) {
                    $0.shadow(radius: 5)
                }
        }
        .matchedGeometryEffect(id: item.id, in: animation)
        .statusBar(hidden: globalStore.showDetailView)
    }
    
    // Detail View
    func DetailView(item: CanteenItem) -> some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                CardView(item: item)
                    .scaleEffect(animateView ? 1 : 0.93)
                
                VStack(spacing: 15){
                    // Dummy text
                    Text(dummyText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom, 20)
                    Divider()
                    
                }
                .padding()
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                .opacity(animateContent ? 1 : 0)
                .scaleEffect(animateView ? 1 : 0, anchor: .top)
            }
            //.offset(y: scrollOffset > 0 ? -scrollOffset : 0)
            //.offset(offset: $scrollOffset)
        }
        .overlay(alignment: .topTrailing, content: {
            Button{
                // Close view
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)){
                    currentCanteen = nil
                    globalStore.showDetailView = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, safeArea().top)
            //.offset(y: -10)
            .opacity(animateView ? 1 : 0)
        })
        .onAppear{
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                animateView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)){
                animateContent = true
            }
        }
        .transition(.identity)
    }
}

struct CanteensView_Previews: PreviewProvider {
    static var previews: some View {
        CanteensView()
            .preferredColorScheme(.light)
    }
}

struct ScaledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

// Safe Area Value
extension View {
    func safeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
    
    // ScrollView Offset
    func offset(offset: Binding<CGFloat>) -> some View{
        return self
            .overlay{
                GeometryReader{ proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self) { value in
                    offset.wrappedValue = value
                }
            }
    }
}

// Offset Key
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
