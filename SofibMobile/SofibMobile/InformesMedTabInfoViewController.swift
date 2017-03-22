//
//  InformesMedTabInfoViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/18/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class InformesMedTabInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    static var jsonTabDocumentos: NSArray?
    
    @IBOutlet var lblEntidad: UILabel!
    @IBOutlet var lblEvolucionPaciente: UILabel!
    @IBOutlet var lblTipoPaciente: UILabel!
    @IBOutlet var lblDadoAlta: UILabel!
    @IBOutlet var lblFallecido: UILabel!
    @IBOutlet var lblFechaInicioHospitalizacion: UILabel!
    
    public static var path : URL?  = nil
    
    let service =  PropertiesProject.complement_documento_informes_medico;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for det in InformesMedicosViewController.jsonDetalleInformeMedico! {
            if let solicitud = det  as? Dictionary<String, Any>{
                
                let dadoAlta = solicitud["dadoAlta"] as! Bool?;
                let fallecido = solicitud["fallecido"] as! Bool?;
                
                if dadoAlta! {
                    lblDadoAlta.text = "\(NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")) \(": ")\(NSLocalizedString("lbl_si", comment: "lbl_si"))"
                }else{
                    lblDadoAlta.text = "\(NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")) \(": ")\(NSLocalizedString("lbl_no", comment: "lbl_no"))"
                }
                
                if fallecido! {
                    lblFallecido.text = "\(NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")) \(": ")\(NSLocalizedString("lbl_si", comment: "lbl_si"))"
                }else{
                    lblFallecido.text = "\(NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")) \(": ")\(NSLocalizedString("lbl_no", comment: "lbl_no"))"
                }
                
                lblFechaInicioHospitalizacion.text = "\(NSLocalizedString("lbl_fecha_hospitalizacion", comment: "lbl_fecha_hospitalizacion")) \(": ")\((solicitud["fechaInicioHospitaliza"] as? String ?? ""))"
                
                InformesMedTabInfoViewController.jsonTabDocumentos = solicitud["archivo"] as? NSArray
                lblEntidad.text = "\(NSLocalizedString("lbl_entidad_prestadora", comment: "lbl_entidad_prestadora")) \(": ")\((solicitud["prestador"] as? String ?? ""))"
                lblEvolucionPaciente.text = "\(NSLocalizedString("lbl_evolucion", comment: "lbl_evolucion")) \(": ")\((solicitud["evoluciondelpaciente"] as? String ?? ""))"
                lblTipoPaciente.text = "\(NSLocalizedString("lbl_tipo_paciente", comment: "lbl_tipo_paciente")) \(": ")\((solicitud["pacienteEstado"] as? String ?? ""))"
                
            }
        }
        
        
        
        /*if let solicitud = InformesMedicosViewController.jsonDetalleInformeMedico  as? Dictionary<String, Any>{
            
            InformesMedTabInfoViewController.jsonTabDocumentos = solicitud["archivo"] as? NSArray
            lblEntidad.text = "\(NSLocalizedString("lbl_entidad_prestadora", comment: "lbl_entidad_prestadora")) \(": ")\((solicitud["prestador"] as? String ?? ""))"
            lblEvolucionPaciente.text = "\(NSLocalizedString("lbl_evolucion", comment: "lbl_evolucion")) \(": ")\((solicitud["evoluciondelpaciente"] as? String ?? ""))"
            lblTipoPaciente.text = "\(NSLocalizedString("lbl_tipo_paciente", comment: "lbl_tipo_paciente")) \(": ")\((solicitud["pacienteEstado"] as? String ?? ""))"
            lblDadoAlta.text = "\(NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")) \(": ")\((solicitud["dadoAlta"] as? String ?? ""))"
            lblFallecido.text = "\(NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")) \(": ")\((solicitud["fallecido"] as? String ?? ""))"
            
            
        }*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (InformesMedTabInfoViewController.jsonTabDocumentos!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedTabInfoTableViewCell
        
        if let solicitud = InformesMedTabInfoViewController.jsonTabDocumentos?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNomnre.text = (solicitud["nombreDocumento"] as? String ?? " ");
            cell.txtTipoDocumento.text = (solicitud["tipoDocumento"] as? String ?? " ");
        }

        return (cell)
 
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        
        /*
         String params = "SAC/ABCD1234/"+ InformesMedicosFragment.detalleInformeMedicoSeleccionado.getLstDocumentos().get((int)viewHolder.iconOpcion.getTag()).getId();
         
         
         ConexionServicioListaTask task = new ConexionServicioListaTask(context, getContext().getResources().getString(R.string.complement_documento_informes_medico), params);
 */
        
        
        //let text = "some text" //just a text
        let listParams: String = "/SAC/ABCD1234/";
        let fileSeleccionada = indexPath[1]
        var opcionSeleccionada = ""
        var file = ""
        var idFile = "";
        
        
        if let solicitud = InformesMedTabInfoViewController.jsonTabDocumentos?[fileSeleccionada] as? Dictionary<String, Any>{
            //opcionSeleccionada = (solicitud["nombreDocumento"] as! String?)!;
            //file = (solicitud["archivo"] as! String?)!;
            idFile = (solicitud["id"] as! String?)!;
        }
        let url = URL(string: PropertiesProject.URL+service+listParams+idFile)
        
        
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
                                    
                                    InformesMedTabInfoViewController.path = dir.appendingPathComponent(file)
                                    let aweds: String = dir.dataRepresentation.base64EncodedString()
                                    print(aweds)
                                    //writing
                                    do {
                                        try convertedData?.write(to: InformesMedTabInfoViewController.path!)
                                        
                                    }
                                    catch {/* error handling here */}
                                    
                                    //reading
                                    do {
                                        let text2 = try String(contentsOf: InformesMedTabInfoViewController.path!, encoding: String.Encoding.utf8)
                                        print(text2);
                                    }
                                        
                                    catch {
                                        print("ERROR")
                                    }
                                    
                                    
                                    
                                }
                                
                                let url = NSURL.fileURL(withPath: (InformesMedTabInfoViewController.path?.absoluteString)!)
                                print(url)
                                //webView.loadRequest(url)
                                
                                let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleInfoGeneral")
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
    
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        
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
