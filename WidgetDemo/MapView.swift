//
//  MapView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/29.
//  Copyright © 2020 TZ. All rights reserved.
//

import MapKit
import SwiftUI
import CoreLocation

final class MapView: NSObject, UIViewRepresentable {
    
    let mapView = MKMapView(frame: .zero)
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isScrollEnabled = false
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    func relocation(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let anotation = VehicleAnotation(coordinate: location)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(anotation)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            var rect = self.mapView.visibleMapRect
            let point = MKMapPoint(location)
            rect.origin.x = point.x - rect.size.width * 0.8
            self.mapView.setVisibleMapRect(rect, animated: true)
        }
    }
}

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        relocation(location: userLocation.coordinate)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Vehicle")
        return anotationView
    }
}

private class VehicleAnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
