
//
//  DetalleGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleGiroViewController: UIViewController {

    @IBOutlet var lblNumeroSolicitud: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var lblIdentificacionBeneficiario: UILabel!
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblEstado: UILabel!
    
    @IBOutlet var lblTipoIdentificacionBeneficiario: UILabel!
    @IBOutlet var lblFechaInicio: UILabel!
    @IBOutlet var lblFechaFin: UILabel!
    @IBOutlet var lblValorMonedaExtranjero: UILabel!
    @IBOutlet var lblValorMonedaLocal: UILabel!
    @IBOutlet var lblRegistraDevolucion: UILabel!
    @IBOutlet var lblValorDevolucion: UILabel!
    @IBOutlet var lblLegalizado: UILabel!
    @IBOutlet var lblValorLegalizado: UILabel!
    @IBOutlet var lblAprobadoGiro: UILabel!
    @IBOutlet var lblJustificacionAnulacion: UILabel!
    
    @IBOutlet var txtTipoIdentificacionBeneficiario: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtFechaFin: UILabel!
    @IBOutlet var txtValorMonedaExtranjero: UILabel!
    @IBOutlet var txtValorMonedaLocal: UILabel!
    @IBOutlet var txtRegistraDevolucion: UILabel!
    @IBOutlet var txtValorDevolucion: UILabel!
    @IBOutlet var txtLegalizado: UILabel!
    @IBOutlet var txtValorLegalizado: UILabel!
    @IBOutlet var txtAprobadoGiro: UILabel!
    @IBOutlet var txtJustificacionAnulacion: UILabel!
    
    public static var path : URL?  = nil
    
    static var jsonDetalleGiro: NSDictionary?
    let params: String = "/SAC/ABCD1234/"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTipoIdentificacionBeneficiario.text = NSLocalizedString("lbl_tipo_identificacion_beneficiario", comment: "lbl_tipo_identificacion_beneficiario")
        lblFechaInicio.text = NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")
        lblFechaFin.text = NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin")
        lblValorMonedaExtranjero.text = NSLocalizedString("lbl_valor_moneda_extranjero", comment: "lbl_valor_moneda_extranjero")
        lblValorMonedaLocal.text = NSLocalizedString("lbl_valor_moneda_local", comment: "lbl_valor_moneda_local")
        lblRegistraDevolucion.text = NSLocalizedString("lbl_registra_devolucion", comment: "lbl_registra_devolucion")
        lblValorDevolucion.text = NSLocalizedString("lbl_valor_devolucion", comment: "lbl_valor_devolucion")
        lblLegalizado.text = NSLocalizedString("lbl_legalizado", comment: "lbl_legalizado")
        lblValorLegalizado.text = NSLocalizedString("lbl_valor_legalizado", comment: "lbl_valor_legalizado")
        lblAprobadoGiro.text = NSLocalizedString("lbl_aprobado_giro", comment: "lbl_aprobado_giro")
        lblJustificacionAnulacion.text = NSLocalizedString("lbl_justificacion_anulacion", comment: "lbl_justificacion_anulacion")
        
        lblNumeroSolicitud.text = "\(NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud"))\(": ") \(GiroViewController.giroSeleccionado.numeroSolicitud)"
        lblTipoGiro.text = "\(NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro"))\(": ") \(GiroViewController.giroSeleccionado.tipoGiro)"
        lblIdentificacionBeneficiario.text = "\(NSLocalizedString("lbl_identificacion_beneficiario", comment: "lbl_identificacion_beneficiario")) \(": ")\(GiroViewController.giroSeleccionado.identificacionBeneficiario)"
        lblBeneficiario.text = "\(NSLocalizedString("lbl_beneficiario", comment: "lbl_beneficiario"))\(": ") \(GiroViewController.giroSeleccionado.beneficiario)"
        lblEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado"))\(": ") \(GiroViewController.giroSeleccionado.estado)"
        
        txtTipoIdentificacionBeneficiario.text = GiroViewController.giroSeleccionado.tipoIdentificacionBeneficiario
        txtFechaInicio.text = GiroViewController.giroSeleccionado.fechaInicio
        txtFechaFin.text = GiroViewController.giroSeleccionado.fechaFin
       // txtValorMonedaExtranjero.text =  FormatoDinero.formatearMoneda(texto: GiroViewController.giroSeleccionado.valorMonedaExtranjero)
        txtValorMonedaExtranjero.text =  FormatoDinero.formatearMoneda(texto: "")

        txtValorMonedaLocal.text = GiroViewController.giroSeleccionado.valorMonedaLocal
        txtRegistraDevolucion.text = GiroViewController.giroSeleccionado.registraDevolucion
        txtValorDevolucion.text = GiroViewController.giroSeleccionado.valorDevolucion
        txtLegalizado.text = GiroViewController.giroSeleccionado.legalizado
        txtValorLegalizado.text = GiroViewController.giroSeleccionado.valorLegalizado
        txtAprobadoGiro.text = GiroViewController.giroSeleccionado.aprobadoGiro
        txtJustificacionAnulacion.text = GiroViewController.giroSeleccionado.justificacionAnulacion
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_detalle(_ sender: AnyObject) {
        obtenerDetalle()
    }

    @IBAction func action_decargar_archivo(_ sender: AnyObject) {
        
        let pathURL = PropertiesProject.URL_INFO_DOCU_GIRO+String(GiroViewController.giroSeleccionado.consecutivo)+"&NOMBRE_ROL=ADMIN";
       
        print(pathURL)
        
        let randomNum:UInt32 = arc4random_uniform(1000)
        
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        DetalleGiroViewController.path = documentsUrl.appendingPathComponent("detalleGiro"+String(randomNum)+".pdf")
        
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
                    try FileManager.default.copyItem(at: tempLocalUrl, to: DetalleGiroViewController.path!)
                    
                    let url = NSURL.fileURL(withPath: (DetalleGiroViewController.path?.absoluteString)!)
                    print(url)
                    //webView.loadRequest(url)
                    DispatchQueue.main.async {
                        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "documendoGiroPDF")
                        self.show(vc as! UIViewController, sender: vc)
                    }
                } catch (let writeError) {
                    print("Error creating a file \(DetalleGiroViewController.path!) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description");
            }
            
        }
        task.resume()
        
        
        
    }
    
    
    
    
    func obtenerDetalle(){
        
        let codigo = Int(GiroViewController.giroSeleccionado.consecutivo)
        let codigoTexto = String(codigo)
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_giro_detalle+params+codigoTexto)
        
        print(url)
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/giro/detalle/SAC/ABCD1234/475")
        
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
                        DetalleGiroViewController.jsonDetalleGiro = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((DetalleGiroViewController.jsonDetalleGiro) != nil && (DetalleGiroViewController.jsonDetalleGiro?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabGiro")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
