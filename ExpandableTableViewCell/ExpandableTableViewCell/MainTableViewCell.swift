import UIKit

final class MainTableViewCell: UITableViewCell {
	
	private static let idMainTableViewCell = "idMainTableViewCell"
	
	private let cellBackgroundView: UIView = {
		let view = UIView()
		view.backgroundColor = .lightGray
		return view
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.numberOfLines = 1
		return label
	}()
	
	private let imageViewCell: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	

	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupViews()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		backgroundColor = .clear
		selectionStyle = .none
		
		addView(cellBackgroundView)
		cellBackgroundView.addView(titleLabel)
		addView(imageViewCell)
	}

	
	func cellConfigure(title: String, image: UIImage) {
		self.titleLabel.text = title
		imageViewCell.image = image
	}
}

//MARK: - setConstraints

extension MainTableViewCell {
	private func setConstraints() {
		NSLayoutConstraint.activate([
			cellBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
			cellBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
			cellBackgroundView.topAnchor.constraint(equalTo: topAnchor),
			cellBackgroundView.heightAnchor.constraint(equalToConstant: 44),
			
			titleLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: cellBackgroundView.centerYAnchor),
			
			imageViewCell.topAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor),
			imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
