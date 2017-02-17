//
//  ViewController.swift
//  MediumExamples
//
//  Created by Varun Rathi on 17/02/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

// Example showing difference between layoutIfNeeded() vs setNeedsLayout()



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield:UITextField!
    
    @IBOutlet weak var constraint:NSLayoutConstraint!
    @IBOutlet weak var constraint2:NSLayoutConstraint!
    
    
   fileprivate var dataSource = [String]()
   private var privateDatasource = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
    // Case 1: LayoutIfNeeded()
    
    @IBAction func animateCase1(sender:AnyObject)
    {
        view.layoutIfNeeded()       //  Force all pending updates, before doing any new ones
       
        if(constraint.constant == 200) // if original
        {
            constraint.constant = 100   // reduce
        }
        else
        {
            constraint.constant = 200   // revert
        }
       // self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1.0) { 
           self.view.layoutIfNeeded()
        }
    }
    
    // Case 2: setNeedsLayout()
    
    @IBAction func animateCase2(sender:AnyObject)
    {
        view.layoutIfNeeded()               //  This is recommended by apple to force all pending updates
                                            // At this will return immediately & do all updates in the current update cycle
        
        if(constraint2.constant == 200) // if original
        {
            constraint2.constant = 100
        }
        else
        {
            constraint2.constant = 200  // revert
        }
        
        UIView.animate(withDuration: 1.0) { 
            self.view.setNeedsLayout()
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        return cell
    }
    
}

