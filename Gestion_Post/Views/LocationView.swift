//
//  LocationView.swift
//  Gestion_Post
//
//  Created by Mac Mini 2 on 24/11/2023.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct LocationView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchtext = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection : MKMapItem?
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection){
//            Marker("AYOUB WHERE AT", systemImage: "paperplane", coordinate: .userLocation)
            
            Annotation("AYOUB WHERE AT",coordinate: .userLocation){
                ZStack{
                    Circle()
                        .frame(width: 32,height: 32)
                        .foregroundStyle(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.white)
                    Circle()
                        .frame(width: 12,height: 12)
                        .foregroundColor(.blue )
                }
            }
            ForEach(results, id: \.self) { item in
                let placemark = item.placemark
                Marker(placemark.name ?? "", coordinate: placemark.coordinate)}
           
        }
        .overlay(alignment: .top){
            TextField("SELECT THE LOCATION YOU WERE AT ", text: $searchtext)
                .font(.subheadline)
                .padding(12)
                .background(.white)
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .onSubmit(of: .text) {
            print("SEARCH FOR A PLACE \(searchtext)")
        }
        .onChange(of: mapSelection, { oldValue, newValue in
        })
        .mapControls{
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
            
        }
    }
}

@available(iOS 17.0, *)
extension LocationView {
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchtext
        request.region = .userRegion
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}
extension CLLocationCoordinate2D{
    static var userLocation: CLLocationCoordinate2D{
        return .init(latitude: 25.7602, longitude: -80.1959)
    }
}

extension MKCoordinateRegion{
    static var userRegion: MKCoordinateRegion{
        return .init(center: .userLocation,
                            latitudinalMeters: 10000,
                            longitudinalMeters: 10000
                            )
    }
}

@available(iOS 17.0, *)
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
