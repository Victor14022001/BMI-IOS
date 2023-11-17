//
//  Settings.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @ObservedObject var viewModel: BmiViewModel

    @Environment(\.modelContext) var context
    @Environment(\.modelContext) var diaryContext
    @Environment(\.modelContext) var baiContext

    @State private var showBMIDeleteAlert = false
    @State private var showDiaryDeleteAlert = false
    @State private var showBAIDeleteAlert = false

    @State private var showMailSheet = false
    
    @State private var showPDFDialog = false

    var body: some View {
        NavigationView {
            Form {
                Section("Color Scheme") {
                    Toggle("Darkmode", isOn: $viewModel.isDarkmodeEnabled)
                }

                Section("BMI") {
                    NavigationLink {
                        BMIDataView()
                    } label: {
                        HStack {
                            Image(systemName: "list.clipboard")
                            Text("Show my BMI's")
                        }
                    }

                    NavigationLink {
                        BmiDataChartView()
                    } label: {
                        HStack {
                            Image(systemName: "chart.xyaxis.line")
                            Text("BMI History Chart")
                        }
                    }
                }

                Section("BAI") {
                    NavigationLink {
                        BaiDataView()
                    } label: {
                        HStack {
                            Image(systemName: "list.clipboard")
                            Text("Show my Bai's")
                        }
                    }

                    NavigationLink {
                        BaiDataChartView()
                    } label: {
                        HStack {
                            Image(systemName: "chart.xyaxis.line")
                            Text("BAI History Chart")
                        }
                    }
                }

                Section("Delete your saved Data") {
                    Button {
                        showBMIDeleteAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete all BMI's")
                        }
                    }
                    .foregroundColor(.red)
                    .alert(isPresented: $showBMIDeleteAlert) {
                        Alert(
                            title: Text("Are you sure to delete all saved BMI's?"),
                            message: Text("If you press 'Yes' all saved BMI's will be deleted"),
                            primaryButton: .destructive(Text("Cancel")),
                            secondaryButton: .default(Text("Yes"), action: {
                                do {
                                    try context.delete(model: BMIData.self)
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
                    .foregroundColor(.red)
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
                    .foregroundColor(.red)
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
                }

                Section {
                    Button {
                        showPDFDialog = true
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Export Data to PDF")
                        }
                    }
                    .confirmationDialog("Export Bodydetails to PDF", isPresented: $showPDFDialog) {
                        Button("Wxport BMI") { }
                        Button("Export BAI") { }
                        Button("Export both") { }
                    } message: {
                        Text("Exprt Bodydetails to PDF")
                    }
                }

                Section {
                    Button {
                        showMailSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "mail")
                            Text("Contact the Support")
                        }
                    }
                    .sheet(isPresented: $showMailSheet) {
                        SendMaillView()
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView(viewModel: BmiViewModel())
}
