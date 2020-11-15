//
//  Appointment.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/4/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Appointment:Object, Mappable {

    var id: Int?
    var issue: String?
    var startTime: String?
    var detail: String?
    var meetingTime: String?
    var doctorName : String?
    var patientName: String?
    var doctorId : String?
    var patientId: String?
    var doctorPhone : String?
    var doctorAvatar: String?
    var patientAvatar: String?

    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map) {
        id              <- map["id"]
        issue           <- map["issue"]
        startTime       <- map["startTime"]
        detail          <- map["detail"]
        meetingTime     <- map["meetingTime"]
        doctorName      <- map["doctorName"]
        patientName     <- map["patientName"]
        doctorPhone     <- map["doctorPhone"]
        doctorAvatar    <- map["doctorAvatar"]
        patientAvatar   <- map["patientAvatar"]
    }
}