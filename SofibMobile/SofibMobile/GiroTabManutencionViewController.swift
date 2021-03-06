//
//  GiroTabManutencionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabManutencionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblMontoDiario: UILabel!
    
    static var jsonTabManutencion: NSArray?
    
     var montoAcompanante: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleGiroViewController.jsonDetalleGiro  as? Dictionary<String, Any>{
            
            GiroTabManutencionViewController.jsonTabManutencion = solicitud["manutencion"] as? NSArray
            
            lblBeneficiario.text = "\(NSLocalizedString("lbl_acompañante", comment: "lbl_acompañante"))"
            
           montoAcompanante = solicitud["acompañanteMonto"] as? Double ?? 0
            
            lblMontoDiario.text =  NSLocalizedString("lbl_monto_diario", comment: "lbl_monto_diario") + ": " + FormatoDinero.formatearMonedaDouble(texto: montoAcompanante)!
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return (GiroTabManutencionViewController.jsonTabManutencion!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroTabManutencionViewCellController
        
        if let solicitud = GiroTabManutencionViewController.jsonTabManutencion?[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtEstado.text = (solicitud["estado"] as? String ?? " ");
            cell.txtEdadDesde.text = (solicitud["edadDesde"] as? String ?? " ");
            cell.txtEdadHasta.text = (solicitud["edadHasta"] as? String ?? " ");
            cell.txtMontoDiario.text = FormatoDinero.formatearMoneda(texto: (solicitud["montoDiario"] as? String ?? " "));
            
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "giroManutencionController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
