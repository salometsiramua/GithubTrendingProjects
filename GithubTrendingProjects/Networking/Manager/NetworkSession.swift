//
//  NetworkSession.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

public typealias HTTPRequestSessionCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkSession: AnyObject {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url) { (data, response, error) in
            completionHandler(data, response, error)
        }

        task.resume()
    }
}

//protocol URLSessionDataTaskProtocol {
//    func resume()
//}
//
//extension URLSessionDataTask: URLSessionDataTaskProtocol {}


public protocol RequestType: AnyObject {
    associatedtype Model
    var path: String { get set }

    func frobulateModel(aModel: Model)
}
