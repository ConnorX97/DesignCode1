//  HomeView.swift
//  DesignCode1
//  Created by Sherzod Fayziev on 25/12/23.

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    

   // #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    
    var body: some View {
            VStack {
                HStack {
                    Text("Watching")
                      //  .font(.system(size: 28, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    Button(action: {
                        self.showUpdate.toggle()
                    }, label: {
                        Image(systemName: "bell")
                            //.renderingMode(.original)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: .black .opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: .black .opacity(0.2), radius: 10, x: 0, y: 10)
                    })
                    .sheet(isPresented: $showUpdate, content: {
                        UpdateList()
                    })
                    
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                WatchRingsView()
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global) .minX - 30) / -20
                                                           ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                
                Spacer()
        }
    }
}

#Preview {
    HomeView(showProfile: .constant(false))
}

struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
                
            }
            Text(section.text .uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal,20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color .opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))),
    
    Section(title: "Build a SwiftUI app", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card5")), color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    
    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
    
    
]

//#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)

//#imageLiteral(resourceName: "Card4")

struct WatchRingsView: View {
    var color1 = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    var color2 = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    var body: some View {
        HStack(spacing: 14.0) {
            HStack(spacing: 12.0) {
                RingView(color1: color1, color2: color2, width: 44, height: 44, percent: 78, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                    
                    
                }
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(spacing: 12.0) {
                RingView(color1: UIColor(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), color2: UIColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), width: 44, height: 44, percent: 57, show: .constant(true))
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2:#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 36, show: .constant(true))
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
