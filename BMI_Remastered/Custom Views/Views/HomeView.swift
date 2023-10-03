//
//  HommeView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 30.09.23.
//

import SwiftUI

struct HomeView: View {
    @State private var weight = ""
    @State private var height = ""
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("HealthMetrics")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.init(red: 11 / 255, green: 24 / 255, blue: 54 / 255))
                
                Text("Body mass index BMI is a measure of body fat based on height and weight that applies to")
                
                
                
                HStack(spacing: 20) {
                    Button {
                        // button action here
                    } label: {
                        VStack {
                            Text("Male")
                                .padding(.vertical, 60)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                    
                    
                    Button {
                        // button action here
                    } label: {
                        VStack {
                            Text("Female")
                                .padding(.vertical, 60)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)
                
                // Spacer()
                
                VStack(spacing: 20) {
                    TextField("Height", text: $height)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                    
                    TextField("Weight", text: $weight)
                        .textFieldStyle(MyTextFieldStyle())
                }
                .padding(.top, 40)
                
                Spacer()
                
            }
        }
        .padding(.horizontal, 20)
        
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        ).padding()
    }
}

#Preview {
    HomeView()
}
