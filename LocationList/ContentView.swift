//
//  ContentView.swift
//  LocationList
//
//  Created by Anamika Deb on 4/8/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    @ObservedObject var apiResponse = APIManager()
    var locList : [PoiList] = []

    var body: some View {
        
        NavigationView{
            List(apiResponse.poiList){ item in
                NavigationLink(destination:
                DetailsView(poilist: item)){
                    ListRow(fleetType: item.fleetType ?? "", heading: item.heading ?? 0.0,lat: item.lat ?? 0.0, long: item.long ?? 0.0)

                }
            }.navigationBarTitle("Location List", displayMode: .inline)
        }
    }
}

struct ListRow: View {
    var fleetType :String
    var heading :Double
    var lat :Double
    var long :Double
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(fleetType).foregroundColor(.green)
                Text(String(lat)).foregroundColor(.orange)
            }
            Spacer()
            VStack(alignment: .trailing){
                Text(String(heading)).foregroundColor(.purple)
                Text(String(long)).foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var apiResponse = APIManager()

    static var previews: some View {
        ContentView(apiResponse: apiResponse, locList: apiResponse.poiList)
    }
}
