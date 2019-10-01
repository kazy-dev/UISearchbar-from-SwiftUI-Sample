//
//  CustomSearchView.swift
//  UISearchbar-from-SwiftUI-Sample
//
//  Copyright © 2019 kazy. All rights reserved.
//

import UIKit

// Define SearchView in the usual way to create custom views.

class UIKitSearchView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("UIKitSearchView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        searchBar.placeholder = "UIKitSearchView's searchBar"
        searchBar.backgroundImage = UIImage()
    }
}
