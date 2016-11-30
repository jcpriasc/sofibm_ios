//
//  DetalleNotaCreditoDebito.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation

class DetalleNotaCreditoDebito
{
    var facturaNro: String = ""
    var fechaEmision: String = ""
    var fechaVencimiento: String = ""
    var fechaRecibido: String = ""
    var valorTotalFactura: String = ""
    var valorTotalPagar: String = ""
    var proveedor: String = ""
    var fechaExpedicionNota: String = ""
    var fechaRecibidoCoomevaNota: String = ""
    var notaMotivo: String = ""
    var orderServicio: String = ""
    var servicio: String = ""
     var valorIva: String = ""
    var valorTotalPagarNota: String = ""
    var valorTotalNotaCredito: String = ""
    var nroNota: String = ""
    
    var facturas: NSArray?
    var impuestos: NSArray?
}
