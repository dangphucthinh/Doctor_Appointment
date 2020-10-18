//
//  BaseUrl.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation

struct API{
    static let kBaseUrl = "http://116.110.86.5:2905/"
    static let kPatientUrl = "http://116.110.86.5:2904/api/Patient"
    static let kDoctorUrl = "http://116.110.86.5:2904/api/Doctor"
    static let kUserUrl = "http://116.110.86.5:2905/api/Auth"
    static let kSpecialitiesUrl = "http://116.110.86.5:2905/api/Speciality"

    //users
    //HttpPost
    static let kRegisterUrl = "api/Auth/Register"
    static let kLogin = "api/Auth/Login"
    static let kChangePassword = "api/Auth/ChangePassword"
    static let kResetPassword = "api/Auth/ResetPassword"
    
    //doctor
    static let kGetListAllDoctor = "GetListAllDoctor" //get all doctors GET
    static let kGetDoctorInfo = "GetDoctorInfo" //Post
    static let kDoctorRegister = "Register"
    
    
    //patient
    
    //specialties
    static let kGetAllHospitalSpecialities = "GetAllHospitalSpecialities"
    static let kGetAllSpecialities = "GetAllSpecialities"
    

}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
