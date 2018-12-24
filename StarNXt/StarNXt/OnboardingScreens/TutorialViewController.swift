//
//  TutorialViewController.swift
//  StarNXt
//
//  Created by Mac on 9/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var sliderPageControl : UIPageControl!
    
    var userRole : String = ""
    
    var slideImages = [String]()
    var titleArray = [String]()
    var subTitleArray = [String]()
    
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.getUserRole() == UserRole.Actor{
            slideImages = ["Actor_Help3","Actor_Help2","Actor_Help1"]
            titleArray = ["SUBMIT YOUR PROFILE","DIRECT APPLY","STAY UPTO DATE"]
            subTitleArray = ["Where actors, models and other performers make their careers","Top acting auditions posted everyday","Casting calls wherever you are"]
        }else{
            slideImages = ["Director_Help1","Director_Help2","Director_Help3"]
            titleArray = ["POST YOUR AUDITION","TALENT FINDER","EASY AND EFFICIENT"]
            subTitleArray = ["There are thousands of quality actor profiles.","Finding the best talent is easier than ever.","We've made the application process a breeze."]
        }
        
        self.navigationController?.navigationBar.isHidden = false
        self.updateUI()
        self.view.createGradientLayer()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    
        self.sliderPageControl.currentPage = selectedIndex
        self.view.layoutIfNeeded()
        self.changePage(sender: sliderPageControl)
    }
    
    func updateUI() -> Void {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        self.scrollView.createGradientLayer()

        setUpSlider(images: slideImages)
        sliderPageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
    }
    
    func setUpSlider(images: [String]) -> Void {
        self.sliderPageControl.numberOfPages = images.count
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width * CGFloat(images.count), height: self.view.height))
        containerView.createGradientLayer()
        var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
        for index in 0 ..< images.count {
            frame.origin.x = self.view.frame.size.width * CGFloat(index)
            frame.size = CGSize(width: self.view.width, height: self.view.height)
            let subView = UIView(frame: frame)
            let customView = UIView.loadFromNib(named: "LaunchView") as! LaunchView
            customView.profileimageView.image = UIImage(named: slideImages[index])
            customView.titleLbl.text = titleArray[index]
            customView.subTitleLbl.text = subTitleArray[index]
            
            customView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height)
            subView.addSubview(customView)
            customView.createGradientLayer()
            containerView.addSubview(subView)
        }
        
        self.scrollView.addSubview(containerView)
        self.scrollView.setNeedsDisplay()
        self.scrollView.contentSize = CGSize(width:self.view.size.width * CGFloat(images.count),height: self.scrollView.frame.size.height)
        if images.count < 2 {
            self.sliderPageControl.isHidden = true
        }
        self.scrollView.contentSize.height = 1.0
    }

    
    @IBAction func skipBtnAction() -> Void{
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.signupvc) as! SignupViewController
        signUpVC.userRole = userRole
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func nextBtnAction() -> Void{
        if sliderPageControl.currentPage < sliderPageControl.numberOfPages - 1{
            sliderPageControl.currentPage += 1
            changePage(sender: self)
        }
        else{
            self.skipBtnAction()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / self.view.size.width)
        sliderPageControl.currentPage = Int(pageNumber)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(sliderPageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
