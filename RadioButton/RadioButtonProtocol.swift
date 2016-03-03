//
//  RadioButtonProtocol.swift
//  MtoM
//
//  Created by Trương Thắng on 12/14/15.
//  Copyright © 2015 Framgia. All rights reserved.
//

import Foundation


protocol RadioButtonProtocol: class {
    func didSelectRadioButton(radioButton: RadioButton)
    var defaultButtonOrder : Int! {get set}
    func didSelectRadioButtonAtFirstTime(radioButton: RadioButton)
    
}

protocol GroupRadioButtonProtocol: class {
    func didSelectRadioButton(order: Int)
}