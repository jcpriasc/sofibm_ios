//
//  GiroTabConceptosViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabConceptosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblFechaInicio: UILabel!
    @IBOutlet var lblFechaFin: UILabel!
    @IBOutlet var lblSubtotal: UILabel!
    @IBOutlet var lblTotalConcepto: UILabel!
    static var jsonTabConcepto: NSArray?
    
    var subTotalGlobal: Double = 0
    var totalGlobal: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleGiroViewController.jsonDetalleGiro  as? Dictionary<String, Any>{
            
            GiroTabConceptosViewController.jsonTabConcepto = solicitud["concepto"] as? NSArray
            
            lblBeneficiario.text = "\(NSLocalizedString("lbl_beneficiario", comment: "lbl_beneficiario")) \(": ")\((solicitud["beneficiario"] as? String ?? ""))"
            lblFechaInicio.text = "\(NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")) \(": ")\((solicitud["fechaInicio"] as? String ?? ""))"
            lblFechaFin.text = "\(NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin"))\(": ") \((solicitud["fechaFin"] as? String ?? ""))"
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return (GiroTabConceptosViewController.jsonTabConcepto!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroTabConceptosViewCellController
        
        if let solicitud = GiroTabConceptosViewController.jsonTabConcepto?[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtConcepto.text = (solicitud["concepto"] as? String ?? " ");
            cell.txtDescripcion.text = (solicitud["descripcion"] as? String ?? " ");
            cell.txtCantidad.text = (solicitud["cantidad"] as? String ?? " ");
            cell.txtValor.text = FormatoDinero.formatearMoneda(texto: (solicitud["valor"] as? String ?? " "));
            cell.txtReliquidacion.text = (solicitud["reliquidacion"] as? String ?? " ");
           
            cell.txtSubtotal.text =  FormatoDinero.formatearMoneda(texto: (solicitud["subtotal"] as? String ?? " "));
            subTotalGlobal = subTotalGlobal + FormatoDinero.formatearMonedaStringADouble(texto: solicitud["subtotal"] as! String? ?? "")!
            
            cell.txtTrm.text =  FormatoDinero.formatearMoneda(texto: (solicitud["trm"] as? String ?? " "));
            cell.txtTotal.text =  FormatoDinero.formatearMoneda(texto: (solicitud["total"] as? String ?? " "));
            totalGlobal = totalGlobal + FormatoDinero.formatearMonedaStringADouble(texto: solicitud["total"] as! String? ?? "")!
            
        }
        
        
        lblSubtotal.text = NSLocalizedString("lbl_subtotal", comment: "lbl_subtotal") + ": " + FormatoDinero.formatearMonedaDouble(texto: subTotalGlobal)!
        lblTotalConcepto.text = NSLocalizedString("lbl_total_concepto", comment: "lbl_total_concepto") + ": " + FormatoDinero.formatearMonedaDouble(texto: totalGlobal)!
        
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
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "giroConceptosController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
