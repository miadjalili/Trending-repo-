//
//  APIRouter.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation

class APIRouter {
    
    // GET Request
    struct GetRepositorie: Request {
        var baseServer: APIConstants.ServerBaseURL = .baseURL
        typealias ReturnType = RepositoriesModel
        var path: String = "/repositories"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.ProductParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
//    
//    // POST Request
//    struct AddProduct: Request {
//        var baseServer: APIConstants.ServerBaseURL = .baseURL
//        typealias ReturnType = AddedProductModel
//        var path: String = "/products/add"
//        var method: HTTPMethod = .post
//        var body: [String : Any]?
//        init(body: APIParameters.AddProductParams) {
//            self.body = body.asDictionary
//        }
//    }
}
