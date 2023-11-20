//
//  idealWeight.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 14.09.23.
//

import SwiftUI

struct IdealweightView: View {
   let viewModel: BmiViewModel

    var body: some View {
        Form {
            Section("Description") {
                Text("The ideal weight is a term used to describe the weight that is considered healthy and appropriate for a specific individual based on various factors such as height, gender, age, body composition, and health condition. It's important to note that ideal weight is not solely focused on aesthetics but primarily on maintaining health and well-being.")
            }
            Section("Overview of your Data") {
                HStack {
                    VStack {
                        Text("Gender")
                        Text("\(viewModel.selectedGender)")
                    }

                    Spacer()

                    VStack {
                        Text("Height")
                        Text("\(viewModel.bodyHeight) cm")
                    }

                    Spacer()

                    VStack {
                        Text("Weight")
                        Text("\(viewModel.bodyWeight) kg")
                    }
                }
            }

            Section {
                HStack {
                    Text("Your IdealWeight:")

                    Spacer()

                    Text("\(viewModel.yourIdealWeightString)")
                }
            }
        }
        .navigationTitle("Your Idealweight")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    IdealweightView(viewModel: BmiViewModel())
}
