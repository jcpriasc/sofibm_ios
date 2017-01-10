//
//  FormatoDinero.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 10/01/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import Foundation

class FormatoDinero{
   
    static var currencyFormatter = NumberFormatter()
    
    static func formatearMoneda( texto: String?) -> String? {
        
        if(texto == nil){
            return ""
            
        }else{
            FormatoDinero.currencyFormatter.usesGroupingSeparator = true
            FormatoDinero.currencyFormatter.numberStyle = NumberFormatter.Style.currency
            FormatoDinero.currencyFormatter.locale = Locale.current
            
            let numeroInt = Int(texto!)
            let numero = NSNumber(value: numeroInt!)
            let textoFormateado = currencyFormatter.string(from: numero)
            
            return textoFormateado
            
        }
        
    }
    
   

   

    
}
