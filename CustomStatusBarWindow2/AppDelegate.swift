//
//  AppDelegate.swift
//  CustomStatusBarWindow2
//
//  Created by Gui Rambo on 02/02/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: 28)
        statusItem.button?.title = "😊"
        statusItem.button?.action = #selector(toggleUIVisible)
    }
    
    private var windowController: StatusBarMenuWindowController?

    @objc func toggleUIVisible(_ sender: Any?) {
        if windowController == nil || windowController?.window?.isVisible == false {
            showUI(sender: sender)
        } else {
            hideUI()
        }
    }
    
    @objc func hideUI() {
        windowController?.close()
    }

    func showUI(sender: Any?) {
        if windowController == nil {
            windowController = StatusBarMenuWindowController(
                statusItem: statusItem,
                contentViewController: DummyContentViewController()
            )
        }
        
        windowController?.showWindow(sender)
    }


}

final class DummyContentViewController: NSViewController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        preferredContentSize = NSSize(width: 290, height: 300)
    }
    
    override func loadView() {
        view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
    }
    
}
