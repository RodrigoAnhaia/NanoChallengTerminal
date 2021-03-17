//
//  main.swift
//  03-22 - Nano Terminal
//
//  Created by Rodrigo de Anhaia on 17/03/21.
//

import Foundation


// Classe para o Buscardor


protocol Search {
    var search:  String  { get set }
    
    func Searching()
    
}

override func Searching () {
     print("procurando")
}
     


