//
//  ViewController.swift
//  bead
//
//  Created by Student on 2018. 03. 01..
//  Copyright © 2018. Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func myPanAction(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let myView = recognizer.view {
            myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }
    
    
    
    
    @IBAction func createNewFunction(_ sender: UIButton) {
        
       // let rect = CGRect(origin: CGPoint(x:100, y:100), size: CGSize(width:150, height:150))
       // var label = UILabel(frame: rect)
       // label.backgroundColor = UIColor.red
        //label.text = "label text"
        //self.view.addSubview(label)
        
        //let myImageView = UIImageView(image: UIImage(named: "ball.png"))
        
        let myFunction = FunctionClass()//UIView()
        myFunction.frame = CGRect(x: 100, y: 100, width: 150, height: 100)
        myFunction.backgroundColor = UIColor(red: 0, green: 150, blue: 150, alpha: 0.5)
        myFunction.isUserInteractionEnabled = true
        view.addSubview(myFunction)

        let myPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        myPanGestureRecognizer.minimumNumberOfTouches = 1
        myPanGestureRecognizer.maximumNumberOfTouches = 1
        myFunction.addGestureRecognizer(myPanGestureRecognizer)

        
        myFunction.name = UITextField(frame: CGRect(x: 50, y: 0, width: 50, height: 20))
        myFunction.name?.placeholder = "name"
        myFunction.name?.font = UIFont.systemFont(ofSize: 15)
        myFunction.name?.backgroundColor = UIColor.white
        
        myFunction.input = UITextField(frame: CGRect(x: 0, y: 40, width: 50, height: 20))
        myFunction.input?.placeholder = "input"
        myFunction.input?.font = UIFont.systemFont(ofSize: 11)
        myFunction.input?.backgroundColor = UIColor.white
        
        myFunction.output = UITextField(frame: CGRect(x: 100, y: 80, width: 50, height: 20))
        myFunction.output?.placeholder = "output"
        myFunction.output?.font = UIFont.systemFont(ofSize: 11)
        myFunction.output?.backgroundColor = UIColor.white
        
        myFunction.addSubview(myFunction.name!)
        myFunction.addSubview(myFunction.input!)
        myFunction.addSubview(myFunction.output!)
        
        }
    
    
    @IBAction func dragObject(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: sender.view)
            let changex = (sender.view?.center.x)! + translation.x
            let changey = (sender.view?.center.y)! + translation.y
            sender.view?.center = CGPoint(x: changex, y: changey)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        }
    }


}

