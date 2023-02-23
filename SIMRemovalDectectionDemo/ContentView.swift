//
//  ContentView.swift
//  SIMRemovalDectectionDemo
//
//  Created by Sagar Kadam on 17/02/23.
//

import SwiftUI
import CoreTelephony

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Detect SIM Removal")
            }.onAppear() {
                checkIfSIMEjected()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Important message"), message: Text("Your SIM CARD WAS EJECTED..!!"), dismissButton: .default(Text("Got it!")))
            }
            .navigationTitle("SIM REMOVAL DEMO")
        }
    }
    
    func checkIfSIMEjected() {
        // Declare your class member
        let networkInfo = CTTelephonyNetworkInfo();

        // In viewDidLoad or in your custom method
        networkInfo.serviceSubscriberCellularProvidersDidUpdateNotifier = { carrier in
            // Do whatever you wanna do when a callback comes
            print("SIM CARD EJECTED...")
            showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




/*
 
 
 func chekckIfSIMRemoved() {
     /*
     let info = CTTelephonyNetworkInfo()
     let carrier = info.subscriberCellularProvider
     let mobileCountryCode = carrier?.mobileCountryCode
     let carrierName = carrier?.carrierName
     let isoCountryCode = carrier?.isoCountryCode
     let mobileNetworkCode = carrier?.mobileNetworkCode

     // Try this to track CTCarrier changes
     info.subscriberCellularProviderDidUpdateNotifier = { inCTCarrier in
         
     }
     */
     
     let info: CTTelephonyNetworkInfo = CTTelephonyNetworkInfo()
     guard let carrier: CTCarrier = info.subscriberCellularProvider else {
       // No carrier info available
       return
     }

     print(carrier.carrierName)
     print(carrier.mobileCountryCode)
     print(carrier.mobileNetworkCode)
     print(carrier.isoCountryCode)
     print(carrier.allowsVOIP)
     
     
     // Try this to track CTCarrier changes
//        info.subscriberCellularProviderDidUpdateNotifier = ^(CTCarrier* inCTCarrier) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    NSLog(@"User did change SIM");
//                });
//        };
     
     info.serviceSubscriberCellularProvidersDidUpdateNotifier
 }
 
 
 func getSIMEjectUpdates() {
     // Declare your class member
     let networkInfo = CTTelephonyNetworkInfo();

     // In viewDidLoad or in your custom method
     networkInfo.serviceSubscriberCellularProvidersDidUpdateNotifier = { carrier in
         // Do whatever you wanna do when a callback comes
         
     }
 }
 
 */
