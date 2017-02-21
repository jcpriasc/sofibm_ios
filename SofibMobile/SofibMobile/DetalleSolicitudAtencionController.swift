//
//  DetalleSolicitudAtencionController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 2/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleSolicitudAtencionController:  UIViewController {

    
    @IBOutlet weak var lblNumeroSolicitud: UILabel!
    @IBOutlet weak var lblIdentificacion: UILabel!
    @IBOutlet weak var lblNombrePaciente: UILabel!
    @IBOutlet weak var txtCredencial: UILabel!
    @IBOutlet weak var txtConvenio: UILabel!
    @IBOutlet weak var txtCiudadInicial: UILabel!
    @IBOutlet weak var txtCiudadFinal: UILabel!
    @IBOutlet weak var txtTraslado: UILabel!
    @IBOutlet weak var txtFechaProgramada: UILabel!
    @IBOutlet weak var txtEstado: UILabel!
    @IBOutlet weak var txtFechaCreado: UILabel!
    
    let lblSolicitud = NSLocalizedString("solicitud_atencion", comment: "solicitud_atencion");
    let lblId = NSLocalizedString("identificacion", comment: "identificacion");
    let lblNombre = NSLocalizedString("nombre", comment: "nombre");
    
    
    override func viewWillAppear(_ animated: Bool) {
        lblNumeroSolicitud.text = lblSolicitud+": "+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud
        lblIdentificacion.text = lblId+": "+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.identificacion
        lblNombrePaciente.text = lblNombre+": "+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.nombre
        txtCredencial.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.credencial
        txtConvenio.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.convenio
        txtCiudadInicial.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.ciudadInicial
        txtCiudadFinal.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.ciudadActual
        txtTraslado.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.traslado
        txtFechaProgramada.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.fechaProg
        txtEstado.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.estado
        txtFechaCreado.text = ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.fechaCreado
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        
        AjustesViewController.viewBack = "detalleSolicitudAtencionView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
    
    
}
