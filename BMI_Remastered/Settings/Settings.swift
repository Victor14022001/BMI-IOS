//
//  Settings.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 27.09.23.
//

import SwiftUI
import SwiftData

struct Settings: View {
    @ObservedObject var viewModel: BmiViewModel

    @Environment(\.modelContext) var context

    @Query private var datas: [BMIData] // TODO: Ungenutze Variable, kann gelöscht werden
    @Query var diary: [Diary] // TODO: Ungenutze Variable, kann gelöscht werden

    @Environment(\.modelContext) var diaryContext // TODO: Warum 2 context, es gibt nur einen! 2 sind nicht nötig
    @Environment(\.modelContext) var baiContext // TODO: Warum 2 context, es gibt nur einen! 2 sind nicht nötig
    @Query private var baiDatas: [BAIData] // TODO: Ungenutze Variable, kann gelöscht werden

    @State private var showBMIDeleteAlert = false
    @State private var showDiaryDeleteAlert = false
    @State private var showBAIDeleteAlert = false

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
                        Text("Show my BMI's")
                    }

                    NavigationLink {
                        BmiDataChartView()
                    } label: {
                        Text("BMI History Chart")
                    }
                }

                Section("BAI") {
                    NavigationLink {
                        BaiDataView()
                    } label: {
                        Text("Show my Bai's")
                    }

                    NavigationLink {
                        BaiDataChartView()
                    } label: {
                        Text("BAI History Chart")
                    }
                }

                Section("Delete your saved Data") {
                    Button {
                        showBMIDeleteAlert = true
                    } label: {
                        Text("Delete all BMI's")
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
                        Text("Delete all Diaries")
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
                        Text("Delete all BAI's")
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
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Settings(viewModel: BmiViewModel())
}
