//
//  ViewController.swift
//  LocalNotification
//
//  Created by Mac on 05/03/17.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //notuficationCentre
        let notificationCentre = UNUserNotificationCenter.current()
        notificationCentre.requestAuthorization(options: [.alert,.sound]){ (granted,error) in
            
        }
        //notificationContent
        let content = UNMutableNotificationContent()
        content.title = "ios new batch"
        content.body = "ios new batch is starting in next week"
        
        let date = Date().addingTimeInterval(10)
        let dateComponent = Calendar.current.dateComponents([Calendar.Component.year,
                                            Calendar.Component.month,
                                            Calendar.Component.day,.hour  ,.minute,.second], from: date)
        
        //notificaationTrigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let uuidString = UUID().uuidString
        print(uuidString)
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        notificationCentre.add(request){
            (error) in
        }
    }
}

