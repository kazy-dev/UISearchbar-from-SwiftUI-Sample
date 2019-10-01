//
//  ContentView.swift
//  UISearchbar-from-SwiftUI-Sample
//
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI
import UIKit

let DEFAULT_TEXT: String = "The characters entered in the searchbar are displayed here."

struct ContentView: View {
    /// @Binding also requires the definition of the side referenced by the referencing side.
    /// The side to be referenced is defined by @State this time.
    /// This time, this value is used to handle the input value of SearchBar created from UIKit on the SwiftUI side.
    @State private var text: String = DEFAULT_TEXT
    
    var body: some View {
        VStack(alignment: .center) {
            /// Since it is necessary to bind the input value, pass the text defined in @State at initialization.
            SwiftUISearchView(text: $text)
                .frame(height: 100.0)
            Spacer()
            VStack {
                Text("SwiftUI View")
                    .font(.title)
                    .padding(.bottom, 20)
                /// Since we want to display the bound value on the View side of SwiftUI, set it using Text ().
                Text(text)
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.blue).opacity(0.5))
            .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
