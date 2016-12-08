**TL;DR**

#Short brief 
Currently, I have a complex project that have 5 storyboards, with 20 controllers. In my case, using storyboard segue seems not a good idea. Therefore, creating controller's instance from storyboard and make a transition by code is much better. 

But the problem is that `instantiateViewController(withIdentifier:)` always return `non-optional` instance, and it will be crashed if we put an invalid `identifier` (which didn't define in storyboard).

#Solution (Swift 3.0)
There are steps to prevent this problem.

   1. In *.storyboard, use controller class name as `StoryboardID`
   2. Create `UIStoryboard+Ext.swift` to define all storyboards &    controllers belong
   3. Create `BaseViewController.swift` to define the initialization from storyboard
   4. Create function to init all storyboards & controllers, to prevent crashing in runtime.

#Detail
*Step 1:*

[![enter image description here][1]][1]

*Step 2:*

    extension UIStoryboard {
        
        enum Identifier: String {
            case main = "Main"
            case explore = "Explore"
            case search = "Search"
            case profile = "Profile"
        }
        
        static func name(for controller: UIViewController.Type) -> String? {
            var identifier: Identifier?
            switch controller.className {
            case HomeViewController.className:
                identifier = .main
            case ExploreViewController.className:
                identifier = .explore
            case SearchViewController.className:
                identifier = .search
            case ProfileViewController.className:
                identifier = .profile
            default:
                break
            }
            return identifier?.rawValue
        }
    }
    
    extension UIStoryboard {
    
        static func instanceFromIdentifier(_ identifier: Identifier) -> UIStoryboard {
            return UIStoryboard(name: identifier.rawValue, bundle: Bundle.main)
        }
        
        static func instanceFromName(_ name: String) -> UIStoryboard? {
            guard let identifier = Identifier(rawValue: name) else { return nil }
            return instanceFromIdentifier(identifier)
        }
        
    }

*Step 3:*

    extension UIViewController {
        
        var className: String {
            return String(describing: type(of: self))
        }
        
        class var className: String {
            return String(describing: self)
        }
        
    }
    
    class BaseViewController: UIViewController {
        
        static var controllerId: String {
            return String(describing: self) // return slass name, i.e "ExploreViewController"
        }
        
        static func instanceFromStoryboard() -> Self? {
            guard let storyboardName = UIStoryboard.name(for: self) else { return nil }
            return instantiateFrom(storyboardName: storyboardName)
        }
        
        private static func instantiateFrom<VC: UIViewController>(storyboardName: String) -> VC? {
            let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: controllerId) as? VC
            return controller
        }
    }

*Step 4*

    extension AppDelegate {
        func validateStoryboards() {
            guard
                let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.main.rawValue),
                let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.explore.rawValue),
                let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.profile.rawValue),
                let _ = UIStoryboard.instanceFromName(UIStoryboard.Identifier.search.rawValue)
                else {
                    fatalError("fail to init storyboard by name")
            }
            
            guard let _ = HomeViewController.instanceFromStoryboard(),
                let _ = ExploreViewController.instanceFromStoryboard(),
                let _ = ProfileViewController.instanceFromStoryboard(),
                let _ = SearchViewController.instanceFromStoryboard()
                else {
                    fatalError("fail to init controller from storyboard")
            }
        }
    }


  [1]: https://i.stack.imgur.com/JsBIk.png
