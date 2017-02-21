//
//  InformesMedicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class InformesMedicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //let informesMedicos = ["informesMedicos 1", "informesMedicos 2", "informesMedicos 3", "informesMedicos 4", "informesMedicos 5", "informesMedicos 6", "informesMedicos 7", "informesMedicos 9"]
    let jsonInformesMedicos: NSArray = OpcionesSecundariasViewController.jsonInformesMedicos!
    
    public static var path : URL?  = nil
    static var jsonDetalleInformeMedico: NSArray?
    
    let lblVerDetalle = NSLocalizedString("lbl_ver_detalle", comment: "lbl_ver_detalle")
    let lblPdfIngles = NSLocalizedString("lbl_pdf_en", comment: "lbl_pdf_en")
    let lblPdfEspanol = NSLocalizedString("lbl_pdf_es", comment: "lbl_pdf_es")
    let lblCancelar = NSLocalizedString("lbl_cancelar", comment: "lbl_cancelar")
    let lblSeleccionarOpcion = NSLocalizedString("lbl_seleccionar_opcion", comment: "lbl_seleccionar_opcion")
    let params: String = "/SAC/ABCD1234/"

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonInformesMedicos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedicosViewCell
        
        if let resultadoConsulta = self.jsonInformesMedicos[indexPath.row] as? Dictionary<String, Any>{
            
            let dadoAlta = resultadoConsulta["dadoAlta"] as! Bool?;
            let fallecido = resultadoConsulta["fallecido"] as! Bool?;
            
            if dadoAlta! {
                cell.txtDadoAlta.text = NSLocalizedString("lbl_si", comment: "lbl_si")
            }else{
                cell.txtDadoAlta.text = NSLocalizedString("lbl_no", comment: "lbl_no")
            }
            
            if fallecido! {
                cell.txtFallecido.text = NSLocalizedString("lbl_si", comment: "lbl_si")
            }else{
                cell.txtFallecido.text = NSLocalizedString("lbl_no", comment: "lbl_no")
            }
            
            cell.txtFechaRegistro.text = resultadoConsulta["creadoFecha"] as! String?;
            cell.txtCiudad.text = resultadoConsulta["ciudad"] as! String?;
            cell.txtEstado.text = resultadoConsulta["pacienteEstado"] as! String?;
        }
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        let fileSeleccionada = indexPath[1]
        
        var consInformeMedico = 0
        
        if let solicitud = self.jsonInformesMedicos[fileSeleccionada] as? Dictionary<String, Any>{
            //opcionSeleccionada = (solicitud["nombreDocumento"] as! String?)!;
            //file = (solicitud["archivo"] as! String?)!;
            consInformeMedico = (solicitud["consInformeMedico"] as! Int?)!;
        }
        
        //let actionSheet = UIAlertController(title: "Detalle", message: "Seleccione una opción", preferredStyle: UIAlertControllerStyle.actionSheet)
        let actionSheet = UIAlertController(title: lblVerDetalle, message: lblSeleccionarOpcion, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: lblVerDetalle, style: .default, handler: { (action) in
            self.obtenerDetalle(consInformeMedico: consInformeMedico)
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblPdfEspanol, style: .default, handler: { (action) in
            
            let pathURL = PropertiesProject.URL_INFO_MED+String(consInformeMedico)+PropertiesProject.complement1_info_med+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud+PropertiesProject.complement2_info_med;
            
            print(pathURL)
            
            let randomNum:UInt32 = arc4random_uniform(1000)
            
            let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
            InformesMedicosViewController.path = documentsUrl.appendingPathComponent("informe_medico"+String(randomNum)+".pdf")
            
            let fileURL = URL(string: pathURL)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            
            let request = URLRequest(url:fileURL!)
            
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                
                
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: InformesMedicosViewController.path!)
                        
                        let url = NSURL.fileURL(withPath: (InformesMedicosViewController.path?.absoluteString)!)
                        print(url)
                        //webView.loadRequest(url)
                        DispatchQueue.main.async {
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleInformeMedicoPDF")
                            self.show(vc as! UIViewController, sender: vc)
                        }
                    } catch (let writeError) {
                        print("Error creating a file \(InformesMedicosViewController.path!) : \(writeError)")
                    }
                    
                } else {
                    print("Error took place while downloading a file. Error description");
                }
                
            }
            task.resume()
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblPdfIngles, style: .default, handler: { (action) in
            let pathURL = PropertiesProject.URL_INFO_MED+String(consInformeMedico)+PropertiesProject.complement1_info_med+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud+PropertiesProject.complement2_info_med+PropertiesProject.complement3_info_med_ingles;
            
            print(pathURL)
            
            let randomNum:UInt32 = arc4random_uniform(1000)
            
            let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
            InformesMedicosViewController.path = documentsUrl.appendingPathComponent("informe_medico"+String(randomNum)+".pdf")
            
            let fileURL = URL(string: pathURL)
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            
            let request = URLRequest(url:fileURL!)
            
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                
                
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: InformesMedicosViewController.path!)
                        
                        let url = NSURL.fileURL(withPath: (InformesMedicosViewController.path?.absoluteString)!)
                        print(url)
                        //webView.loadRequest(url)
                        DispatchQueue.main.async {
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleInformeMedicoPDF")
                            self.show(vc as! UIViewController, sender: vc)
                        }
                    } catch (let writeError) {
                        print("Error creating a file \(InformesMedicosViewController.path!) : \(writeError)")
                    }
                    
                } else {
                    print("Error took place while downloading a file. Error description");
                }
                
            }
            task.resume()
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblCancelar, style: .cancel, handler: { (action) in
            
        }))
        
        
        self.present(actionSheet, animated: true, completion: nil)
        
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
    
    func obtenerDetalle(consInformeMedico: Int){
        print(PropertiesProject.URL+PropertiesProject.complement_InformesMedicos_detalle+params+String(consInformeMedico))
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_InformesMedicos_detalle+params+String(consInformeMedico))
        
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
                        
                        InformesMedicosViewController.jsonDetalleInformeMedico = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
                        if ((InformesMedicosViewController.jsonDetalleInformeMedico) != nil && (InformesMedicosViewController.jsonDetalleInformeMedico?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabInformesMedicos")
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
