//
//  ShopMapView.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI
import MapKit

struct ShopMapView: View {
    
    let shops: [Shop]
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 46, longitude: 2),
                                                   span: MKCoordinateSpan(latitudeDelta: 12, longitudeDelta: 10))
    @State private var selectedShop: Shop?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: shops, annotationContent: { shop in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: shop.location.0, longitude: shop.location.1)) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .opacity(0.8)
                        .foregroundColor(.red)
                        .onTapGesture {
                            selectedShop = shop
                        }
                }
            })
                .edgesIgnoringSafeArea(.all)
            if let selectedShop = selectedShop {
                Rectangle()
                #if os(iOS)
                    .foregroundStyle(.thinMaterial)
                #endif
                    .overlay(Text("\(selectedShop.brand?.brandName ?? "Shop")"))
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        self.selectedShop = nil
                    }
            }
        }
    }
}

struct ShopMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopMapView(shops: [])
    }
}
