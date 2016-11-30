//
//  DetalleBitacoraViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/30/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleBitacoraViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblNumeroSolicitud: UILabel!
    @IBOutlet weak var lblNombrePaciente: UILabel!
    @IBOutlet weak var lblTipoRegistro: UILabel!
    @IBOutlet weak var lblTipoAccion: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    
    @IBOutlet weak var lblCiudad: UILabel!
    @IBOutlet weak var txtCiudad: UILabel!
    @IBOutlet weak var lblTipoServicio: UILabel!
    @IBOutlet weak var txtTipoServicio: UILabel!
    @IBOutlet weak var lblNombreServicio: UILabel!
    @IBOutlet weak var txtNombreServicio: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var txtFecha: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var txtDescripcion: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNumeroSolicitud.text = NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud")+": "+BitacoraViewController.bitacoraSeleccionada.numeroSolicitud
        lblNombrePaciente.text = NSLocalizedString("lbl_nombre_paciente", comment: "lbl_nombre_paciente")+": "+BitacoraViewController.bitacoraSeleccionada.nombrePaciente
        lblTipoRegistro.text = NSLocalizedString("lbl_tipo_registro", comment: "lbl_tipo_registro")+": "+BitacoraViewController.bitacoraSeleccionada.tipoRegistro
        lblTipoAccion.text = NSLocalizedString("lbl_tipo_accion", comment: "lbl_tipo_accion")+": "+BitacoraViewController.bitacoraSeleccionada.tipoAccion
        lblEstado.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")+": "+BitacoraViewController.bitacoraSeleccionada.estado
        
        lblCiudad.text = NSLocalizedString("lbl_ciudad_inicial", comment: "lbl_ciudad_inicial")
        lblTipoServicio.text = NSLocalizedString("lbl_tipo_servicio", comment: "lbl_tipo_servicio")
        lblNombreServicio.text = NSLocalizedString("lbl_nombre_usuario", comment: "lbl_nombre_usuario")
        lblFecha.text = NSLocalizedString("lbl_fecha", comment: "lbl_fecha")
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        
        txtCiudad.text = BitacoraViewController.bitacoraSeleccionada.ciudadInicial
        txtTipoServicio.text = BitacoraViewController.bitacoraSeleccionada.tipoServicio
        txtNombreServicio.text = BitacoraViewController.bitacoraSeleccionada.nombreUsuario
        txtFecha.text = BitacoraViewController.bitacoraSeleccionada.fechaCreado
        txtDescripcion.text = BitacoraViewController.bitacoraSeleccionada.descripcion
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
