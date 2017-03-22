//
//  FacturaTabImpuestosViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaTabImpuestosViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    static var jsonTabImpuestos: NSArray?
    
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblValorTotalPagar: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleFacturaViewController.jsonDetalleFactura  as? Dictionary<String, Any>{
            
            FacturaTabImpuestosViewController.jsonTabImpuestos = solicitud["impuestos"] as? NSArray
            lblNumeroFactura.text = "\(NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")) \(": ")\((solicitud["facturaNro"] as? String ?? ""))"
            lblValorIva.text = NSLocalizedString("lbl_valor_iva", comment: "lbl_valor_iva")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorIva"] as? String ?? ""))!
            lblValorTotalPagar.text = NSLocalizedString("lbl_valor_total_pagar", comment: "lbl_valor_total_pagar")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalPagar"] as? String ?? ""))!
            lblValorTotalFactura.text = NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalFactura"] as? String ?? ""))!
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (FacturaTabImpuestosViewController.jsonTabImpuestos!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacturaTabImpuestosViewCellController
        
        if let solicitud = FacturaTabImpuestosViewController.jsonTabImpuestos?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNumeroOrdenServicio.text = (solicitud["ordenServicio"] as? String ?? " ");
            cell.txtTipoImpuesto.text = (solicitud["tipoImpuesto"] as? String ?? " ");
            cell.txtServicio.text = (solicitud["servicio"] as? String ?? " ");
            
            let porcentajeString = (solicitud["porcentaje"] as? String ?? "");
            
            if(porcentajeString == ""){
                cell.txtPorcentaje.text = " ";
            }else{
                cell.txtPorcentaje.text = porcentajeString+"%"
            }
            
            cell.txtValorImpuesto.text = FormatoDinero.formatearMoneda(texto:(solicitud["valorImpuesto"] as? String ?? " "));
            cell.txtAplicaSeguroHotelero.text = (solicitud["aplicaSeguro"] as? String ?? " ");
            
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
