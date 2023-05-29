import UIKit

struct PrideParade {
    let organizer: String
    let location: String
    let date: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let prideParades: [PrideParade] = [
        PrideParade(organizer: "Pride Organization A", location: "City A, Country A", date: "June 1, 2023"),
        PrideParade(organizer: "Pride Organization B", location: "City B, Country B", date: "June 15, 2023"),
        PrideParade(organizer: "Pride Organization C", location: "City C, Country C", date: "July 1, 2023"),
        // Add more pride parades here
    ]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    // MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prideParades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let prideParade = prideParades[indexPath.row]
        cell.textLabel?.text = "\(prideParade.organizer)\n\(prideParade.location)\n\(prideParade.date)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
        let prideParade = prideParades[indexPath.row]
        let alert = UIAlertController(title: "Pride Parade Details", message: "\(prideParade.organizer)\n\(prideParade.location)\n\(prideParade.date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
