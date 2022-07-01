//
//  HTTPManagerService.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 04.05.22.
//

import Foundation

protocol HTTPManagerService {

    associatedtype ResponseObject

    typealias ServiceSuccessCallback = ((ResponseObject) -> Void)
    typealias ServiceFailureCallback = ((Error) -> Void)

    func onSuccess(_ callback: @escaping ServiceSuccessCallback) -> Self
    func onFail(_ callback: @escaping ServiceFailureCallback) -> Self

}
