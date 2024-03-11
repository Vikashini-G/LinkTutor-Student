//
//  accentHeader.swift
//  linkTutor
//
//  Created by user2 on 30/01/24.
//

import SwiftUI

struct accentHeader: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .foregroundColor(Color.accent)
            RoundedRectangle(cornerRadius: 50)
                .frame(maxWidth: .infinity, maxHeight: 130)
                .foregroundColor(Color.accent)
                .cornerRadius(50)
                .offset(y: 100)
        }
        
    }
}

#Preview {
    accentHeader()
}
