//
//  CustomModifierView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 02.12.23.
//

import SwiftUI

struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("appGrey"))
            .cornerRadius(10)
            .foregroundColor(Color("appOrange"))
            .font(.system(size: 24))
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("appOrange"))
            .cornerRadius(10)
            .foregroundColor(Color("appBlue"))
            .font(.headline)
    }
}
