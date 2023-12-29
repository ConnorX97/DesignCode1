//
//  UpdateDetail.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 26/12/23.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    UpdateDetail()
}
