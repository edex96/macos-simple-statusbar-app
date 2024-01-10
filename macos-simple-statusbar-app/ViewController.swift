//
//  ViewController.swift
//  macos-simple-statusbar-app
//
//  Created by north on 11.01.2024.
//

import Cocoa


class ViewController: NSViewController {
    lazy var factTextView: NSTextView = {
        let textView = NSTextView(frame: .zero)
        textView.alignment = .center
        textView.drawsBackground = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewWillAppear() {
        super.viewWillAppear()
        Task{
            await loadFact()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(factTextView)
        factTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        factTextView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        factTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        factTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 200))
    }
    
    private func loadFact() async {
        do {
            guard let fact = try await Webservice().fetchRAndomFact() else {return}
            factTextView.string = fact.data.first ?? "--"
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

