//
//  CButton.swift
//  Todo
//
//  Created by DucDo on 07/08/2023.
//

import SwiftUI

struct CButton: View {
    let lable: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(lable)
                    .bold()
                    .foregroundColor(Color.white)
            }
            
        }
    }
}

struct CButton_Previews: PreviewProvider {
    static var previews: some View {
        CButton(lable: "Title", background: .blue) {
            
        }
    }
}
