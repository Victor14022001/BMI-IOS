//
//  SearchView.swift
//  HealthMetrics
//
//  Created by Victor Horn on 09.06.25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var product: Product? = nil
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Produkt suchen...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        searchProduct()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .padding()
                    }
                }

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }

                if let product = product {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.productName)
                            .font(.title)
                            .bold()
                            .padding(.bottom)

                        if let nutriments = product.nutriments {
                            Text("Kalorien: \(nutriments.energyKcal?.description ?? "Keine Angabe") kcal")
                            Text("Fett: \(nutriments.fat?.description ?? "Keine Angabe") g")
                            Text("Kohlenhydrate: \(nutriments.carbohydrates?.description ?? "Keine Angabe") g")
                            Text("Zucker: \(nutriments.sugars?.description ?? "Keine Angabe") g")
                            Text("Eiweiß: \(nutriments.proteins?.description ?? "Keine Angabe") g")
                            Text("Salz: \(nutriments.salt?.description ?? "Keine Angabe") g")
                        } else {
                            Text("Keine Nährwertangaben verfügbar.")
                        }
                    }
                    .padding()
                } else if !isLoading {
                    Text("Kein Produkt gefunden.")
                        .foregroundColor(.gray)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("Produktsuche")
        }
    }

    private func searchProduct() {
        guard !searchText.isEmpty else { return }

        let urlString = "https://world.openfoodfacts.org/cgi/search.pl?search_terms=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&search_simple=1&action=process&json=1"

        guard let url = URL(string: urlString) else { return }

        isLoading = true
        product = nil

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
            }

            if let data = data {
                do {
                    let result = try JSONDecoder().decode(SearchResult.self, from: data)
                    DispatchQueue.main.async {
                        if let firstProduct = result.products.first {
                            self.product = firstProduct
                        }
                    }
                } catch {
                    print("Fehler beim Decodieren: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct Product: Identifiable, Decodable {
    var id: String { code }
    let code: String
    let productName: String
    let nutriments: Nutriments?

    enum CodingKeys: String, CodingKey {
        case code
        case productName = "product_name"
        case nutriments
    }
}

struct Nutriments: Decodable {
    let energyKcal: Double?
    let fat: Double?
    let carbohydrates: Double?
    let sugars: Double?
    let proteins: Double?
    let salt: Double?

    enum CodingKeys: String, CodingKey {
        case energyKcal = "energy-kcal_100g"
        case fat = "fat_100g"
        case carbohydrates = "carbohydrates_100g"
        case sugars = "sugars_100g"
        case proteins = "proteins_100g"
        case salt = "salt_100g"
    }
}

struct SearchResult: Decodable {
    let products: [Product]
}
