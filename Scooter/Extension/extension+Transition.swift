//
//  extension+Transition.swift
//  Scooter
//
//  Created by Temiloluwa on 18/06/2022.
//

import Foundation

import SwiftUI

extension AnyTransition{
    
    static var modeAndFade: AnyTransition {
        
        let animation = AnyTransition.scale
            .combined(with: move(edge: .bottom))
            .combined(with: .opacity)
        
        return.asymmetric(insertion: animation, removal: animation)
    }
}
