import UIKit

final class ViewController: UIViewController {
	
	private let parrotsArray = [ParrotModel(title: "Parrots1", image: UIImage(named: "parrots1")!), ParrotModel(title: "Parrots2", image: UIImage(named: "parrots2")!), ParrotModel(title: "Parrots3", image: UIImage(named: "parrots3")!)]
	
	private let mainTableView: UITableView = {
		let tableView = UITableView()
		tableView.backgroundColor = .clear
		tableView.separatorStyle = .singleLine
		tableView.bounces = false
		tableView.showsVerticalScrollIndicator = true
		//tableView.delaysContentTouches = false
		
		return tableView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		
		setupViews()
		setConstraints()
		setDelegates()
	}
	
	private func setupViews() {
		view.addView(mainTableView)
		
		mainTableView.register(MainTableViewCell.self)
	}
	
	private func setDelegates() {
		mainTableView.delegate = self
		mainTableView.dataSource = self
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		parrotsArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let mainTableViewCell = mainTableView.dequeueReusableCell(MainTableViewCell.self) else { return UITableViewCell() }
		
		let parrot = parrotsArray[indexPath.row]
		mainTableViewCell.cellConfigure(title: parrot.title, image: parrot.image)
		return mainTableViewCell
	}
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		44
	}
	
}

extension ViewController {
	private func setConstraints() {
		NSLayoutConstraint.activate([
			mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
			mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
