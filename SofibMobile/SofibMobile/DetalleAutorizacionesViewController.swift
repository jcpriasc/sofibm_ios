//
//  DetalleAutorizacionesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/16/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleAutorizacionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var txtDescripcion: UILabel!
    @IBOutlet weak var lblCiudad: UILabel!
    @IBOutlet weak var lblTipoSolicitud: UILabel!
    @IBOutlet weak var lblFechaSolicitud: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var lblFechaAprobacion: UILabel!
    @IBOutlet weak var lblFechaRechazo: UILabel!
    
    let jsonDetalleAutorizaciones: NSArray = AutorizacionesViewController.autorizacionSeleccionada.detalleAutorizacion!
    
    //NSLocalizedString("lbl_si", comment: "lbl_si")
    
    
    //et detalle = ["bitacoras 1", "bitacoras 2", "bitacoras 3", "bitacoras 4", "bitacoras 5", "bitacoras 6", "bitacoras 7", "bitacoras 9"]

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonDetalleAutorizaciones.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetalleAutorizacionesViewCell
        
        if let resultadoConsulta = self.jsonDetalleAutorizaciones[indexPath.row] as? Dictionary<String, Any>{
            cell.txtDescripcion.text = resultadoConsulta["descripcion"] as? String ?? ""
            cell.txtJustificacion.text = resultadoConsulta["justificacion"] as? String ?? ""
            cell.txtEstado.text = resultadoConsulta["estado"] as? String ?? ""
        }
        
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")+":"
        txtDescripcion.text = AutorizacionesViewController.autorizacionSeleccionada.descripcion
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")+": "+AutorizacionesViewController.autorizacionSeleccionada.ciudad
        lblTipoSolicitud.text = NSLocalizedString("lbl_tipo_solicitud", comment: "lbl_tipo_solicitud")+": "+AutorizacionesViewController.autorizacionSeleccionada.tipoSolicitud
        lblFechaSolicitud.text = NSLocalizedString("lbl_fecha_solicitud", comment: "lbl_fecha_solicitud")+": "+AutorizacionesViewController.autorizacionSeleccionada.fechaSolicitud
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")+": "+AutorizacionesViewController.autorizacionSeleccionada.estado
        lblFechaAprobacion.text = NSLocalizedString("lbl_fecha_aprobacion", comment: "lbl_fecha_aprobacion")+": "+AutorizacionesViewController.autorizacionSeleccionada.fechaAprobacion
        lblFechaRechazo.text = NSLocalizedString("lbl_fecha_rechazo", comment: "lbl_fecha_rechazo")+": "+AutorizacionesViewController.autorizacionSeleccionada.fechaRechazo
        
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
