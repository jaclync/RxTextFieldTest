//
//  ViewController.swift
//  RxTextFieldTest
//
//  Created by Jaclyn Chen on 3/13/17.
//  Copyright © 2017 JC. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.orange

        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white

        view.addSubview(textField)

        // Add autolayout constraints.
        let margins = view.layoutMarginsGuide
        textField.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 150).isActive = true

        textField.rx.text.orEmpty
            .subscribe(onNext: { text in
                print(text)
                if text == "たべます" {
                    textField.textColor = UIColor.green
                    textField.isUserInteractionEnabled = false
                }
            })
            .addDisposableTo(disposeBag)
    }
}
