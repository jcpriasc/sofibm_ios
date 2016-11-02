//
//  FiltrosSolicitudAtencionController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 1/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FiltrosSolicitudAtencionController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var pickeConvenio: UITextField!
    @IBOutlet var pickerEstado: UITextField!
    @IBOutlet var pickerCiudadInicial: UITextField!
    @IBOutlet var pickerCiudadFinal: UITextField!
    @IBOutlet var pickerTraslados: UITextField!
    
    var convenios = ["SVB-AG", "INSURANCE XYZ", "FATUM HEALTH", "EJEMPLO1", "FATUM SBV"]
    var estados = ["PENDIENTE", "ACEPTADA", "RECHAZADA", "FINALIZADO", "EN ESPERA"]
    var ciudadesIncial = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]
    var ciudadesActual = ["CALI", "BOGOTA", "CARTAGENA", "MEDELLIN", "PEREIRA"]
    var traslados = ["SI", "NO"]
    
    
    @IBOutlet var txtIdentificacion: UITextField!
    @IBOutlet var txtSolicitudAtencion: UITextField!
    @IBOutlet var txtNombre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtIdentificacion.delegate = self
        self.txtSolicitudAtencion.delegate = self
        self.txtNombre.delegate = self
        
        //Se crea el picker para convenios
        let convenioPickerView = UIPickerView()
        convenioPickerView.delegate = self
        convenioPickerView.tag = 1
        pickeConvenio.inputView = convenioPickerView
        //Se crea el picker para estado
        let eestadoPickerView = UIPickerView()
        eestadoPickerView.delegate = self
        eestadoPickerView.tag = 2
        pickerEstado.inputView = eestadoPickerView
        //Se crea el picker para ciudades iniciales
        let ciudadInicialPickerView = UIPickerView()
        ciudadInicialPickerView.delegate = self
        ciudadInicialPickerView.tag = 3
        pickerCiudadInicial.inputView = ciudadInicialPickerView
        //Se crea el picker para ciudades finales
        let ciudadFinalPickerView = UIPickerView()
        ciudadFinalPickerView.delegate = self
        ciudadFinalPickerView.tag = 4
        pickerCiudadFinal.inputView = ciudadFinalPickerView
        //Se crea el picker para traslados
        let trasladoPickerView = UIPickerView()
        trasladoPickerView.delegate = self
        trasladoPickerView.tag = 5
        pickerTraslados.inputView = trasladoPickerView
        
        
        //Se crea el toolBar para el picker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.blue
        
        
        let defaultButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FiltrosSolicitudAtencionController.tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(FiltrosSolicitudAtencionController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        // label.text = ""
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickeConvenio.inputAccessoryView = toolBar
        pickerEstado.inputAccessoryView = toolBar
        pickerCiudadInicial.inputAccessoryView = toolBar
        pickerCiudadFinal.inputAccessoryView = toolBar
        pickerTraslados.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePressed(_ sender: UIBarButtonItem) {
        
        pickeConvenio.resignFirstResponder()
        pickerEstado.resignFirstResponder()
        pickerCiudadInicial.resignFirstResponder()
        pickerCiudadFinal.resignFirstResponder()
        pickerTraslados.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        pickeConvenio.text = ""
        pickerEstado.text = ""
        pickerCiudadInicial.text = ""
        pickerCiudadFinal.text = ""
        pickerTraslados.text = ""
        
        pickerEstado.resignFirstResponder()
        pickeConvenio.resignFirstResponder()
        pickerCiudadInicial.resignFirstResponder()
        pickerCiudadFinal.resignFirstResponder()
        pickerTraslados.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return convenios.count
        }
        
        if pickerView.tag == 2 {
            return estados.count
        }
        
        if pickerView.tag == 3 {
            return ciudadesIncial.count
        }
        
        if pickerView.tag == 4 {
            return ciudadesActual.count
        }
        
        if pickerView.tag ==  5{
            return traslados.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return convenios[row]
        }
        
        if pickerView.tag == 2 {
            return estados[row]
        }
        
        if pickerView.tag == 3 {
            return ciudadesIncial[row]
        }
        
        if pickerView.tag == 4 {
            return ciudadesActual[row]
        }
        
        if pickerView.tag == 5 {
            return traslados[row]
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            pickeConvenio.text = convenios[row]
        }
        
        if pickerView.tag == 2 {
            pickerEstado.text = estados[row]
        }
        
        if pickerView.tag == 3 {
            pickerCiudadInicial.text = ciudadesIncial[row]
        }
        
        if pickerView.tag == 4 {
            pickerCiudadFinal.text = ciudadesActual[row]
        }
        
        if pickerView.tag == 5 {
            pickerTraslados.text = traslados[row]
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
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