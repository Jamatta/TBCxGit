//
//  NetworkingTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Nika Jamatashvili on 04.12.23.
//

import XCTest
@testable import UnitTestingAssignment


class NetworkingTests: XCTestCase {
 
    func testFetchProductsSuccess() {
        let expectation = self.expectation(description: "Products fetched successfully")
        
        let apiUrl = URL(string: "https://dummyjson.com/products")!
        
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            
            XCTAssertNil(error, "შეცდომა: \(error?.localizedDescription ?? "")")
            XCTAssertNotNil(data, "არ არის დატა")
            
            do {
                let decoder = JSONDecoder()
                let productsResponse = try decoder.decode(ProductsResponse.self, from: data!)
                
                XCTAssertFalse(productsResponse.products.isEmpty, "არ გვაქვს პროდუქტები")
                
                for product in productsResponse.products {
                    print(product.title!, "- Price", product.price!)
                    XCTAssertNotNil(product.id, "id არ უნდა იყოს nil")
                }
                expectation.fulfill()
            } catch {
                XCTFail("ვერ მოხდა დეკოდირება: \(error.localizedDescription)")
            }
        }.resume()
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}

