//
//  FacturaTabFacturaViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaTabFacturaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblFechaEmision: UILabel!
    @IBOutlet var lblFechaVencimiento: UILabel!
    @IBOutlet var lblFechaRecibidoCoomeva: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    static var jsonTabFactura: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleFacturaViewController.jsonDetalleFactura as? Dictionary<String, Any>{
            FacturaTabFacturaViewController.jsonTabFactura = solicitud["factura"] as? NSArray
            
            lblNumeroFactura.text = "\(NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")) \(": ")\((solicitud["facturaNro"] as? String ?? ""))"
            lblFechaEmision.text = "\(NSLocalizedString("lbl_fecha_emision", comment: "lbl_fecha_emision"))\(": ") \((solicitud["fechaEmision"] as? String ?? ""))"
            lblFechaVencimiento.text = "\(NSLocalizedString("lbl_fecha_vencimiento_pago", comment: "lbl_fecha_vencimiento_pago")) \(": ")\((solicitud["fechaVencimientoPago"] as? String ?? ""))"
            lblFechaRecibidoCoomeva.text = "\(NSLocalizedString("lbl_fecha_recibido_coomeva", comment: "lbl_fecha_recibido_coomeva")) \(": ")\((solicitud["fechaRecibidoCoomeva"] as? String ?? ""))"
            lblProveedor.text = "\(NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")) \(": ")\((solicitud["proveedor"] as? String ?? ""))"
            lblValorTotalFactura.text = "\(NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura"))\(": ") \((solicitud["valorTotalFactura"] as? String ?? ""))"
            
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (FacturaTabFacturaViewController.jsonTabFactura!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacturaTabFacturaViewCellController
        
        if let solicitud = FacturaTabFacturaViewController.jsonTabFactura?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtProveedor.text = (solicitud["proveedor"] as? String ?? " ");
            cell.txtNumeroOrdenServicio.text = (solicitud["ordenServicio"] as? String ?? " ");
            cell.txtServicio.text = (solicitud["servicio"] as? String ?? " ");
            cell.txtFechaInicio.text = (solicitud["fechaInicio"] as? String ?? " ");
            cell.txtFechaFinalizacion.text = (solicitud["fechaFinalizaServicio"] as? String ?? " ");
            cell.txtValorServicio.text = (solicitud["valorServicio"] as? String ?? " ");
            cell.txtSeguroHotelero.text = (solicitud["seguroHotelero"] as? String ?? " ");
            cell.txtTipoPago.text = (solicitud["tipoPago"] as? String ?? " ");
            
        }
        
        return (cell)
        
        
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
