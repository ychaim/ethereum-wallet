// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov


import UIKit


protocol TabBarRouterInput: class {
  func getTabViewControllers() -> [UIViewController]
}
