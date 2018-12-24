//
//  Constants.swift
//  StarNXt
//
//  Created by Mac on 9/3/18.
//  Copyright © 2018 Pandiyaraj. All rights reserved.
//

import UIKit


enum UIUserInterfaceIdiom : Int
{
    case Unspecified
    case Phone
    case Pad
}



struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static var IS_SIMULATOR: Bool {
        return TARGET_OS_SIMULATOR != 0 // Use this line in Xcode 7 or newer
    }
}
struct keyWords {
    static let Authorization_Token = "AuthorizationToken"
    
}



struct NotificationConstants{
    static let DeviceToken: String = "DeviceToken"
    static let FCMToken: String = "FCMToken"
    
}

struct Constants {
    static let kDIRECTOR = "director"
    static let kACTOR = "actor"
}

enum SubscriptionPlan : Int {
    case Day
    case Month
    case Year
}

struct Defaults {
    static let UserInfo = "UserInfo"
    static let IsSignedIn = "IsSignedIn"
    static let userRole = "UserRole"
}

//KC gallery

struct KCGallery{
    static var imagesDirectoryPath = String()
    // Get the Document directory path
}


// HTTP METHODS
struct HttpMethod{
    static let GET : String = "GET"
    static let POST : String = "POST"
    static let DELETE : String = "DELETE"
    static let PUT : String = "PUT"
    static let PATCH:String = "PATCH"
}
struct Time {
    static let Min: Double = 60
    static let Hour: Double = 60 * Time.Min
    static let Day: Double = 24 * Time.Hour
}


/// Common values
struct CommonValues {
    
    static let jsonApplication: String = "application/json"
    static let urlencoded: String = "application/x-www-form-urlencoded"
    static let regionCode:String = ((Locale.current as NSLocale).object(forKey: .countryCode) as? String)!
    static var phoneCode:String = ""
    
    static let ISAPIEnabled : Bool = true
    static let serverTimeFormat = "yyyy-MM-dd hh:mm:ss"
    static let dobDateFormat = "yyyy-MM-dd"
    static let placeHolderImage : UIImage = UIImage.init(named: "LaunchImage")!
    
    static let displayDateformat = "dd-MMM-yyyy"
    static let displayDateTimeformat = "dd-MMM-yyyy hh:mm a"
    
    static let resendOTPEnableTimer : Int = 90
    
    static let imageMaxWidth = 250
}

struct Themecolor {
    static let grey = UIColor.init(hex: 0x929292)
    static let orange = UIColor.init(hex: 0xff9b00)
    
    static let placeholdercolor = UIColor.init(hex: 0x757575)
    static let placeholderSelectedColor = UIColor.black
}

struct UserDefaultConstants
{
    static let IsAlreadyLogin = "IsAlreadyLogin"
    static let apiKey = "apikey"
    static let UserInfo = "UserInfo"
    
}


struct StoryBoard {
    static let eventStoryboard = UIStoryboard(name: "Events", bundle: nil)
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
}

struct StoryboardIdentifier {
    static let signupvc = "signupvc"
    static let tutorialvc = "tutorialvc"
    
    static let getstartedvc = "getstartedvc"
    static let subscriptionvc = "subscriptionvc"
    
    static let auditionvc = "auditionvc"
    static let auditiondetailvc = "auditiondetailvc"
    static let premiumauditiondetailvc = "premiumauditiondetailvc"
    
    static let resourcevc = "resourcevc"
    static let resourceresultvc = "resourceresultvc"
    
    static let createprofilevc = "createprofilevc"
    static let createDirectorProfilevc = "createdirectorprofilevc"
    static let accountmenuvc = "accountmenuvc"
    static let helpmenuvc = "helpmenuvc"
    static let planhistoryvc = "planhistoryvc"
    
    static let changeNumberVc = "changenumbervc"
    static let deleteAccountVc = "deleteaccountvc"
    static let helpVc = "helpmenuvc"
    
    
    static let experiencevc = "experiencevc"
    
    static let actordashboardVc = "actordashboardvc"
    static let mainTabVc = "mainvc"
    static let portfolioVc = "portfoliovc"
    
    
    static let directordashboardvc = "directordashboardvc"
    static let personalisedAuditionvc = "personalisedaudtionvc"
    static let openAuditionVc = "openauditionvc"
    static let directorAuditionListVc = "directorauditionlistvc"
    static let directorAuditionGroupVc = "auditiongroupdetailvc"
    static let directorApplicationVc = "directorapplicationvc"
    static let directorShortListVc = "directorshortlistvc"
    static let directorSubscriptionVc = "directorSubscriptionvc"
    static let directorSubscriptTypeVc = "DirectorSubscribeType"
    
    static let directorApplicationGrooupvc = "directorapplicationgroupvc"
    static let directorApplicationDetailVc = "applicationdetailvc"
    
    static let directorPlanSelectionVc = "directorplanselectionvc"
    static let directorPlanTypeVc = "directorplantype"
    static let viewplanvc = "viewplanvc"
    
    static let actorPlanSelectionVc = "actorplanselectionvc"
    static let actorPlanView = "actorviewplanvc"
    static let resourcelistvc = "resourcelistvc"
    
    static let detailVc = "detailVc"
}

struct Audition_Status
{
    static let Applied = "applied"
    static let Closed = "closed"
    static let Active = "active"
}

struct AuditionType {
    static let Personalised = "personalised"
    static let Open = "open"
}

struct UserRole {
    static let Director = "director"
    static let Actor = "actor"
}

struct CellIdentifier {
   static let audtionTableviewcell = "AuditionTableViewCell"
   static let audtionDetailTableviewcell = "AuditionDetailTableViewCell"
    static let resourceTableViewCell =  "ResourceResultTableViewCell"
    static let helpmenuTableViewCell = "HelpMenuTableViewCell"
    static let planHistoryCell = "PlanHistoryTableViewCell"
    static let portfolioCell = "PortfolioCollectionViewCell"
    static let profilecollectioncell = "ProfileSelectionViewCell"
    static let persolnalizedAudtioncollectioncell = "PersonlisedAudtionCollectionViewCell"

    
    static let measurementcell = "MeasurementTableViewCell"
    static let measurementHeightcell = "MeasurementHeightTableViewCell"
    static let experiencecell = "ExperienceTableViewCell"
    
    static let directorAuditionListcell = "DirectorAuditionListTableViewCell"
    static let directorApplicationListcell = "ApplicationTableViewCell"
    static let directorGroupApplicationCell = "ApplicationGroupCell"
    
     static let directionApplicationDetailTableCell = "ApplcationDetailTableViewCell"
    
    static let resourceListCell = "ResourceListTableViewCell"
    
}



struct URLConstants{
    
    static let BASEURL = "http://bossyincome.indofrenchtechdev.com/v1/"   //-- Dev
    
    static let userExists = ""
    static let sendOTP:String = "register"
    static let verifyOTP:String = "user/login"
   
    
    
}
struct ErrorMessage {
    static let commonMessage = "Something went wrong, Please try again"
    static let noInternetMessage = "Your device is not connected to the internet.Please enable mobile data / wifi in settings"
}

struct NotificationName {
    static let ThirdPartyLogin = "thirdPartyLogin"
}

//struct DealStatus {
//    static let dealOpen = 0
//    static let dealBookingOpen = 3
//    static let dealSalesOn = 4
//    static let dealSalesClose = 5
//    static let dealEnded = 6
//}

struct AppFont {
    
    // if regularOrBold  == false Bold font
    static func pixelToPoint(_ pixels : CGFloat) -> CGFloat{
        let pointsPerInch : CGFloat = 72.0
        let scale : CGFloat = 1.0
        var pixelPerInch : CGFloat = 0.0
        if DeviceType.IS_IPAD {
            pixelPerInch = 132 * scale
        }else if DeviceType.IS_IPHONE{
            pixelPerInch = 163 * scale
        }
        let fontSize = pixels * pointsPerInch / pixelPerInch
        return fontSize
    }
    
    struct FontName {
        static let bold = "Montserrat-Bold"
        static let regular = "Montserrat-Regular"
        static let medium = "Montserrat-Medium"
        static let light = "Montserrat-Light"
        
        static let robotobold = "Roboto-Bold"
        static let robotoregular = "Roboto-Regular"
        static let robotomedium = "Roboto-Medium"
        static let robotolight = "Roboto-Light"
        
    }
    
    static func getBold(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.bold, size: size)!
    }
    
    static func getMedium(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.medium, size: size)!
    }
    static func getRegular(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.regular, size: size)!
    }
    
    static func getLight(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.light, size: size)!
    }
    
    static func getRobotoBold(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.robotobold, size: size)!
    }
    
    static func getRobotoMedium(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.robotomedium, size: size)!
    }
    static func getRobotoRegular(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.robotoregular, size: size)!
    }
    
    static func getRobotoLight(size:CGFloat) -> UIFont {
        return UIFont.init(name: FontName.robotolight, size: size)!
    }
}
