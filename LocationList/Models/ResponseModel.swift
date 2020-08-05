//
//  ResponseModel.swift
//  RechargeApp
//
//  Created by Anamika Deb on 6/2/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import Foundation
import ObjectMapper
import Combine


class LocationResponse: Mappable, Identifiable {
    var poiList: [PoiList]?
    
    init(poiList : [PoiList]?) {
        self.poiList = poiList ?? []
    }
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        poiList <- map["poiList"]
    }
}

class PoiList: Mappable, Identifiable {
    var fleetType: String?
    var id: Int?
    var heading: Double?
    var lat: Double?
    var long: Double?
    
    init(fleetType: String, id: Int, heading: Double, lat: Double, long: Double) {
        self.fleetType = fleetType
        self.id = id
        self.heading = heading
        self.lat = lat
        self.long = long
    }

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        fleetType <- map["fleetType"]
        id <- map["id"]
        heading <- map["heading"]
        lat <- map["coordinate.latitude"]
        long <- map["coordinate.longitude"]
    }
}

struct demo : Identifiable{
    var fleetType: String?
    var id: Int?
    var heading: Double?
    var lat: Double?
    var long: Double?
}
