//
//  WeatherAPI.swift
//  Prueba1
//
//  Created by FabFM on 22/11/16.
//  Copyright © 2016 FabFM. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherAPI: NSObject {
    
    let BaseURL:String
    let APIKey:String

    override init() {
        self.BaseURL = (Constants.is_Develop) ? Constants.baseURL_develop:Constants.baseURL_production
        self.APIKey = Constants.APIKey
    }
    
    func connectionAPI(params:String,completion: @escaping(_ response:[String:Any]?,_ error:Error?)->Void){
        let endpoint = self.BaseURL + params + "&APPID=\(self.APIKey)"
        if let url = URL(string: endpoint){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.timeoutInterval = 20
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        }
    }

}
