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
        
        if(texto == nil || texto?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == ""){
            return ""
            
        }else{
            FormatoDinero.currencyFormatter.usesGroupingSeparator = true
            FormatoDinero.currencyFormatter.numberStyle = NumberFormatter.Style.currency
            FormatoDinero.currencyFormatter.locale = Locale.current
            
            let numeroDouble = Double(texto!)
            let numero = NSNumber(value: numeroDouble!)
            let textoFormateado = currencyFormatter.string(from: numero)
            
            return textoFormateado
            
        }
        
    }
    
    static func formatearMonedaDouble( texto: Double?) -> String? {
        
        if(texto == nil ){
            return ""
            
        }else{
            FormatoDinero.currencyFormatter.usesGroupingSeparator = true
            FormatoDinero.currencyFormatter.numberStyle = NumberFormatter.Style.currency
            FormatoDinero.currencyFormatter.locale = Locale.current
            
            let numero = NSNumber(value: texto!)
            let textoFormateado = currencyFormatter.string(from: numero)
            
            return textoFormateado
            
        }
        
    }
    
    
    static func formatearMonedaStringADouble( texto: String?) -> Double? {
        
        if(texto == nil || texto?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == ""){
            return 0
            
        }else{
            
            let numeroDouble = Double(texto!)
            return numeroDouble
            
        }
    }

   

    
}
