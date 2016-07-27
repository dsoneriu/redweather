//
//  MainViewController.swift
//  Red Weather
//
//  Created by Razvan on 27/07/16.
//  Copyright © 2016 SRD. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
	
	func showAlertWithMessage(message:String) {
		
		let alertController = UIAlertController(title: "Alert",
		                                        message: message,
		                                        preferredStyle: UIAlertControllerStyle.Alert)
		alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
		self.presentViewController(alertController, animated: true, completion: nil)
	}

	
}