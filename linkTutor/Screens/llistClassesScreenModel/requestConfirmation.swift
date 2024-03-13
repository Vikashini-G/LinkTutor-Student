//
//  EnrollementConfirmation.swift
//  linkTutor
//
//  Created by Aditya Pandey on 14/03/24.
//

import SwiftUI

struct requestConfirmation: View {
    var body: some View {
        NavigationStack {
            Text("Your request has been sent to Teacher")
                .font(AppFont.largeBold)
        }
    }
}

#Preview {
    requestConfirmation()
}
