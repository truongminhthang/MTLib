//
//  FairRadioButton.swift
//  MtoM
//
//  Created by ThangTm on 12/11/15.
//  Copyright © 2015 Framgia. All rights reserved.
//

import UIKit

class RadioButtonsView: UIView, RadioButtonProtocol {
    
    var buttons: [RadioButton]
    var delegate: GroupRadioButtonProtocol?
    var edge: UIEdgeInsets = UIEdgeInsetsZero
    init(buttons: [RadioButton], delegate: protocol <GroupRadioButtonProtocol>, edge: UIEdgeInsets = UIEdgeInsetsZero) {
        self.buttons = buttons
        self.delegate = delegate
        super.init(frame: CGRectZero)
        setLayout()
        setConnectionBetweenTwoRadio()
        prepareForReuse()
        setupDelegateForRadioButton()
        self.edge = edge
    }
    
    private func setLayout() {
        self.mt_splitVerticallyByViews(buttons,edge: edge)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var defaultButtonOrder : Int! {
        didSet {
            if defaultButtonOrder != nil {
                buttons[defaultButtonOrder].isActive = true
            }

        }
    }
    
    func didSelectRadioButtonAtFirstTime(radioButton: RadioButton) {
        for (index, button) in buttons.enumerate() {
            if radioButton == button {
                defaultButtonOrder = index
                delegate?.didSelectRadioButton(index)
            }
        }
    }
    
    func setupDelegateForRadioButton() {
        buttons.forEach { (btn) -> () in
            btn.delegate = self
        }
    }
    
    func prepareForReuse() {
        buttons.forEach { (btn) -> () in
            btn.isActive = false
        }
    }
    
    func didSelectRadioButton(radioButton: RadioButton){
        for (index, button) in buttons.enumerate() {
            if radioButton == button {
                delegate?.didSelectRadioButton(index)
            }
        }
    }
    
    private func setConnectionBetweenTwoRadio() {
        for (index, button) in buttons.enumerate() {
            if (button.otherButton == nil) {
                var buttonsClone = buttons
                buttonsClone.removeAtIndex(index)
                button.otherButton = buttonsClone
            }
        }
    }
}