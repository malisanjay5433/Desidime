//
//  ViewController.swift
//  DesidimeApp
//
//  Created by Sanjay Mali on 05/11/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Haneke
class DealsList: UITableViewController {

    var deals = [DealsModel]()
    var top = [TopModel]()
    var popular = [PopularModel]()
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDealJSON()
        load_Top_Product("http://api.desidime.com/v2/deals/top.json")
        load_Popular_Product("http://api.desidime.com/v2/deals/popular.json")
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   func loadDealJSON()
    {
                Alamofire.request(.GET, "http://api.desidime.com/v2/deals.json", headers: ["X-Desidime-Client": "7d7c5cacb355d043f07c7c9e4b38257ea5683f8d643b578683877a9b6a8bee1b"])
                    .responseJSON { response in
                    
                        if let json = response.result.value {
                            let jsonObject = JSON(json)
                            let deals = jsonObject["deals"]
                            if let deals_Data = deals["data"].array {
                            for items in deals_Data {
                            print(items)
                            let json_deals = DealsModel(json:items)
                            self.deals.append(json_deals)
                         }
                    }
                }
                        
              self.tableView.reloadData()
        }
    }
    
    
    func load_Top_Product(url:String){
        Alamofire.request(.GET, url, headers: ["X-Desidime-Client": "7d7c5cacb355d043f07c7c9e4b38257ea5683f8d643b578683877a9b6a8bee1b"])
            .responseJSON { response in
                if let json = response.result.value {
                    let jsonObject = JSON(json)
                    let deals = jsonObject["deals"]
                    if let deals_Data = deals["data"].array {
                        for items in deals_Data {
                            print(items)
                            let json_deals = TopModel(json:items)
                            self.top.append(json_deals)
                        }
                    }
                }
        }
    }
    
    func load_Popular_Product(url:String){
        Alamofire.request(.GET, url, headers: ["X-Desidime-Client": "7d7c5cacb355d043f07c7c9e4b38257ea5683f8d643b578683877a9b6a8bee1b"])
            .responseJSON { response in
                if let json = response.result.value {
                    let jsonObject = JSON(json)
                    let deals = jsonObject["deals"]
                    if let deals_Data = deals["data"].array {
                        for items in deals_Data {
                            print(items)
                            let json_deals = PopularModel(json:items)
                            self.popular.append(json_deals)
                        }
                    }
                }
        }
    }
    
    

    
    
    
    
    @IBAction func top_popular_Product(sender: AnyObject) {
        switch(mySegmentedControl.selectedSegmentIndex)
        {
        case 0:
            
            if(top.count == 0)
            {
                load_Top_Product("http://api.desidime.com/v2/deals/top.json")
                
            } else {
                
                tableView.reloadData()
            }
            break
            
        case 1:
            if(popular.count == 0)
            {
              
                load_Popular_Product("http://api.desidime.com/v2/deals/popular.json")
                
            } else {
                tableView.reloadData()
            }
            break
            
        default:
                loadDealJSON()
                tableView.reloadData()
            break
            
        }
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    var returnValue = 0
    switch(mySegmentedControl.selectedSegmentIndex)
    {
    case 0:
        returnValue = top.count
        break
    case 1:
        returnValue = popular.count
        break
    default:
        break
    }
    return returnValue
    }
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DealsCell
      //  let dealsIndex = deals[indexPath.row]
        let topIndex = top[indexPath.row]
        let popularIndex = popular[indexPath.row]
    
    switch(mySegmentedControl.selectedSegmentIndex)
    {
    case 0:
        
        cell.back_view.layer.cornerRadius = 3.0
        cell.back_view.layer.masksToBounds = true
        cell.bottom_view.layer.cornerRadius = 3.0
        cell.bottom_view.layer.masksToBounds = true
        cell.title_Label?.text = topIndex.title
        let comment = topIndex.comments_count
        cell.number_Label.text  = "\(comment)"
        let score = topIndex.score
        cell.number_Label2.text = "\(score)"
        cell.company_Name.text = topIndex.merchant_name
        cell.discount_off.text = topIndex.off_percent
        let product_url = topIndex.image
        if product_url != nil {
            let url = NSURL(string: product_url)
            cell.product_Image.layer.borderWidth = 0.5
            cell.product_Image.layer.borderColor = UIColor.lightGrayColor().CGColor
            cell.product_Image.hnk_setImageFromURL(url!)
        }
            
        else{
            cell.product_Image.image = UIImage(named: "no-image")
        }

        break
    case 1:
       
        cell.back_view.layer.cornerRadius = 3.0
        cell.back_view.layer.masksToBounds = true
        cell.bottom_view.layer.cornerRadius = 3.0
        cell.bottom_view.layer.masksToBounds = true
        cell.title_Label?.text = popularIndex.title
        let comment = popularIndex.comments_count
        cell.number_Label.text  = "\(comment)"
        let score = topIndex.score
        cell.number_Label2.text = "\(score)"
        cell.company_Name.text = popularIndex.merchant_name
        cell.discount_off.text = popularIndex.off_percent
        let product_url = popularIndex.image
        if product_url != nil {
            let url = NSURL(string: product_url)
            cell.product_Image.layer.borderWidth = 0.5
            cell.product_Image.layer.borderColor = UIColor.lightGrayColor().CGColor
            cell.product_Image.hnk_setImageFromURL(url!)
        }
            
        else{
            cell.product_Image.image = UIImage(named: "no-image")
        }
    
    default:
    break
        
    }
    
        return cell
   }
}