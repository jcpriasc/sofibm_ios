//
//  OpcionesSecundariasLogViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/5/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesSecundariasLogViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    static var jsonServicioNoAsistencial: NSArray?
    static var jsonGiros: NSArray?
    static var jsonNotasCreditosGiros: NSArray?
    static var jsonFacturas: NSArray?
    static var jsonNotasCreditoDebito: NSArray?
    static var jsonUtilizaciones: NSArray?
    static var jsonEncuesta: NSArray?
    static var jsonSolicitudAprobacion: NSArray?
    let params: String = "/SAC/ABCD1234/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud
    
    let opciones = [NSLocalizedString("lbl_servicio_no_asistencial", comment: "lbl_servicio_no_asistencial"),
                    NSLocalizedString("lbl_titulo_giro", comment: "lbl_titulo_giro"),
                    NSLocalizedString("lbl_titulo_nota_credito_giro", comment: "lbl_titulo_nota_credito_giro"),
                    NSLocalizedString("lbl_titulo_factura", comment: "lbl_titulo_factura"),
                    NSLocalizedString("lbl_titulo_notas_credito_debito", comment: "lbl_titulo_notas_credito_debito"),
                    NSLocalizedString("lbl_titulo_utilizaciones", comment: "lbl_titulo_utilizaciones"),
                    NSLocalizedString("lbl_titulo_encuesta_satisfaccion", comment: "lbl_titulo_encuesta_satisfaccion"),
                    NSLocalizedString("lbl_consultar_solicitudes_aprobacion", comment: "lbl_consultar_solicitudes_aprobacion")]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (opciones.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellOpcion = tableView.dequeueReusableCell(withIdentifier: "cellOpcion", for: indexPath) as! OpcionesSecundariasViewCell
        
        
        cellOpcion.lblOpcion.text = opciones[indexPath.row]
        
        let opcionSeleccionada = indexPath.row
        
        switch opcionSeleccionada {
        case 0:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_no_asistenciales")
        case 1:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_giros")
        case 2:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_nota_credito_giro")
        case 3:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_factura")
        case 4:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_nota_credito_debito")
        case 5:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_utilizaciones")
        case 6:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_encuestas")
        default:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_aprobacion")
        }
        
        
        
        return cellOpcion
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        switch opcionSeleccionada {
        case 0:
            obtenerServiciosNoAsistenciales()
        case 1:
            obtenerGiros()
        case 2:
            obtenerNotasCreditoGiros()
        case 3:
            obtenerFacturas()
        case 4:
            obtenerNotaCreditoDebito()
        case 5:
            obtenerUtilizaciones()
        case 6:
            obtenerEncuesta()
        default:
            obtenerSolicitudAprobacion()
        }
        
        return indexPath
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
    
    func obtenerServiciosNoAsistenciales(){
      
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_serviciosNoAsistenciales+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/serviciosNoAsistenciales/SAC/ABCD1234/852")
        
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
                        
                        OpcionesSecundariasLogViewController.jsonServicioNoAsistencial = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonServicioNoAsistencial?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "servicioNoAsistencialController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerGiros(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_giro+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/giro/SAC/ABCD1234/852")
        
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
                    
                        OpcionesSecundariasLogViewController.jsonGiros = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonGiros?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "girosController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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

    func obtenerNotasCreditoGiros(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_giro_notaCredito+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/giro/notaCredito/SAC/ABCD1234/789")
        
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
                        OpcionesSecundariasLogViewController.jsonNotasCreditosGiros = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonNotasCreditosGiros != nil) && (OpcionesSecundariasLogViewController.jsonNotasCreditosGiros?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "notasCreditoGirosController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerFacturas(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_factura+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/factura/SAC/ABCD1234/852")
        
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
                        OpcionesSecundariasLogViewController.jsonFacturas = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonFacturas?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "facturasController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerNotaCreditoDebito(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_nota+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/nota/SAC/ABCD1234/848")
        
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
                        OpcionesSecundariasLogViewController.jsonNotasCreditoDebito = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonNotasCreditoDebito?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "notaCreditoDebitoController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerUtilizaciones(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_utilizaciones+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/utilizaciones/SAC/ABCD1234/852")
        
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
                        OpcionesSecundariasLogViewController.jsonUtilizaciones = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonUtilizaciones?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "utilizacionesController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerEncuesta(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_encuesta+params)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/encuesta/SAC/ABCD1234/730")
        
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
                         OpcionesSecundariasLogViewController.jsonEncuesta = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if (( OpcionesSecundariasLogViewController.jsonEncuesta?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "encuestaController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
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
    
    func obtenerSolicitudAprobacion(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_aprobacion+"/SAC/ABCD1234/0/0/0/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud+"/l")
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/aprobacion/SAC/ABCD1234/0/0/0/0/l")
        
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
                        OpcionesSecundariasLogViewController.jsonSolicitudAprobacion = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if (( OpcionesSecundariasLogViewController.jsonSolicitudAprobacion?.count)!>0){
                            SolicitudAprobacionViewController.viewBack = "tableViewLogisticoController"
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "solicitudesAprobacionController")
                            self.show(vc as! UIViewController, sender: vc)

                        }else{
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



}
