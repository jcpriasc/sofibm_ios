//
//  ServicioNoAsistencial.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation

class ServicioNoAsistencial{
    
    var numeroSolicitud: String = ""
    var tipoSolicitud: String = ""
    var ciudad: String = ""
    var estado: String = ""
    var aprobada: String = ""
    var justificacion: String = ""
    var consServicio: Double = 0

}


class ServicioAsistencial{
    
    var id: Int = 0
    var numerioSias: String = ""
    var ciudad: String = ""
    var idPrestador: Int = 0
    var nombrePrestador: String = ""
    var nombreServicio: String = ""
    var codigoProcedimiento: String = ""
    var cantidad: Int = 0
    var nombreEspanol: String = ""
    var nombreIngles: String = ""
    var fecha: String = ""
    var estado: String = ""
    
    var detalleServicio : NSArray?
    
}
