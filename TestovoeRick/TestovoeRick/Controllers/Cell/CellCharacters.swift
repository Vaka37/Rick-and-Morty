//
//  TableViewCell.swift
//  TestovoeRick
//
//  Created by Kalandarov Vakil on 16.04.2022.
//

import UIKit

class CellCharacters: UITableViewCell {
    private lazy var nameLabel = UILabel()
    private lazy var speciesLabel = UILabel()
    private lazy var genderLabel = UILabel()
    private lazy var faceImage = UIImageView()
    
    func getInfoCharacters(model: Results) {
        nameLabel.text = "Name: " + model.name
        speciesLabel.text = "Species: " + model.species
        genderLabel.text = "Gender: " + model.gender
        createImage(url: model.image)
        createCell(label: nameLabel)
        createCell(label: speciesLabel)
        createCell(label: genderLabel)
        createAhchorLabel()
    }
    
    private func createCell(label: UILabel) {
        self.selectionStyle = .none
        contentView.addSubview(label)
    }
    
    private func createAhchorLabel() {
        createAnchorNameLabel()
        createAnchorSpeciesLabel()
        createAnchorGenderLabel()
    }
    
    private func createImage(url: String) {
        faceImage.layer.cornerRadius = 60
        faceImage.clipsToBounds = true
        contentMode = .scaleAspectFit
        getImage(url: url)
        contentView.addSubview(faceImage)
        createAnchorFaceImage()
    }
    
    private func getImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
                guard let imageData = try? Data(contentsOf: imageURL) else { return }
                let image = UIImage(data: imageData)
                self.faceImage.image = image
    }
}

//MARK: - Layout

extension CellCharacters {
    
    private func createAnchorNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: faceImage.leftAnchor, constant: -10).isActive = true
    }
    
    private func createAnchorSpeciesLabel() {
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        speciesLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        speciesLabel.rightAnchor.constraint(equalTo: faceImage.leftAnchor, constant: -10).isActive = true
        speciesLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //speciesLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private func createAnchorGenderLabel() {
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: speciesLabel.leftAnchor, constant: 0).isActive = true
        genderLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        genderLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private func createAnchorFaceImage() {
        faceImage.translatesAutoresizingMaskIntoConstraints = false
        faceImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        faceImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        faceImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        faceImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
