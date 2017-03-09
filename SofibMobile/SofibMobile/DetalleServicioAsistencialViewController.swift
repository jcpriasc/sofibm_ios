//
//  DetalleServicioAsistencialViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 3/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DetalleServicioAsistencialViewController: UIViewController {

    
    @IBOutlet var txtNumeroOrden: UILabel!
    @IBOutlet var txtCiudadOficina: UILabel!
    @IBOutlet var txtIdPrestador: UILabel!
    @IBOutlet var txtNombrePrestador: UILabel!
    @IBOutlet var txtTipoServicio: UILabel!
    @IBOutlet var txtProcedimientoEsp: UILabel!
    @IBOutlet var txtProcedimientoIng: UILabel!
    @IBOutlet var txtCantidad: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtFecha: UILabel!
    
    @IBOutlet var lblNombrePrestador: UILabel!
    @IBOutlet var lblTipoServicio: UILabel!
    @IBOutlet var lblProcedimientoEsp: UILabel!
    @IBOutlet var lblProcedimientoIng: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombrePrestador.text = NSLocalizedString("lbl_nombre_prestador", comment: "lbl_nombre_prestador")
        lblTipoServicio.text = NSLocalizedString("lbl_tipo_servicio", comment: "lbl_tipo_servicio")
        lblProcedimientoEsp.text = NSLocalizedString("lbl_procedimiento_espanol", comment: "lbl_procedimiento_espanol")
        lblProcedimientoIng.text = NSLocalizedString("lbl_procedimiento_ingles", comment: "lbl_procedimiento_ingles")
        
        
        txtNumeroOrden.text = "\(NSLocalizedString("lbl_numero_orden", comment: "lbl_numero_orden")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.numerioSias)"
        txtCiudadOficina.text = "\(NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.ciudad)"
        txtIdPrestador.text = "\(NSLocalizedString("lbl_id_prestador", comment: "lbl_id_prestador")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.idPrestador)"
        txtNombrePrestador.text = ServiciosAsistencialesViewController.servicioAsistencial.nombrePrestador
        txtTipoServicio.text = ServiciosAsistencialesViewController.servicioAsistencial.nombreServicio
        txtProcedimientoEsp.text = ServiciosAsistencialesViewController.servicioAsistencial.nombreEspanol
        txtProcedimientoIng.text = ServiciosAsistencialesViewController.servicioAsistencial.nombreIngles
        txtCantidad.text = "\(NSLocalizedString("lbl_cantidad", comment: "lbl_cantidad")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.cantidad)"
        txtEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.estado)"
        txtFecha.text = "\(NSLocalizedString("lbl_fecha", comment: "lbl_fecha")) \(": ")\(ServiciosAsistencialesViewController.servicioAsistencial.fecha)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
