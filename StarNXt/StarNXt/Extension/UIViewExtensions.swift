//
//  UIViewExtensions.swift
//  Sconce
//
//  Created by Pandiyaraj on 30/05/18.
//  Copyright © 2017 Pandiyaraj. All rights reserved.
//

import UIKit

public enum ShakeDirection {
	case horizontal
	case vertical
}

public enum AngleUnit {
	case degrees
	case radians
}

public enum ShakeAnimationType {
	case linear
	case easeIn
	case easeOut
	case easeInOut
}

public extension UIView {
	/// Add shadow to view
	public func addShadow(ofColor color: UIColor = UIColor(hex: 0x137992),
	                      radius: CGFloat = 3,
	                      offset: CGSize = CGSize(width: 0, height: 0),
	                      opacity: Float = 0.5) {
		layer.shadowColor = color.cgColor
		layer.shadowOffset = offset
		layer.shadowRadius = radius
		layer.shadowOpacity = opacity
		layer.masksToBounds = true
	}
	
	/// Add array of subviews to view.
	public func add(subViews: [UIView]) {
		subViews.forEach({self.addSubview($0)})
	}
	
	/// Border color of view; also inspectable from Storyboard.
	@IBInspectable
	public var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else {
				return nil
			}
			return UIColor(cgColor: color)
		}
		set {
			guard let color = newValue else {
				layer.borderColor = nil
				return
			}
			layer.borderColor = color.cgColor
		}
	}
	
	/// Border width of view; also inspectable from Storyboard.
	@IBInspectable
	public var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	/// Corner radius of view; also inspectable from Storyboard.
	@IBInspectable
	public var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.masksToBounds = true
			layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
		}
	}
	
	/// Fade in view.
	public func fadeIn(duration: TimeInterval = 1, completion:((Bool) -> Void)? = nil) {
		if self.isHidden {
			self.isHidden = false
		}
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 0
			}, completion: completion)
	}
	
	/// Fade out view.
	public func fadeOut(duration: TimeInterval = 1, completion:((Bool) -> Void)? = nil) {
		if self.isHidden {
			self.isHidden = false
		}
		UIView.animate(withDuration: duration, animations: {
			self.alpha = 1
			}, completion: completion)
	}
	
	/// First responder.
	public var firstResponder: UIView? {
		guard !self.isFirstResponder else {
			return self
		}
		for subView in subviews {
			if subView.isFirstResponder {
				return subView
			}
		}
		return nil
	}
	
	// Height of view
	public var height: CGFloat {
		get {
			return self.frame.size.height
		}
		set {
			self.frame.size.height = newValue
		}
	}
	
	/// Return true if view is in RTL format.
	public var isRightToLeft: Bool {
		if #available(iOS 10.0, *) {
			return effectiveUserInterfaceLayoutDirection == .rightToLeft
		} else {
			return false
		}
	}
	
	/// Return true if view is visible in screen currently and not hidden.
	public var isVisible: Bool {
		// https://github.com/hilen/TimedSilver/blob/master/Sources/UIKit/UIView%2BTSExtension.swift
		if self.window == nil || self.isHidden || self.alpha == 0 {
			return true
		}
		let viewRect = self.convert(self.bounds, to: nil)
		guard let window = UIApplication.shared.keyWindow else {
			return true
		}
		return viewRect.intersects(window.bounds) == false
	}
	
	/// Load view from nib
	class func loadFromNib(named: String, bundle : Bundle? = nil) -> UIView? {
		return UINib(nibName: named, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
	}
	
	/// Remove all subviews in view.
	public func removeSubViews() {
		self.subviews.forEach({$0.removeFromSuperview()})
	}
	
	/// Remove all gesture recognizers from view.
	public func removeGestureRecognizers() {
		gestureRecognizers?.forEach(removeGestureRecognizer)
	}
	
	/// Rotate view by angle on relative axis.
	public func rotate(byAngle angle : CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1, completion:((Bool) -> Void)? = nil) {
		let angleWithType = (type == .degrees) ? CGFloat(M_PI) * angle / 180.0 : angle
		if animated {
			UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
				self.transform = self.transform.rotated(by: angleWithType)
				}, completion: completion)
		} else {
			self.transform = self.transform.rotated(by: angleWithType)
			completion?(true)
		}
	}
	
	/// Rotate view to angle on fixed axis.
	public func rotate(toAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1, completion:((Bool) -> Void)? = nil) {
		let angleWithType = (type == .degrees) ? CGFloat(M_PI) * angle / 180.0 : angle
		if animated {
			UIView.animate(withDuration: duration, animations: {
				self.transform = CGAffineTransform(rotationAngle: angleWithType)
				}, completion: completion)
		} else {
			transform = CGAffineTransform(rotationAngle: angleWithType)
			completion?(true)
		}
	}
	
	/// Scale view by offset.
	public func scale(by offset: CGPoint, animated: Bool = false, duration: TimeInterval = 1, completion:((Bool) -> Void)? = nil) {
		if animated {
			UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
				self.transform = self.transform.scaledBy(x: offset.x, y: offset.y)
				}, completion: completion)
		} else {
			self.transform = self.transform.scaledBy(x: offset.x, y: offset.y)
			completion?(true)
		}
	}
	
	/// Take screenshot of view.
	public var screenShot: UIImage? {
		UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0.0);
		defer {
			UIGraphicsEndImageContext()
		}
		guard let context = UIGraphicsGetCurrentContext() else {
			return nil
		}
		layer.render(in: context)
		return UIGraphicsGetImageFromCurrentImageContext()
	}
	
	/// Shadow color of view; also inspectable from Storyboard.
	@IBInspectable
	public var shadowColor: UIColor? {
		get {
			guard let color = layer.shadowColor else {
				return nil
			}
			return UIColor(cgColor: color)
		}
		set {
			layer.shadowColor = newValue?.cgColor
		}
	}
	
	/// Shadow offset of view; also inspectable from Storyboard.
	@IBInspectable
	public var shadowOffset: CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.shadowOffset = newValue
		}
	}
	
	/// Shadow opacity of view; also inspectable from Storyboard.
	@IBInspectable
	public var shadowOpacity: Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.shadowOpacity = newValue
		}
	}
	
	/// Shadow radius of view; also inspectable from Storyboard.
	@IBInspectable
	public var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowRadius = newValue
		}
	}
	
	/// Shake view.
	public func shake(direction: ShakeDirection = .horizontal, duration: TimeInterval = 1, animationType: ShakeAnimationType = .easeOut, completion:(() -> Void)? = nil) {
		
		CATransaction.begin()
		let animation: CAKeyframeAnimation
		switch direction {
		case .horizontal:
			animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		case .vertical:
			animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		}
		switch animationType {
		case .linear:
			animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		case .easeIn:
			animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
		case .easeOut:
			animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		case .easeInOut:
			animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		}
		CATransaction.setCompletionBlock(completion)
		animation.duration = duration
		animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
		layer.add(animation, forKey: "shake")
		CATransaction.commit()
	}
	
	// Size of view
	public var size: CGSize {
		get {
			return self.frame.size
		}
		set {
			self.width = newValue.width
			self.height = newValue.height
		}
	}
	
	// Width of view
	public var width: CGFloat {
		get {
			return self.frame.size.width
		}
		set {
			self.frame.size.width = newValue
		}
	}
    
    func rotate(toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    
    func addBorder(edges: UIRectEdge, colour: UIColor = UIColor.white, thickness: CGFloat = 1) -> Void {
        
        var borders = [UIView]()
        
        func border() -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = colour
            border.translatesAutoresizingMaskIntoConstraints = false
            return border
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            let top = border()
            addSubview(top)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[top(==thickness)]",
                                                               options: [],
                                                               metrics: ["thickness": thickness],
                                                               views: ["top": top]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[top]-(0)-|",
                                                               options: [],
                                                               metrics: nil,
                                                               views: ["top": top]))
            borders.append(top)
        }
        
        if edges.contains(.left) || edges.contains(.all) {
            let left = border()
            addSubview(left)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[left(==thickness)]",
                                                               options: [],
                                                               metrics: ["thickness": thickness],
                                                               views: ["left": left]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[left]-(0)-|",
                                                               options: [],
                                                               metrics: nil,
                                                               views: ["left": left]))
            borders.append(left)
        }
        
        if edges.contains(.right) || edges.contains(.all) {
            let right = border()
            addSubview(right)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:[right(==thickness)]-(0)-|",
                                                               options: [],
                                                               metrics: ["thickness": thickness],
                                                               views: ["right": right]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[right]-(0)-|",
                                                               options: [],
                                                               metrics: nil,
                                                               views: ["right": right]))
            borders.append(right)
        }
        
        if edges.contains(.bottom) || edges.contains(.all) {
            let bottom = border()
            addSubview(bottom)
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "V:[bottom(==thickness)]-(0)-|",
                                                               options: [],
                                                               metrics: ["thickness": thickness],
                                                               views: ["bottom": bottom]))
            addConstraints(
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[bottom]-(0)-|",
                                                               options: [],
                                                               metrics: nil,
                                                               views: ["bottom": bottom]))
            borders.append(bottom)
        }
        
    }
    
    
    public func addTopLayer(color : UIColor) -> Void{
        let upperBorder = CALayer()
        upperBorder.backgroundColor = color.cgColor
        upperBorder.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1.0)
        self.layer.addSublayer(upperBorder)
    }
    
    public func addBottomLayer(color : UIColor) -> Void{
        let upperBorder = CALayer()
        upperBorder.backgroundColor = color.cgColor
        upperBorder.frame = CGRect(x: 0, y: self.frame.origin.y+self.frame.size.height-5, width: self.frame.size.width, height: 1.0)
        self.layer.addSublayer(upperBorder)
    }
    
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    public func createGradientLayer() -> Void{
        let  gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds        
        
        gradientLayer.colors = [UIColor.init(red: 1.0, green: 0.07, blue:0.40, alpha: 1.0).cgColor,UIColor.init(red: 1.0, green: 0.36, blue:0.22, alpha: 1.0).cgColor]
        
        self.layer.insertSublayer(gradientLayer, at: 0)
//        self.layer.addSublayer(gradientLayer)
    }
    
    
    public func createGradientLayerColor(color1 : UIColor , color2 :UIColor) -> Void{
        let  gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [color1.cgColor,color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
}
public extension UIViewController{
func showAlert(title: String, contentText: String, actions: [UIAlertAction]?) {
    DispatchQueue.main.async {
        let alertController = UIAlertController(title: title, message: contentText, preferredStyle: .alert)
        
        if actions != nil{
            if let acctions = actions {
                for action in acctions {
                    alertController.addAction(action)
                }
            }
        }else{
            let okAlert : UIAlertAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAlert)
        }
        
        
        
        self.present(alertController, animated: true, completion: nil)
    }
}
}

