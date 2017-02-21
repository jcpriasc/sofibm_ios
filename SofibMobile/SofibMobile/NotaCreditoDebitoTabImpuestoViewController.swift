//
//  NotaCreditoDebitoTabImpuestoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoTabImpuestoViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lblTotalServicio: UILabel!
    @IBOutlet var lblTotalSeguroHotelero: UILabel!
    @IBOutlet var lblTotalNotaCredito: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblValorTotalPagar: UILabel!
    
    static var detalleImpuestoSeleccionado = DetalleNotaCreditoDebitoImpuesto()
    
    static var jsonTabImpuestos: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito  as? Dictionary<String, Any>{
            
            NotaCreditoDebitoTabImpuestoViewController.jsonTabImpuestos = solicitud["facturas"] as? NSArray
            
            lblTotalServicio.text = NSLocalizedString("lbl_total_servicio", comment: "lbl_total_servicio")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalPagar"] as? String ?? ""))!
            lblTotalSeguroHotelero.text = NSLocalizedString("lbl_total_seguro_hotelero", comment: "lbl_total_seguro_hotelero")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalNotaCredito"] as? String ?? ""))!
            lblTotalNotaCredito.text =    NSLocalizedString("lbl_tab_nota_credito", comment: "lbl_tab_nota_credito")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalNotaCredito"] as? String ?? ""))!
            lblValorIva.text = NSLocalizedString("lbl_valor_iva", comment: "lbl_valor_iva")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorIva"] as? String ?? ""))!
            lblValorTotalPagar.text = NSLocalizedString("lbl_valor_total_pagar", comment: "lbl_valor_total_pagar")+": "+FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalPagar"] as? String ?? ""))!
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if NotaCreditoDebitoTabImpuestoViewController.jsonTabImpuestos==nil{
            return 0
        }else
        {return (NotaCreditoDebitoTabImpuestoViewController.jsonTabImpuestos!.count)}
        
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotaCreditoDebitoTabImpuestoViewCellController
        
        if let solicitud = NotaCreditoDebitoTabImpuestoViewController.jsonTabImpuestos?[indexPath.row] as? Dictionary<String, Any>{
          
            cell.txtProveedor.text = (solicitud["proveedor"] as? String ?? " ");
            cell.txtNumeroOrden.text = (solicitud["ordenServicio"] as? String ?? " ");
            cell.txtServicio.text = (solicitud["servicio"] as? String ?? " ");
            cell.txtValorServicio.text = FormatoDinero.formatearMoneda(texto:(solicitud["valorServicio"] as? String ?? " "));
            
        }
        
        return (cell)
        
        
    }

    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = NotaCreditoDebitoTabImpuestoViewController.jsonTabImpuestos?[opcionSeleccionada] as? Dictionary<String, Any>{
            
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.proveedor = (solicitud["proveedor"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.numeroOrdenServicio = (solicitud["ordenServicio"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.servicio = (solicitud["servicio"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.fechaInicio = (solicitud["fechaInicio"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.fechaFinalizacion = (solicitud["fechaFinalizaServicio"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.valorServicio = (solicitud["valorServicio"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.seguroHotelero = (solicitud["seguroHotelero"] as? String ?? "");
            NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.valorNota = (solicitud["valorNot"] as? String ?? "");
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleTabImpuesto")
            self.show(vc as! UIViewController, sender: vc)
            
            
            //result["artworkUrl60"] as? String ?? ""
        }
        
        return indexPath
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "notaImpuestoController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
    
}
