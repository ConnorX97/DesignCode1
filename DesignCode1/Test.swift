//
//  Test.swift
//  DesignCode1
//
//  Created by Sherzod Fayziev on 27/12/23.
//

import SwiftUI

struct Test: View {
    var body: some View {
            List(0 ..< 40) { item in
                    Text("Data")  
        }
    }
}

#Preview {
    Test()
}
