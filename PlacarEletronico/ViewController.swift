//
//  ViewController.swift
//  PlacarEletronico
//
//  Created by Ricardo Varjão on 28/10/19.
//  Copyright © 2019 Ricardo Varjão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let placarEletronico = PlacarEletronico(frame: self.view.frame)
        self.view.addSubview(placarEletronico)
        
        placarEletronico.setNomeTimeA(nome: "Coritiba")
        placarEletronico.setNomeTimeB(nome: "Athletico")
        

        
    }
}

