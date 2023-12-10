//
//  ContentView.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.2)
                    , value: showCard)
            
            BackCardView()
                .frame(width:showCard ? 300 : 340 ,height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: 0, y: showCard ? -180 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10) ,axis: (x: 10, y: 0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: show)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: viewState)
                .animation(.easeInOut(duration: 0.5), value: showCard)
            BackCardView()
                .frame(width:340 ,height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: 0, y: showCard ? -140 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5) ,axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: viewState)
                .animation(.easeInOut(duration: 0.4), value: showCard)
            CardView()
                .frame(width: showCard ? 375 : 340.0 ,height: 220.0)
                .background(.black)
                //.cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: showCard)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: viewState)
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                            self.showCard = false
                        }
                        .onEnded { value in
                            self.viewState = .zero
                            self.show = false
                        }
                    
                )
            
            Text("\(bottomState.height)")
                .offset(y: -300)
                .foregroundColor(.red)
            
            BottomCardView()
                .offset(y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: showCard)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: bottomState)
                .gesture (
                    DragGesture ()
                        .onChanged { value in
                            self.bottomState = value.translation
                            if self.showFull {
                                self.bottomState.height += -300
                            }
                        }
                        .onEnded { value in
                            if self.bottomState.height > 50 {
                                self.showCard = false
                            }
                            if self.bottomState.height < -100 {
                                self.bottomState.height = -300
                                self.showFull = true
                            } else {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                            
                        }
                )
            
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                    .foregroundStyle(Color("accent"))            }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 70, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Sherzod  has archived the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}