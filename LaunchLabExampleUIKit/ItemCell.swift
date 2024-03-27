//
//  ItemCell.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import UIKit

final class ItemCell: UITableViewCell {
    let mainLabel = UILabel()
    let descriptionLabel = UILabel()
    let energyLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        descriptionLabel.numberOfLines = 0

        let energyLabelSize: CGFloat = 44
        energyLabel.translatesAutoresizingMaskIntoConstraints = false
        energyLabel.layer.cornerRadius = energyLabelSize / 2
        energyLabel.textColor = .white
        energyLabel.textAlignment = .center
        contentView.addSubview(energyLabel)
        NSLayoutConstraint.activate([
            energyLabel.widthAnchor.constraint(equalToConstant: energyLabelSize),
            energyLabel.heightAnchor.constraint(equalToConstant: energyLabelSize),
            energyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            energyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: energyLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: energyLabel.leadingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    func setData(
        title: String,
        description: String?,
        energyGrade: Grade
    ) {
        mainLabel.text = title
        descriptionLabel.text = description ?? "Description unavailable"
        energyLabel.text = energyGrade.rawValue
        energyLabel.backgroundColor = .black
    }
}
