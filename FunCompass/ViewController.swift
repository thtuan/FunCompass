//
//  ViewController.swift
//  FunCompass
//
//  Created by thanh tuan on 10/17/18.
//  Copyright © 2018 HeFun. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController {
    weak var containerViewController: MapViewController!
    
    @IBOutlet weak var latInput: UITextField!
    @IBOutlet weak var lngInPut: UITextField!
    
    @IBAction func goToPlace(_ sender: UIButton) {
        let lat = Double(latInput.text!)
        let lng = Double(lngInPut.text!)
        containerViewController.goToPlace(lat: lat!, lng: lng!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? MapViewController, segue.identifier == "MapViewController" {
            containerViewController = controller;
            containerViewController.latlngUpdated = {lat, lng in
                self.latInput.text = String(format:"%f", lat)
                self.lngInPut.text = String(format:"%f", lng)
            }
        }
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
