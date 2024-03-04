//
//  ViewController.swift
//  save2TextFile
//
//  Created by Jonah Whitney on 3/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func writeMyText(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file.")
        }
    }
    
    @IBAction func readMyText(_ sender: UIButton) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("Error reading file.")
        }
    }
    
    @IBOutlet weak var typeTextHere: UITextView!
    
    
    @IBOutlet weak var displayTextHere: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeTextHere.text = "Type your new text right here."
        displayTextHere.text = ""
    }


}

