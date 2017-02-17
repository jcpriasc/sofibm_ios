//
//  OpcionesSecundariasViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/4/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class OpcionesSecundariasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let opciones = [NSLocalizedString("lbl_autorizaciones", comment: "lbl_autorizaciones"),
                    NSLocalizedString("lbl_servicio_asistencial", comment: "lbl_servicio_asistencial"),
                    NSLocalizedString("lbl_informes_medicos", comment: "lbl_informes_medicos"),
                    NSLocalizedString("lbl_documentos_medicos", comment: "lbl_documentos_medicos"),
                    NSLocalizedString("lbl_bitacoras", comment: "lbl_bitacoras"),
                    NSLocalizedString("lbl_epicrisis", comment: "lbl_epicrisis"),
                    NSLocalizedString("lbl_procedimientos_adicionales", comment: "lbl_procedimientos_adicionales"),
                    NSLocalizedString("lbl_funcionarios_externos", comment: "lbl_funcionarios_externos"),
                    NSLocalizedString("lbl_consultar_solicitudes_aprobacion", comment: "lbl_consultar_solicitudes_aprobacion")]
    
    
    static var jsonAutorizaciones: NSArray?
    static var jsonServiciosAsistenciales: NSArray?
    static var jsonInformesMedicos: NSArray?
    static var jsonDocumentosMedicos: NSArray?
    static var jsonBitacora: NSArray?
    static var jsonEpicrisis: NSArray?
    static var jsonProcedimientosAdicionales: NSArray?
    static var jsonFuncionariosExternos: NSArray?
    static var jsonSolicitudAprobacion: NSArray?
    
    let params: String = "/SAC/ABCD1234/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud
    
    
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
            cellOpcion.imgOpcion.image = UIImage(named: "icon_autorizaciones")
        case 1:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_servicios_asistenciales")
        case 2:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_informes_medicos")
        case 3:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_documentos_medicos")
        case 4:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_bitacoras")
        case 5:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_epicrisis")
        case 6:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_procedimientos_ad")
        case 7:
            cellOpcion.imgOpcion.image = UIImage(named: "icon_funcionarios")
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
            //ya
            obtenerAutorizaciones()
        case 1:
            obtenerServiciosAsistenciales()
        case 2:
            //ya
            obtenerInformesMedicos()
        case 3:
            //ya
            obtenerDocumentosMedicos()
        case 4:
            FiltroBitacoraViewController.viewBack = "tableViewMedicoController"
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "bitacorasView")
            self.show(vc as! UIViewController, sender: vc)
            print("The last letter of the alphabet")
        case 5:
            //ya
            obtenerEpicrisis()
        case 6:
            //ya
            obtenerProcedimientoAdicionales()
        case 7:
            //ya
            obtenerFuncionariosExternos()
        default:
            //ya
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
    
    
    func obtenerAutorizaciones(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_Autorizaciones+params)
        
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
                        OpcionesSecundariasViewController.jsonAutorizaciones = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        if ((OpcionesSecundariasViewController.jsonAutorizaciones?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "autorizacionesView")
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
    
    func obtenerServiciosAsistenciales(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_ServiciosAsistenciales+params)
        
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
                        OpcionesSecundariasViewController.jsonServiciosAsistenciales = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        if ((OpcionesSecundariasViewController.jsonServiciosAsistenciales?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "")
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
    
    func obtenerInformesMedicos(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_InformesMedicos+params)
        
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
                        OpcionesSecundariasViewController.jsonInformesMedicos = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasViewController.jsonInformesMedicos?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "informesMedicosView")
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
    
    func obtenerDocumentosMedicos(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_DocumentosMedicos+params)
        
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
                        OpcionesSecundariasViewController.jsonDocumentosMedicos = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasViewController.jsonDocumentosMedicos?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "documentosMedicosView")
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
    
    func obtenerEpicrisis(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_Epicrisis+params)
        
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
                        OpcionesSecundariasViewController.jsonEpicrisis = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasViewController.jsonEpicrisis?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "epicrisisView")
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
    
    func obtenerProcedimientoAdicionales(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_ProcedimientoAdicionales+params)
        
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
                        OpcionesSecundariasViewController.jsonProcedimientosAdicionales = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasViewController.jsonProcedimientosAdicionales?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "procedimientosAdicionalesView")
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
    
    func obtenerFuncionariosExternos(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_FuncionariosExternos+params)
        
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
                        OpcionesSecundariasViewController.jsonFuncionariosExternos = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasViewController.jsonFuncionariosExternos?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "funcionariosExternosView")
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
    

    func obtenerSolicitudAprobacion(){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_aprobacion+"/SAC/ABCD1234/0/0/0/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud+"/m")
        
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
                        OpcionesSecundariasLogViewController.jsonSolicitudAprobacion = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((OpcionesSecundariasLogViewController.jsonSolicitudAprobacion?.count)!>0){
                            SolicitudAprobacionViewController.viewBack = "tableViewMedicoController"
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "solicitudesAprobacionController")
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
    
    

}
