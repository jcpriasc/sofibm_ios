//
//  DocumentosMedicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DocumentosMedicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //let documentosMedicos = ["documentosMedicos 1", "documentosMedicos 2", "documentosMedicos 3", "documentosMedicos 4", "documentosMedicos 5", "documentosMedicos 6", "documentosMedicos 7", "documentosMedicos 9"]
    let jsonDocumentosMedicos: NSArray = OpcionesSecundariasViewController.jsonDocumentosMedicos!
    let service =  PropertiesProject.complement_DocumentosMedicos_id;
    
    
   public static var path : URL?  = nil
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonDocumentosMedicos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DocumentosMedicosViewCell
        if let resultadoConsulta = self.jsonDocumentosMedicos[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombre.text = resultadoConsulta["nombreDocumento"] as! String?;
            cell.txtTipoDocumento.text = resultadoConsulta["tipoArchivo"] as! String?;
        }

        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        
        
        //let text = "some text" //just a text
        let listParams: String = "/SAC/ABCD1234/";
        let fileSeleccionada = indexPath[1]
        var opcionSeleccionada = ""
        var file = ""
        var idFile = "";
        
        
        
        if let solicitud = self.jsonDocumentosMedicos[fileSeleccionada] as? Dictionary<String, Any>{
            //opcionSeleccionada = (solicitud["nombreDocumento"] as! String?)!;
            //file = (solicitud["archivo"] as! String?)!;
            idFile = (solicitud["id"] as! String?)!;
        }
        let url = URL(string: PropertiesProject.URL+service+listParams+idFile)
        print(PropertiesProject.URL+service+listParams+idFile);
        
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
                        let fileSeleccionadoJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if ((fileSeleccionadoJson) != nil && (fileSeleccionadoJson?.count)!>0){
                                
                                opcionSeleccionada = (fileSeleccionadoJson?["archivo"] as! String?)!
                                file = (fileSeleccionadoJson?["nombreDocumento"] as! String?)!
                                
                                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                                    
                                    let convertedData = Data(base64Encoded: opcionSeleccionada)
                                    
                                    DocumentosMedicosViewController.path = dir.appendingPathComponent(file)
                                    let aweds: String = dir.dataRepresentation.base64EncodedString()
                                    print(aweds)
                                    //writing
                                    do {
                                        try convertedData?.write(to: DocumentosMedicosViewController.path!)
                                        
                                    }
                                    catch {/* error handling here */}
                                    
                                    //reading
                                    do {
                                        let text2 = try String(contentsOf: DocumentosMedicosViewController.path!, encoding: String.Encoding.utf8)
                                        print(text2);
                                    }
                                        
                                    catch {
                                        print("ERROR")
                                    }
                                    
                                    
                                    
                                }
                                
                                let url = NSURL.fileURL(withPath: (DocumentosMedicosViewController.path?.absoluteString)!)
                                print(url)
                                //webView.loadRequest(url)
                                
                                let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleDocumentoMedico")
                                self.show(vc as! UIViewController, sender: vc)
                                
                                
                            }else{
                                //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                                let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                                
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
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
