//
//  DetailsView.swift
//  LocationList
//
//  Created by Anamika Deb on 5/8/20.
//  Copyright © 2020 Anamika Deb. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  
    var poilist : PoiList

//  @Binding var checkpoints: [Checkpoint]
  
//    @State var checkpoints: [Checkpoint] =  [Checkpoint(title: self.poilist.fleetType, coordinate: .init(latitude: self.poilist.lat ?? 0.0, longitude: self.poilist.long ?? 0.0))]


  func makeUIView(context: Context) -> MKMapView {
    MKMapView()
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    print(poilist.lat ?? 0.0)
    let coordinate = CLLocationCoordinate2D(
        latitude: poilist.lat ?? 0.0, longitude: poilist.long ?? 0.0)
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    print(coordinate.latitude )

    uiView.setRegion(region, animated: true)
    
    let checkpoints: [Checkpoint] =  [Checkpoint(title: self.poilist.fleetType, coordinate: .init(latitude: self.poilist.lat ?? 0.0, longitude: self.poilist.long ?? 0.0))]

    uiView.addAnnotations(checkpoints)
  }
}

final class Checkpoint: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

struct DetailsView: View {
    var poilist : PoiList
//    var lat : Double
//    var long : Double
    
//    @State var checkpoints: [Checkpoint] =
//        [Checkpoint(title: "Da Nang", coordinate: .init(latitude: poilist.lat ?? 0.0, longitude: poilist.long ?? 0.0))]
    init(poilist: PoiList) {
        self.poilist = poilist
    }
    
    
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        MapView(poilist: self.poilist)
    }
}

//struct DetailsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        DetailsView()
//    }
//}
