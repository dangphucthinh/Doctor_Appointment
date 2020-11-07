//
//  BaseUrl.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation

struct API{
    static let kBaseUrl = "http://116.110.152.72:2905/"
  

        //users
        //HttpPost
        static let kRegisterUrl = "api/Auth/Register"
        static let kLogin = "api/Auth/Login"
        static let kChangePassword = "api/Auth/ChangePassword"
        static let kResetPassword = "api/Auth/ResetPassword"
        
        //doctor
        static let kGetListAllDoctor = "api/Doctor/GetListAllDoctor" //get all doctors GET
        static let kGetDoctorInfo = "api/Doctor/GetDoctorInfo" //Post
        static let kDoctorRegister = "Register"
        static let kDoctorBySpeciality = "GetDoctorInfoBySpecialty"
        
        
        //patient
        static let kPatientInfo = "api/Auth/GetPatientInfo"
        static let kPatientUpdate = "api/Auth/Update"
    
        static let kTest = "api/Image/CreateImage"
    
        
        
        //specialties
        static let kGetAllHospitalSpecialities = "GetAllHospitalSpecialities"
        static let kGetAllSpecialities = "GetAllSpecialities"

}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}