//
//  APIClient.swift
//  APIClient
//
//  Created by Devel on 13/06/22.
//


import Foundation
import Alamofire

open class APIClient: NSObject {

    private var baseUrl: String;
    private var license: String;
    private var manager: Session;
    
    
    public init(baseUrl: String, license: String) {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.af.default
            return config
        }()
        
        let delegate = SessionDelegate(fileManager: .default)
        self.manager = Session(configuration: configuration, delegate: delegate)
        self.baseUrl = baseUrl
        self.license = license
        
    }
    
    //InitSession
    public func initSession(
        installation: String,
        completionHandler: @escaping(Result<InitializationResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.INITIALIZATION.rawValue

        let params: [String: Any] = [
            "License": self.license,
            "Installation": installation,
        ]
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding()).validate().responseDecodable(of: InitializationResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(InitializationResponse.self, from: data)
                completionHandler(.success(res))
                
            }catch let err {
                
                completionHandler(.failure(err))
            }
        }
    }
    
    //get files
    public func getFiles(
        type: GetFilesOptions,
        completionHandler: @escaping(Result<GetFilesResponse,Error>) -> Void
    ){
        
        let url = self.baseUrl + Endpoints.GET_FILES.rawValue
        print(type.rawValue)

        let params : [String: Int] = ["Type": type.rawValue]
        let parameters: Data;
        
        do{
            
            parameters = try JSONEncoder().encode(params)
        
            
        }catch let err {
            
            completionHandler(.failure(err))
            print("error de decodificaci[no")
            return
        }
     
        AF.request(url, method: .get, parameters: parameters).validate().responseDecodable(of: GetFilesResponse.self) { response in
            guard let data = response.data else {
                
                completionHandler(.failure(response.error!))
                return
                
            }
            
            do{
                
                let res = try JSONDecoder().decode(GetFilesResponse.self, from: data)
                print("error en decodificacion reponse")
                completionHandler(.success(res))
                
            }catch let err {
                
                completionHandler(.failure(err))
            }
        }
    }
    
    

    
}

