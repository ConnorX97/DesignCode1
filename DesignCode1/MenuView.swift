//
//  MenuView.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 25/12/23.
//

import SwiftUI

struct MenuView: View {
    var backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1)
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:16){
                Text("Sherzod - 28% complete")
                    .font(.caption)
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black .opacity(0.08))
                    .cornerRadius(3)
                    .frame(width: 150, height: 24)
                    .background(.black .opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(icon: "gear", title: "Account")
                MenuRow(icon: "creditcard", title: "Billings")
                MenuRow(icon: "person.crop.circle", title: "Signout")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(colors: [.white, Color(backgroundColor)], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black .opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
            Image("avatar2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    MenuView()
}

struct MenuRow: View {
    var iconColor = #colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)
    var icon: String
    var title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(iconColor))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
