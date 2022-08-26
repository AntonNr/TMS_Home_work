import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var ActInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
            webView.addSubview(ActInd)
            ActInd.startAnimating()
        }
    
        webView.navigationDelegate = self
        ActInd.hidesWhenStopped = true
        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        if let url = URL(string: "https://\(searchBar.text!)") {
            let request = URLRequest(url: url)
            
            webView.load(request)

        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        if webView.canGoBack {
            
            webView.goBack()
            
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        
        if webView.canGoForward {
            
            webView.goForward()
            
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        webView.stopLoading()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        ActInd.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        ActInd.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        ActInd.stopAnimating()
        
    }
    
}

