//
//  UtilizacionesViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonUtilizaciones: NSArray = OpcionesSecundariasLogViewController.jsonUtilizaciones!;
    let lstUtilizaciones = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var utilizacionesSeleccionado = Utilizaciones()
    
    static var jsonDetalleUtilizaciones: NSDictionary?

    let params: String = "/SAC/"+PropertiesProject.TOKEN+"/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.lstServicioNoAsistencial.delegate = self;
        // self.lstServicioNoAsistencial.dataSource = self;
        
        // let archivo  = UINib(nibName: idCelda, bundle:nil);
        // self.lstServicioNoAsistencial.register(archivo, forCellReuseIdentifier: idCelda)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // self.obtenerServiciosNoAsistenciales()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonUtilizaciones.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UtilizacionesViewCellController
        
        if let solicitud = self.jsonUtilizaciones[indexPath.row] as? Dictionary<String, Any>{
            cell.txtConvenio.text = (solicitud["convenio"] as? String ?? "");
            cell.txtDesde.text = (solicitud["desde"] as? String ?? "");
            cell.txtHasta.text = (solicitud["hasta"] as? String ?? "");
        }
        
        return (cell)
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonUtilizaciones[opcionSeleccionada] as? Dictionary<String, Any>{
            
            UtilizacionesViewController.utilizacionesSeleccionado.consConvenio = (solicitud["consConvenio"] as! Double?)!;
            UtilizacionesViewController.utilizacionesSeleccionado.convenio = (solicitud["convenio"] as? String ?? "");
            UtilizacionesViewController.utilizacionesSeleccionado.desde = (solicitud["desde"] as? String ?? "");
            UtilizacionesViewController.utilizacionesSeleccionado.hasta = (solicitud["hasta"] as? String ?? "");
            obtenerDetalle()
        }
        
        return indexPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func obtenerDetalle(){
        
        let codigo = Int(UtilizacionesViewController.utilizacionesSeleccionado.consConvenio)
        let codigoTexto = String(codigo)
        
        let fechaInicio = UtilizacionesViewController.utilizacionesSeleccionado.desde
        let fechaInicioR = fechaInicio.replacingOccurrences(of: "/", with: "-")
        
        let fechaFin = UtilizacionesViewController.utilizacionesSeleccionado.hasta
        let fechaFinR = fechaFin.replacingOccurrences(of: "/", with: "-")
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_utilizaciones_detalle+params+"/"+codigoTexto+"/"+fechaInicioR+"/"+fechaFinR)
        
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/utilizaciones/detalle/SAC/"+PropertiesProject.TOKEN+"/852/44/01-04-2011/30-04-2011")
       
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
                        //Array
                        UtilizacionesViewController.jsonDetalleUtilizaciones = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((UtilizacionesViewController.jsonDetalleUtilizaciones) != nil && (UtilizacionesViewController.jsonDetalleUtilizaciones?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabUtilizaciones")
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
                        let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                    }
                }
            }
        }
        task.resume()
        
    }

    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "utilizacionesController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
}
