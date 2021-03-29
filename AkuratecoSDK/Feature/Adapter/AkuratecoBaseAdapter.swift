//
//  AkuratecoBaseAdapter.swift
//  AkuratecoSDK
//
//  Created by Bodia on 15.02.2021.
//

import Foundation

/// The delegate to observe requests and responses
public protocol AkuratecoAdapterDelegate: AnyObject {
    
    /// Will be called before sending the request
    /// - Parameter request: request to send
    func willSendRequest(_ request: AkuratecoDataRequest)
    
    /// Will be called after receiving the response
    /// - Parameter reponse: response from server
    func didReceiveResponse(_ reponse: AkuratecoDataResponse?)
}

/// The base Akurateco API Adapter.
public class AkuratecoBaseAdapter<Serivce: Encodable> {
    
    private let apiClient = AkuratecoRestApiClient()
    
    /// The delegate to observe requests and responses
    public weak var delegate: AkuratecoAdapterDelegate?
    
    @discardableResult
    func procesedRequest<T: Decodable>(action: AkuratecoAction,
                                       params: Serivce,
                                       callback: @escaping AkuratecoCallback<T>) -> URLSessionDataTask {
        let url = URL(string: AkuratecoSDK.shared.credentials.paymentUrl)!
        
        let request = AkuratecoDataRequest(url: url,
                                           httpMethod: .post,
                                           body: params)
        
        delegate?.willSendRequest(request)
        
        return apiClient.send(request) { [weak self] in
            self?.parseResponse($0, callback: callback)
        }
    }
    
    private func parseResponse<T: Decodable>(_ response: AkuratecoDataResponse, callback: @escaping AkuratecoCallback<T>) {
        if let data = response.data {
            do {
                callback(.error(try JSONDecoder().decode(AkuratecoError.self, from: data)))
           
            } catch {
                do {
                    let a: T = try JSONDecoder().decode(T.self, from: data)
                    callback(.result(a))
                    
                } catch {
                    callback(.failure(error))
                }
            }
            
        } else {
            callback(.failure(response.error ?? NSError(domain: "Server error", code: 0, userInfo: nil)))
        }
        
        delegate?.didReceiveResponse(response)
    }
}
