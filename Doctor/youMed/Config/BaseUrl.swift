//
//  BaseUrl.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation

struct API{
    
        static let kBaseUrl = "http://116.110.85.217:2905/"

        static let kImageUrl = "http://res.cloudinary.com/deh0sqxwl/image/upload/"

        //users
        //HttpPost
        static let kRegisterUrl = "api/Auth/Register"
        static let kLogin = "api/Auth/Login"
        static let kChangePassword = "api/Auth/ChangePassword"
        static let kResetPassword = "api/Auth/ResetPassword"
        static let kUserUpdate = "http://116.110.85.217:2905/api/Auth/Update"
        
        //doctor
        static let kGetListAllDoctor = "api/Doctor/GetListAllDoctor" //get all doctors GET
        static let kGetDoctorInfo = "api/Doctor/GetDoctorInfo" //Post
        static let kDoctorRegister = "api/Doctor/Register"
        static let kDoctorBySpeciality = "/api/Doctor/GetDoctorInfoBySpecialty"
        
        
        //patient
        static let kPatientInfo = "api/Auth/GetPatientInfo"
 
        //specialties
        static let kGetAllHospitalSpecialities = "GetAllHospitalSpecialities"
        static let kGetAllSpecialities = "GetAllSpecialities"
    
        //make appointment
        static let kUpdateAppointment = "api/Appointment/Update"
        static let kGetListAppoinment = "api/Appointment/GetAppoinmentByUser"

}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
