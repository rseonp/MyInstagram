//
//  PhotosViewController.swift
//  Instagram2.0
//
//  Created by Victor Li Wang on 3/1/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
//

import UIKit
import Parse

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var media: [PFObject]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension //autolayout
        tableView.estimatedRowHeight = 120
        
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                self.media = media
                
//                print("media: \(mediaName as! String)")
                print("media fetched")
                self.tableView.reloadData()
                // do something with the data fetched
            } else {
                print("media failed to be fetched")
                print("Error: \(error?.localizedDescription)")
                // handle error
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                self.media = media
                
                //                print("media: \(mediaName as! String)")
                print("media fetched")
                self.tableView.reloadData()
                // do something with the data fetched
            } else {
                print("media failed to be fetched")
                print("Error: \(error?.localizedDescription)")
                // handle error
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if media != nil {
            return media.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MediaCell", forIndexPath: indexPath) as! MediaCell        
        cell.media = media[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
