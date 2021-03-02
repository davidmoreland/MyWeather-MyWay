//
//  ContentView.swift
//  Shared
//
//  Created by David Moreland on 3/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    @ObservedObject var locationVM: LocationViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
        self.locationVM = LocationViewModel()
    }
    
    
    var body: some View {
        VStack() {
                Text("QuickPeek") .font(.title2)
              
                TextField("Enter City Name", text:
                            self.$weatherVM.cityName, onCommit:   {
                                weatherVM.search()
                            }) .font(.custom("Arial", size: 30))
               .padding()
                .fixedSize()
            Text("Coordinats: ", text:
                    self.$weatherVM.cityName, onCommit: {
                        locationVM.
                    })
                
                HStack() {
                    
                    Text("Temperature:")
                        .padding(.vertical)
                        .font(.custom("Arial",size: 25))
                    
                Text(self.weatherVM.temperature)
                    .font(.custom("Arial", size: 25))
                  
                    .foregroundColor(Color.white)
                //   .offset(y:100)
                //    .padding(25)
            
             }
        }.frame(minWidth: 50, idealWidth: 200, maxWidth: .infinity, minHeight: 20, idealHeight: 500, maxHeight: .infinity, alignment: .top)
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
