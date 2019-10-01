//
//  SwiftUISearchView.swift
//  UISearchbar-from-SwiftUI-Sample
//
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI

// Define SwiftUISearchView that conforms to UIViewRepresentable in order to call CustomView created with UIKit from SwiftUI.
struct SwiftUISearchView: UIViewRepresentable {
    /// View is a value type. If you pass a value to the child View, it will copy and pass the value instead of passing a reference.
    /// The reason for using @Binding here is to synchronize data between the parent and child views.
    /// Declare @Binding to the property that references the value. And you can receive notification of update of values ​​such as variables with
    /// @State attribute of parent view.
    @Binding var text: String
    
    /// The UIViewRepresentable conform needs to implement makeCoordinator () in addition to makeUIView (context :)
    /// and updateUIView (_: context :), and this makeCoordinator () has a default implementation. There is none.
    ///
    /// UIViewControllerRepresentable also requires a makeCoordinator () method with default implementation in conform.
    /// If you define this Coordinator yourself, you will also need to implement makeCoordinator.
    ///
    /// SwiftUI calls this makeCoordinator () method before makeUIViewController (context :) to access the Coordinator when setting the view controller.
    func makeCoordinator() -> SwiftUISearchView.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UIKitSearchView {
        print("\(#function)")
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        let view = UIKitSearchView(frame: frame)
        
        /// And using this Coordinator (coform to the required protocol), you can also implement general processing that was implemented in UIKit,
        ///  such as event handling for delegates, data sources, and user operations in SwiftUI.
        view.searchBar.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: UIKitSearchView, context: Context) {
        print("\(#function)")
    }
}

extension SwiftUISearchView {
    class Coordinator: NSObject, UISearchBarDelegate {
        /// View is a value type. If you pass a value to the child View, it will copy and pass the value instead of passing a reference.
        /// The reason for using @Binding here is to synchronize data between the parent and child views.
        /// Declare @Binding to the property that references the value. And you can receive notification of update of values ​​such as variables with
        /// @State attribute of parent view.
        @Binding var text: String
        
        init(text: Binding<String>) {
            /// In the description of "text = text", the name conflicts, and in case of self.text = text, it is not assigned to Binding <String>.
            /// By assigning _, you can access the variable itself defined by @Binding.
            /// This is a bit unconfident.
            _text = text
        }
        
        /// This time, because it is a sample, it will be handled only when the text is changed or canceled.
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("\(#function)")
            text = searchText.isEmpty ? DEFAULT_TEXT: searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            print("\(#function)")
            text = DEFAULT_TEXT
            searchBar.text = nil
        }
    }
}

#if DEBUG
struct SwiftUISearchView_Previews: PreviewProvider {
    @State private static var text: String = ""
    
    static var previews: some View {
        SwiftUISearchView(text: SwiftUISearchView_Previews.$text)
    }
}
#endif
