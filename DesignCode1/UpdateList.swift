//
//  UpdateList.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 25/12/23.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New Item", text: " Text ", date: "1Jan"))
    }
    
    var body: some View {
        NavigationView { 
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                } // delete gesture
                
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                } // move edit gesture
                
                
            }.listStyle(PlainListStyle())
            .navigationTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: {
                addUpdate()
            }, label: {
                Text("Add Update")
            }),
                                trailing: EditButton()
            )
        }
        
    }
}

#Preview {
    UpdateList()
}

