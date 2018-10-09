//
//  ViewController.swift
//  NKSkeleton
//
//  Created by nkopilovskii on 10/04/2018.
//  Copyright (c) 2018 nkopilovskii. All rights reserved.
//

import UIKit
import NKSkeleton

class ViewController: UIViewController {
  
  
  
  let colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.cyan.cgColor, UIColor.blue.cgColor, UIColor.magenta.cgColor]
//  let colors = [UIColor.lightGray.cgColor, UIColor.white.cgColor, UIColor.lightGray.cgColor, UIColor.white.cgColor]
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
//    let deadlineTime = DispatchTime.now() + .seconds(4)
//    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
//      self.showSkeletonOnView1(self)
//      self.showSkeletonOnView2(self)
//      self.showSkeletonOnView3(self)
//      self.showSkeletonOnView4(self)
//      self.showSkeletonOnView5(self)
//      self.showSkeletonOverFullScreen(self)
//    }
  }
  
  @IBAction func showSkeletonOnView1(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .axial
    config.initialPosition = .left
    config.duration = 1
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view.viewWithTag(1))
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
  @IBAction func showSkeletonOnView2(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .axial
    config.initialPosition = .bottom
    config.duration  = 1
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view.viewWithTag(2))
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
  @IBAction func showSkeletonOnView3(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .axial
    config.initialPosition = .topRight
    config.duration  = 1
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view.viewWithTag(3))
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
  @IBAction func showSkeletonOnView4(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .radial(false)
    config.initialPosition = .bottomRight
    config.duration  = 1
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view.viewWithTag(4))
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
  @IBAction func showSkeletonOnView5(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .axial
    config.initialPosition = .center
    config.duration  = 1
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view.viewWithTag(5))
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
  @IBAction func showSkeletonOverFullScreen(_ sender: Any) {
    
    var config = NKSkeletonConfiguration()
    config.isAnimatable = true
    config.colors = colors
    config.type = .axial
    config.initialPosition = .topLeft
    config.duration  = 4
    config.subviewsLevel = 1
    
    let skeleton = NKSkeleton(configuration: config)
    skeleton.show(on: view)
    
    let deadlineTime = DispatchTime.now() + .seconds(5)
    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
      skeleton.remove()
    }
    
  }
  
}

