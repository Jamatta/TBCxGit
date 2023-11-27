//
//  ProductsListViewModel.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import Foundation

enum ProductsListError: Error {
    case networkError(String)
    case parsingError(String)
}

protocol ProductsListViewModelDelegate: AnyObject {
    func productsFetched(_ products: [ProductModel])
    func productsAmountChanged()
    func handleError(_ error: ProductsListError)
}

class ProductsListViewModel {
    
    weak var delegate: ProductsListViewModelDelegate?
    
    var products: [ProductModel]?
    private var _totalPrice: Double = 0.0
    
    func viewDidLoad() {
        fetchProducts()
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] response in
            switch response {
            case .success(let products):
                if self?.products == nil {
                    self?.products = []
                }
                self?.products?.append(contentsOf: products)
                self?.delegate?.productsFetched(products)
            case .failure(let Error):
                let networkErrorMessage = "Failed to fetch products. Please check your internet connection and try again."
                let customError = ProductsListError.networkError(networkErrorMessage)
                self?.delegate?.handleError(customError)
            }
        }
    }
    
    private func recalculateTotalPrice() {
        guard let products = products else {
            _totalPrice = 0.0
            return
        }
        
        let newTotalPrice = products.reduce(0.0) { $0 + ($1.price * Double($1.selectedAmount ?? 0)) }
        _totalPrice = newTotalPrice
    }
    
    func getTotalPrice() -> Double {
        return _totalPrice
    }
    
    func addProduct(at index: Int) {
        guard var product = products?[index] else {
            return
        }
        
        if product.stock > 0 {
            product.selectedAmount = (product.selectedAmount ?? 0) + 1
            product.stock -= 1
            products?[index] = product
            recalculateTotalPrice()
            delegate?.productsAmountChanged()
        } else {
            print("Product is out of stock!")
        }
    }
    
    func removeProduct(at index: Int) {
        guard var product = products?[index] else {
            return
        }
        
        if (product.selectedAmount ?? 0) > 0 {
            product.selectedAmount = (product.selectedAmount ?? 0) - 1
            product.stock += 1
            products?[index] = product
            recalculateTotalPrice()
            delegate?.productsAmountChanged()
        } else {
            print("No selected product to remove!")
        }
    }
}
