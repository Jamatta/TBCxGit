//
//  MethodsTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Nika Jamatashvili on 05.12.23.
//

import XCTest
@testable import UnitTestingAssignment


class MethodsTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUp() {
        super.setUp()
        cartViewModel = CartViewModel()
    }
    
    override func tearDown() {
        cartViewModel = nil
        super.tearDown()
    }
    
    func testTotalPriceCalculation() {
        // Assuming
        let mockProducts = [
            Product(id: 1, price: 10.0, selectedQuantity: 2),
            Product(id: 2, price: 15.0, selectedQuantity: 3)
        ]
        
        // Set
        cartViewModel.selectedProducts = mockProducts
        
        // Test
        let expectedTotalPrice = (10.0 * 2) + (15.0 * 3)
        XCTAssertEqual(cartViewModel.totalPrice, expectedTotalPrice)
    }
    
    func testAddProductWithID() {
        // Assuming
        let mockProducts = [Product(id: 1, price: 10.0, selectedQuantity: 0)]
        
        // Set
        cartViewModel.allproducts = mockProducts
        
        // Test
        cartViewModel.addProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, 1)
    }
    
    func testAddProductDirectly() {
        // Assuming
        let mockProduct = Product(id: 3, price: 20.0, selectedQuantity: 0)
        
        // Test
        cartViewModel.addProduct(product: mockProduct)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, 3)
    }
    
    func testAddRandomProduct() {
        // Assuming
        let mockProducts = [
            Product(id: 1, price: 10.0, selectedQuantity: 0),
            Product(id: 2, price: 15.0, selectedQuantity: 0)
        ]
        
        // Set
        cartViewModel.allproducts = mockProducts
        
        // Test
        cartViewModel.addRandomProduct()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testRemoveProduct() {
        // Assuming
        let mockProducts = [
            Product(id: 1, price: 10.0, selectedQuantity: 0),
            Product(id: 2, price: 15.0, selectedQuantity: 0)
        ]
        
        // Set
        cartViewModel.allproducts = mockProducts
        cartViewModel.addProduct(product: mockProducts[0])
        cartViewModel.addProduct(product: mockProducts[1])
        
        // Test
        cartViewModel.removeProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.last?.id, 2)
    }
    
    func testClearCart() {
        // Assuming
        let mockProducts = [
            Product(id: 1, price: 10.0, selectedQuantity: 0),
            Product(id: 2, price: 15.0, selectedQuantity: 0),
            Product(id: 3, price: 20.0, selectedQuantity: 0)
        ]
        
        // Set
        cartViewModel.allproducts = mockProducts
        cartViewModel.addProduct(product: mockProducts[0])
        cartViewModel.addProduct(product: mockProducts[1])
        cartViewModel.addProduct(product: mockProducts[2])
        
        // Test
        cartViewModel.clearCart()
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
}
