//
//  TaskDetailViewController.swift
//  todoList
//
//  Created by Victor Wu on 3/16/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

import UIKit
import MapKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var taskMapView: MKMapView!
    
    var selectedTask: WFTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.selectedTask.title
        self.detailTextView.text = self.selectedTask.taskDescription
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH: mm"
        
        self.dueDateLabel.text = dateFormatter.stringFromDate(self.selectedTask.dueDate)
        self.updateMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateMapView() {
        let viewRegion = MKCoordinateRegionMakeWithDistance(self.selectedTask.location.coordinate, 500, 500)
        let adjustedRegion = self.taskMapView.regionThatFits(viewRegion)
        self.taskMapView.setRegion(adjustedRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.selectedTask.location.coordinate
        annotation.title = "Task Location"
        
        self.taskMapView.addAnnotation(annotation)
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
