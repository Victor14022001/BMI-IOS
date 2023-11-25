//
//  SettingsViewNew.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 21.11.23.
//

import SwiftUI
import SwiftData

struct SettingsViewNew: View {
    @ObservedObject var viewModel: BmiViewModel
    
    @Environment(\.modelContext) var bmiContext
    @Environment(\.modelContext) var diaryContext
    @Environment(\.modelContext) var baiContext
    
    @State private var showBMIDeleteAlert = false
    @State private var showDiaryDeleteAlert = false
    @State private var showBAIDeleteAlert = false
    @State private var showMailSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlue")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Toggle("Darkmode", isOn: $viewModel.isDarkmodeEnabled)
                        .frame(maxWidth: 300, maxHeight: 40)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(.capsule)
 
                    NavigationLink {
                        BMIDataView()
                    } label: {
                        HStack {
                            Image(systemName: "list.clipboard")
                            Text("Show my BMI's")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)

                    NavigationLink {
                        BmiDataChartView()
                    } label: {
                        HStack {
                            Image(systemName: "chart.xyaxis.line")
                            Text("BMI History Chart")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
  
                    NavigationLink {
                        BaiDataView()
                    } label: {
                        HStack {
                            Image(systemName: "list.clipboard")
                            Text("Show my Bai's")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    
                    NavigationLink {
                        BaiDataChartView()
                    } label: {
                        HStack {
                            Image(systemName: "chart.xyaxis.line")
                            Text("BAI History Chart")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
 
                    Button {
                        showBMIDeleteAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete all BMI's")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    .alert(isPresented: $showBMIDeleteAlert) {
                        Alert(
                            title: Text("Are you sure to delete all saved BMI's?"),
                            message: Text("If you press 'Yes' all saved BMI's will be deleted"),
                            primaryButton: .destructive(Text("Cancel")),
                            secondaryButton: .default(Text("Yes"), action: {
                                do {
                                    try bmiContext.delete(model: BMIData.self)
                                } catch {
                                    print("Failed to delete data")
                                }
                            })
                        )
                    }
  
                    Button {
                        showDiaryDeleteAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete all Diaries")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    .alert(isPresented: $showDiaryDeleteAlert) {
                        Alert(
                            title: Text("Are you sure to delete all saved Diaries?"),
                            message: Text("If you press 'Yes' all saved Diaries will be deleted"),
                            primaryButton: .destructive(Text("Cancel")),
                            secondaryButton: .default(Text("Yes"), action: {
                                do {
                                    try diaryContext.delete(model: Diary.self)
                                } catch {
                                    print("Failed to delete data")
                                }
                            })
                        )
                    }
 
                    Button {
                        showBAIDeleteAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete all BAI's")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    .alert(isPresented: $showBAIDeleteAlert) {
                        Alert(
                            title: Text("Are you sure to delete all saved BAI's?"),
                            message: Text("If you press 'Yes' all saved BAI's will be deleted"),
                            primaryButton: .destructive(Text("Cancel")),
                            secondaryButton: .default(Text("Yes"), action: {
                                do {
                                    try baiContext.delete(model: BAIData.self)
                                } catch {
                                    print("Failed to delete data")
                                }
                            })
                        )
                    }
    
                    NavigationLink {
                        ChoicePDFView()
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Export Data to PDF")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    
                    Button {
                        showMailSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "mail")
                            Text("Contact the Support")
                        }
                    }
                    .frame(maxWidth: 300, maxHeight: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    .sheet(isPresented: $showMailSheet) {
                        SendMaillView()
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsViewNew(viewModel: BmiViewModel())
}
