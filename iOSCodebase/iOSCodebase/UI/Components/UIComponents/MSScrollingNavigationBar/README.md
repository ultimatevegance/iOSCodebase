https://github.com/andreamazz/AMScrollingNavbar
Make sure to use a subclass of ScrollingNavigationController for your UINavigationController;
1. Use followScrollView(_: delay:) to start following the scrolling of a scrollable view (e.g.: a UIScrollView or UITableView).

  ```swift
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if let navigationController = navigationController as? MSScrollingNavigationController {
        navigationController.followScrollView(tableView, delay: 50.0)
    }
}
  ```