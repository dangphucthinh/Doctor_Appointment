//
//  Appointment.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class Appointment:Object, Mappable {

    var issue: String?
    var startTime: String?
    var detail: String?
    var meetingTime: String?
    var doctorName : String?
    var patientName: String?
    var doctorId : String?
    var patientId: String?
    var doctorPhone : String?

    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map) {
        issue           <- map["issue"]
        startTime       <- map["startTime"]
        detail          <- map["detail"]
        meetingTime     <- map["meetingTime"]
        doctorName      <- map["doctorName"]
        patientName     <- map["patientName"]
        doctorPhone     <- map["doctorPhone"]
    }
}

