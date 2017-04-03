//
//  DetalleSolicitudAprobacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleSolicitudAprobacionViewController: UIViewController {

    @IBOutlet var lblNombrePaciente: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblFechaSolicitud: UILabel!
    
    @IBOutlet var lblDescripcion: UILabel!
    @IBOutlet var lblTipoAutorizacion: UILabel!
    @IBOutlet var lblTipoEntidad: UILabel!
    @IBOutlet var lblSolicitante: UILabel!
    @IBOutlet var lblAutoriza: UILabel!
    @IBOutlet var lblFechaAutorizacion: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblPrestador: UILabel!
    @IBOutlet var lblJustificacion: UILabel!
    
    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtTipoAutorizacion: UILabel!
    @IBOutlet var txtTipoEntidad: UILabel!
    @IBOutlet var txtSolicitante: UILabel!
    @IBOutlet var txtAutoriza: UILabel!
    @IBOutlet var txtFechaAutorizacion: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtPrestador: UILabel!
    @IBOutlet var txtJustificacion: UILabel!
    
    static var jsonDetalleSolicitudAprobacion: NSDictionary?
    
    let params: String = "/SAC/"+PropertiesProject.TOKEN+"/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombrePaciente.text = "\(NSLocalizedString("lbl_nombre_paciente", comment: "lbl_nombre_paciente"))\(": ") \(SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.nombrePaciente)"
         lblEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado"))\(": ") \(SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.estado)"
         lblFechaSolicitud.text = "\(NSLocalizedString("lbl_fecha_solicitud", comment: "lbl_fecha_solicitud"))\(": ") \(SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.fechaSolicitud)"
        
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblTipoAutorizacion.text = NSLocalizedString("lbl_tipo_autorizacion", comment: "lbl_tipo_autorizacion")
        lblTipoEntidad.text = NSLocalizedString("lbl_tipo_entidad", comment: "lbl_tipo_entidad")
        lblSolicitante.text = NSLocalizedString("lbl_solicitante", comment: "lbl_solicitante")
        lblAutoriza.text = NSLocalizedString("lbl_autoriza", comment: "lbl_autoriza")
        lblFechaAutorizacion.text = NSLocalizedString("lbl_fecha_autorizacion", comment: "lbl_fecha_autorizacion")
        lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblPrestador.text = NSLocalizedString("lbl_prestador", comment: "lbl_prestador")
        lblJustificacion.text = NSLocalizedString("lbl_justificacion", comment: "lbl_justificacion")
        
        txtDescripcion.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.descripcion
        txtTipoAutorizacion.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.tipoAutorizacion
        txtTipoEntidad.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.tipoEntidad
        txtSolicitante.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.solicitante
        txtAutoriza.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.autoriza
        txtFechaAutorizacion.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.fechaAutorizacion
        txtServicio.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.servicio
        txtProveedor.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.proveedor
        txtPrestador.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.prestador
        txtJustificacion.text = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.justificacion
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_verDetalle(_ sender: Any) {
        obtenerDetalle()
    }
    
    func obtenerDetalle(){
        
        
        let codigoTexto = SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.idAprobacion
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_detalle_aprobacion+params+codigoTexto)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    
                    do
                    {
                     
                        DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion) != nil && (DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion?.count)!>0){
                        
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabSolicitudesAprobacion")
                            self.show(vc as! UIViewController, sender: vc)
                            
                        }else{
                            //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                        
                    }
                    catch
                    {
                        
                    }
                    
                }
            }
        }
        
        task.resume()
        
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
        AjustesViewController.viewBack = "detalleSolicitudAprobacion"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
