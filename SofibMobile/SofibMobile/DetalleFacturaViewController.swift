//
//  DetalleFacturaViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleFacturaViewController: UIViewController {

    
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblFechaRadicacion: UILabel!
    @IBOutlet var lblFechaAprobacionRechazo: UILabel!
    @IBOutlet var lblFechaAnulacion: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblValorTotalPagar: UILabel!
    @IBOutlet var lblPrestadorProveedor: UILabel!
    @IBOutlet var lblTipoServicio: UILabel!
    
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtFechaRadicacion: UILabel!
    @IBOutlet var txtFechaAprobacionRechazo: UILabel!
    @IBOutlet var txtFechaAnulacion: UILabel!
    @IBOutlet var txtValorIva: UILabel!
    @IBOutlet var txtValorTotalPagar: UILabel!
    @IBOutlet var txtPrestadorProveedor: UILabel!
    @IBOutlet var txtTipoServicio: UILabel!
    
    static var jsonDetalleFactura: NSDictionary?
     let params: String = "/SAC/ABCD1234/"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let valorTotalFact = FormatoDinero.formatearMoneda(texto:FacturaViewController.facturaSeleccionada.valorTotalFactura)

        lblNumeroFactura.text = "\(NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura"))\(": ") \(FacturaViewController.facturaSeleccionada.numeroFactura)"
        lblFechaExpedicion.text = "\(NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion"))\(": ") \(FacturaViewController.facturaSeleccionada.fechaExpedicion)"
        lblEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado"))\(": ") \(FacturaViewController.facturaSeleccionada.estado)"
        lblValorTotalFactura.text = "\(NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura"))\(": ") \(valorTotalFact)"
        
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblFechaRadicacion.text = NSLocalizedString("lbl_fecha_radicacion", comment: "lbl_fecha_radicacion")
        lblFechaAprobacionRechazo.text = NSLocalizedString("lbl_fecha_aprobacion_o_rechazo", comment: "lbl_fecha_aprobacion_o_rechazo")
        lblFechaAnulacion.text = NSLocalizedString("lbl_fecha_anulacion", comment: "lbl_fecha_anulacion")
        lblValorIva.text = NSLocalizedString("lbl_valor_iva", comment: "lbl_valor_iva")
        lblValorTotalPagar.text = NSLocalizedString("lbl_valor_total_pagar", comment: "lbl_valor_total_pagar")
        lblPrestadorProveedor.text = NSLocalizedString("lbl_prestador_proveedor", comment: "lbl_prestador_proveedor")
        lblTipoServicio.text = NSLocalizedString("lbl_tipo_servicio", comment: "lbl_tipo_servicio")

        txtCiudad.text = FacturaViewController.facturaSeleccionada.ciudad
        txtFechaRadicacion.text = FacturaViewController.facturaSeleccionada.fechaRadicacion
        txtFechaAprobacionRechazo.text = FacturaViewController.facturaSeleccionada.fechaAprobacionRechazo
        txtFechaAnulacion.text = FacturaViewController.facturaSeleccionada.fechaAnulacion
        
        txtValorIva.text = FormatoDinero.formatearMoneda(texto: FacturaViewController.facturaSeleccionada.valorIva)
        txtValorTotalPagar.text = FormatoDinero.formatearMoneda(texto: FacturaViewController.facturaSeleccionada.valorTotalPagar)
        txtPrestadorProveedor.text = FacturaViewController.facturaSeleccionada.prestadorProveedor
        txtTipoServicio.text = FacturaViewController.facturaSeleccionada.tipoServicio
        
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
        
        let codigo = Int(FacturaViewController.facturaSeleccionada.consFactura)
        let codigoTexto = String(codigo)
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_factura_detalle+params+codigoTexto)

        //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/factura/detalle/SAC/ABCD1234/315")
        
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
                        DetalleFacturaViewController.jsonDetalleFactura = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((DetalleFacturaViewController.jsonDetalleFactura) != nil && (DetalleFacturaViewController.jsonDetalleFactura?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabFactura")
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
  

}
