//  Home.swift
//  DesignCode1
//  Created by Sherzod Fayziev on 25/12/23.

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var colorBackground = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    var body: some View {
        ZStack {
                Color(colorBackground)
                    .edgesIgnoringSafeArea(.all)
                
                HomeView(showProfile: $showProfile)
                    .padding(.top, 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30 : 0, style: .continuous))
                    .shadow(color: .black .opacity(0.2), radius: 20, x: 0, y: 20)
                    .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                    .offset(y: showProfile ? -400 : 0)
                    .scaleEffect(showProfile ? 0.9 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: showProfile)
                    .edgesIgnoringSafeArea(.all)
                
                MenuView()
                    .background(.black .opacity(0.001))
                    .offset(y: showProfile ? 0 : screen.height )
                    .offset(y: viewState.height)
                    .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: showProfile)
                    .onTapGesture {
                        self.showProfile.toggle()
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.viewState = value.translation
                                if self.viewState.height < -1 {
                                    self.viewState.height = 0
                                }
                            }
                            .onEnded { value in
                                if self.viewState.height > 50 {
                                    self.showProfile = false
                                }
                                self.viewState = .zero
                            }
                    )
            
        }
    }
}

#Preview {
    Home()
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    var body: some View {
        Button(action: {
            self.showProfile.toggle()
        }, label: {
            Image("avatar2")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        })
    }
}

let screen = UIScreen.main.bounds
