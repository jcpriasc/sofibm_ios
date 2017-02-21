//
//  DetalleNotaCreditoDebitoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleNotaCreditoDebitoViewController: UIViewController {

    @IBOutlet var lblFechaAprobacion: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblNumeroNota: UILabel!
    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblMotivo: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblTipoNota: UILabel!
    @IBOutlet var lblValorTotalNotaCredito: UILabel!
    
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtMotivo: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtTipoNota: UILabel!
    @IBOutlet var txtValorTotalNotaCredito: UILabel!
    
    static var jsonDetalleNotaCreditoDebito: NSDictionary?
    let params: String = "/SAC/ABCD1234/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFechaAprobacion.text = "\(NSLocalizedString("lbl_fecha_aprobacion", comment: "lbl_fecha_aprobacion")) \(": ")\(NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.fechaAprobacion)"
        lblFechaExpedicion.text = "\(NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion"))\(": ") \(NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.fechaExpedicion)"
        lblNumeroFactura.text = "\(NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura"))\(": ") \(NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.numeroFactura)"
        lblNumeroNota.text = "\(NSLocalizedString("lbl_numero_nota", comment: "lbl_numero_nota"))\(": ") \(NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.numeroNota)"
        
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblMotivo.text = NSLocalizedString("lbl_motivo", comment: "lbl_motivo")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblTipoNota.text = NSLocalizedString("lbl_tipo_nota", comment: "lbl_tipo_nota")
        lblValorTotalNotaCredito.text = NSLocalizedString("lbl_valor_total_nota_credito", comment: "lbl_valor_total_nota_credito")

        
        txtCiudad.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.ciudad
        txtProveedor.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.proveedor
        txtMotivo.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.motivo
        txtEstado.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.estado
        txtTipoNota.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.tipoNota
        txtValorTotalNotaCredito.text = NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.valorTotalNotaCredito

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func action_detalle(_ sender: AnyObject) {
        obtenerDetalle()
    }
    
    
    func obtenerDetalle(){
        
        let codigo = Int(NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.consNota)
        let codigoTexto = String(codigo)
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_nota_detalle+params+codigoTexto)
        
        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/nota/detalle/SAC/ABCD1234/153")
        
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
                        DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito) != nil && (DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabNotaCreditoDebito")
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "detalleNotaCreditoDebito"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
