//
//  BmiChartNewView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 16.12.23.
//

import SwiftUI
import Charts

// TODO: - Creatae Chart struct in own file

struct BmiChartNewView: View {
    let viewModel: BmiViewModel
    var bmiValues: [BmiAverageChart]

    struct BmiAverageChart: Identifiable {
        var color: String
        var title: String
        var BMICount: Double?
        var id = UUID()
    }

    init(_ viewModel: BmiViewModel) {
        self.viewModel = viewModel

        self.bmiValues = [
            .init(color: "Blue", title: "average BMI", BMICount: 26.8),
            .init(color: "Green", title: "your BMI", BMICount: viewModel.yourBmi)
        ]
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Color("appBlue"))
                    .ignoresSafeArea(.all)
                
                VStack {
                    Chart {
                        ForEach(bmiValues) { data in
                            BarMark(
                                x: .value("Shape Type", data.title),
                                y: .value("Total Count", data.BMICount ?? 1.9)
                            )
                            .foregroundStyle(by: .value("Shape Color", data.color))
                        }
                    }
                }
            }
            .navigationTitle("BMI Chart")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    BmiChartNewView(BmiViewModel())
}
