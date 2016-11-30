//
//  DetalleFactura.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation

class DetalleFactura
{
    var facturaNumero: String = ""
    var fechaEmision: String = ""
    var fechaVencimientoPago: String = ""
    var fechaRecibidoCoomeva: String = ""
    var proveedor: String = ""
    var descripcion: String = ""
    var motivo: String = ""
    var valorGlosa: String = ""
    var valorIva: String = ""
    var valorTotalPagar: String = ""
    var valorTotalFactura: String = ""
    
    var factura: NSArray?
    var impuestos: NSArray?
}
