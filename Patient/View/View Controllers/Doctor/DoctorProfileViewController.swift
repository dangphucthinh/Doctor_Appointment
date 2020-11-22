import UIKit
import SDWebImage

class DoctorProfileViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var imgAva: UIImageView!

    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var bookingAppoinment: UIButton!
    
    var data : Doctor?
    var dataUser: UserDataModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        bioTextView.isEditable = false
     
        self.showNavigationBar(animated: animated)
        self.navigationTitle(title: "DOCTOR")
    }
    
    private func loadData(){
        bioTextView.text = data?.bio
        nameTextField.text = data?.fullName
        emailTextField.text = data?.specialtyName
        
        let ava: String? = data?.avatar
        let url = URL.init(string:"\(ava ?? "No image found")")
        imgAva.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
    }
    
    @IBAction func makeAppointment(_ sender: Any) {
        // create the alert
        let controller: MakeAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MakeAppointmentViewControllerId) as! MakeAppointmentViewController
        
        controller.doctorId = (data?.id)!
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func chatting(_ sender: Any) {
        // create the alert
        let controller: MessengerViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MessengerViewControllerId) as! MessengerViewController
        dataUser = UserDataModel(Uname: (data?.fullName)!, Uemail: (data?.email)!, Uavatar: (data?.avatar)!, UuserId: (data?.id)! )
        UserDataManager.setUserData(userData: dataUser!, userId: data?.id ?? "Not found ID")
        controller.recieverUser = dataUser!
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
