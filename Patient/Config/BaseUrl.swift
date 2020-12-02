//
//  BaseUrl.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation

struct API{
    static let kBaseUrl = "http://116.110.85.217:2905/"
    static let kUpdate = "http://116.110.85.217:2905/api/Auth/Update"

        //users
        //HttpPost
        static let kRegisterUrl = "api/Auth/Register"
        static let kLogin = "api/Auth/Login"
        static let kChangePassword = "api/Auth/ChangePassword"
        static let kForgotPassword = "api/Auth/ForgotPassword"
        
        //doctor
        static let kGetListAllDoctor = "api/Doctor/GetListAllDoctor" //get all doctors GET
        static let kGetDoctorInfo = "api/Doctor/GetDoctorInfo" //Post
        static let kDoctorRegister = "Register"
        static let kDoctorBySpeciality = "GetDoctorInfoBySpecialty"
        
        
        //patient
        static let kPatientInfo = "api/Auth/GetPatientInfo"
        static let kPatientUpdate = "api/Auth/Update"
    

        //AI
        static let kPrediction = "api/AI/Prediction"
        static let kChatbot = "api/AI/Chatbot"
        
        
        //specialties
        static let kGetAllHospitalSpecialities = "GetAllHospitalSpecialities"
        static let kGetAllSpecialities = "GetAllSpecialities"
    
    
        //make appointment
        static let kMakeAnAppointment = "api/Appointment/MakeAnAppointment"
        static let kUpdateAppointment = "api/Appointment/Update"
        static let kGetListAppoinment = "api/Appointment/GetAppoinmentByUser"
    
        //hospital
        static let kGetListHospital = "api/Hospital/ListHospitalCenter"
    
        //search
        static let kSearchDoctor = "api/Search/Doctor"

}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
