//
//  PropertiesProject.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/26/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import Foundation

class PropertiesProject{
    
    static var URL: String = "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile"
    static var URL_PROFILE: String = "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-autOficinaVirtual"
    static var URL_INFO_MED: String = "http://pruebas-sofib.coomeva.com.co/cni-web/exportDocument?format=pdf&reportName=informe_medico&CONS_INFORME_MEDICO="
    
    
    static var URL_INFO_DOCU_GIRO: String = "http://pruebas-sofib.coomeva.com.co/cni-web/exportDocument?format=pdf&useDataSource=true&reportName=reporteGiro&ID_GIRO="
    
    static var complement1_info_med: String = "&CONS_SOLICITUD_ATENCION="
    static var complement2_info_med: String = "&nocache=15416516316"
    static var complement3_info_med_ingles: String = "&REPORT_LOCALE=USD"
    
    static var complement_Autorizaciones: String = "/Autorizaciones"
    static var complement_detalle_autorizaciones: String = "/Autorizaciones/Detalle"
    static var complement_ServiciosAsistenciales: String = "/ServiciosAsistenciales"
    static var complement_ServiciosAsistenciales_detalle: String = "/ServiciosAsistenciales/detalle"
    static var complement_InformesMedicos: String = "/InformesMedicos"
    static var complement_InformesMedicos_detalle: String = "/InformesMedicos/detalle"
    static var complement_DocumentosMedicos: String = "/DocumentosMedicos"
    static var complement_DocumentosMedicos_id: String = "/DocumentosMedicos/documento"
    static var complement_Epicrisis: String = "/Epicrisis"
    static var complement_Bitacoras: String = "/Bitacoras"
    static var complement_FuncionariosExternos: String = "/FuncionariosExternos"
    static var complement_ProcedimientoAdicionales: String = "/ProcedimientoAdicionales"
    static var complement_aprobacion: String = "/aprobacion"
    
    static var complement_serviciosNoAsistenciales: String = "/serviciosNoAsistenciales"
    static var complement_giro: String = "/giro"
    static var complement_giro_notaCredito: String = "/giro/notaCredito"
    static var complement_factura: String = "/factura"
    static var complement_nota: String = "/nota"
    static var complement_utilizaciones: String = "/utilizaciones"
    static var complement_encuesta: String = "/encuesta"
    static var complement_aprobacion_logistica: String = "/aprobacion"
    
    static var complement_serviciosNoAsistenciales_detalle: String = "/serviciosNoAsistenciales/detalle"
    static var complement_giro_detalle: String = "/giro/detalle"
    static var complement_factura_detalle: String = "/factura/detalle"
    static var complement_nota_detalle: String = "/nota/detalle"
    static var complement_utilizaciones_detalle: String = "/utilizaciones/detalle"
    static var complement_convenios: String = "/convenios"
    static var complement_estados: String = "/estados"
    static var complement_ciudades: String = "/ciudades"
    static var complement_tipos_registros: String = "/tipoRegistros"
    static var complement_tipos_servicios: String = "/tipoServicios"
    static var complement_servicios: String = "/servicios"
    static var complement_detalle_aprobacion: String = "/aprobacion/detalle"

}
