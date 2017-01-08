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
    
    let lblVerDetalle = NSLocalizedString("lbl_ver_detalle", comment: "lbl_ver_detalle")
    let lblPdfIngles = NSLocalizedString("lbl_pdf_en", comment: "lbl_pdf_en")
    let lblPdfEspanol = NSLocalizedString("lbl_pdf_es", comment: "lbl_pdf_es")
    let lblCancelar = NSLocalizedString("lbl_cancelar", comment: "lbl_cancelar")
    let lblSeleccionarOpcion = NSLocalizedString("lbl_seleccionar_opcion", comment: "lbl_seleccionar_opcion")
    

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
        //let actionSheet = UIAlertController(title: "Detalle", message: "Seleccione una opción", preferredStyle: UIAlertControllerStyle.actionSheet)
        let actionSheet = UIAlertController(title: lblVerDetalle, message: lblSeleccionarOpcion, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: lblVerDetalle, style: .default, handler: { (action) in
            print("Ver Detalle "+String(fileSeleccionada));
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblPdfEspanol, style: .default, handler: { (action) in
            
            let pathURL = "http://pruebas-sofib.coomeva.com.co/cni-web/exportDocument?format=pdf&reportName=informe_medico&CONS_INFORME_MEDICO=396&CONS_SOLICITUD_ATENCION=730&nocache=15416516316"
            
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
            
            
            //let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleInformeMedico")
            //self.show(vc as! UIViewController, sender: vc)
            
            //print("pdf Espanol "+String(fileSeleccionada));
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblPdfIngles, style: .default, handler: { (action) in
            print("pdf Ingles "+String(fileSeleccionada));
        }))
        
        actionSheet.addAction(UIAlertAction(title: lblCancelar, style: .cancel, handler: { (action) in
             print("cancelar "+String(fileSeleccionada));
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
