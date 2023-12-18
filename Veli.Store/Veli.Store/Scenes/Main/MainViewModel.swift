//
//  MainViewModel.swift
//  Veli.Store
//
//  Created by Nika Jamatashvili on 18.12.23.
//

import SwiftUI
import NetworkManager

final class MainViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var products: [Product] = []
    @Published var error: String?
    
    
    init() {
        fetchProducts()
    }
    
    //MARK: Fetch
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.products = data.products
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
        )
    }
}

//MARK: Download Image
struct URLImage: View {
    let urlString: String
    let imageWidht: Int
    let imageHeight: Int
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: CGFloat(imageWidht), height: CGFloat(imageHeight))
                .background(AppColors.backgroundSecondary)
                .cornerRadius(8)
        }
        else {
            Image(systemName: "photo.fill")
                .font(Font.system(size: CGFloat(imageWidht / 4)))
                .frame(width: CGFloat(imageWidht), height: CGFloat(imageHeight))
                .background(AppColors.backgroundSecondary)
                .foregroundColor(AppColors.textSecondary)
                .cornerRadius(8)
                .onAppear{
                    fetchImage()
                }
        }
    }
    
    private func fetchImage() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data,
            _, _ in
            self.data = data
        }
        task.resume()
    }
}
