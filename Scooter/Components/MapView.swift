//
//  MapView.swift
//  Scooter
//
//  Created by Temiloluwa on 18/06/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var scooters: [Scooter]
    @Binding var selectedScooter: Scooter?
    
    func makeCoordinator() -> Coordinator {

        Coordinator(self, selectedScooter: $selectedScooter)
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView
        
        @Binding var selectedScooter: Scooter?
        
        init(_ parent : MapView, selectedScooter: Binding<Scooter?>) {
            self.parent = parent
            self._selectedScooter = selectedScooter
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            guard !(annotation is MKUserLocation) else {
                
                return .none
            }
            
            let identifier = "ScooterAnnotation"
            
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            annotationView.canShowCallout = false
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            
            guard let annotation = view.annotation as? ScooterAnnotation else {
                
                return
            }
            withAnimation {
                
                selectedScooter = annotation.scooter
            }
            
            mapView.setCenter(view.annotation!.coordinate, animated: true)
        }
     
        func mapView(_mapView: MKMapView, didDeselect view: MKAnnotationView) {
            
            withAnimation {
                
                selectedScooter = nil
            }
        }
        
    }
}

