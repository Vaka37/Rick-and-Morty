//
//  DetaikViewController.swift
//  TestovoeRick
//
//  Created by Kalandarov Vakil on 16.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var imageCharacters = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var speciesLabel = UILabel()
    private lazy var genderLabel = UILabel()
    private lazy var episodeCount = UILabel()
    private lazy var locationLabel = UILabel()
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    func getInfoCharacters(info: Results) {
        imageCharacters.layer.cornerRadius = 15
        imageCharacters.clipsToBounds = true
        view.addSubview(imageCharacters)
        createAnchorImage()
        createLabel(label: nameLabel, text: info.name)
        createLabel(label: speciesLabel, text:"Species: " + info.species)
        createLabel(label: genderLabel, text:"Gender: " + info.gender)
        createLabel(label: episodeCount, text: "Number of episodes: " + String(info.episode.count))
        createLabel(label: locationLabel, text: "Location: " + info.location.name)
        setUpLabel()
        getImage(url: info.image)
    }
    
    //MARK: - Private methods
    
    private func getImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        let image = UIImage(data: imageData)
        self.imageCharacters.image = image
    }
    
    private func setUpLabel() {
        createAnchorNameLabel()
        createAnchorSpeciesLabel()
        createAnchorGenderLabel()
        createAnchorEpisodeCountLabel()
        createAnchorLocationLabel()
    }
    
    
    private func createLabel(label: UILabel, text: String) {
        nameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        label.sizeToFit()
        label.numberOfLines = 0
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
}

//MARK: - Layout

extension DetailViewController {
    private func createAnchorImage() {
        imageCharacters.translatesAutoresizingMaskIntoConstraints = false
        imageCharacters.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        imageCharacters.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        imageCharacters.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageCharacters.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    private func createAnchorNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.bottomAnchor.constraint(equalTo: imageCharacters.topAnchor, constant: -5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageCharacters.leftAnchor, constant: 0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: imageCharacters.rightAnchor, constant: 0).isActive = true
    }
    
    private func createAnchorSpeciesLabel() {
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.topAnchor.constraint(equalTo: imageCharacters.bottomAnchor, constant: 10).isActive = true
        speciesLabel.leftAnchor.constraint(equalTo: imageCharacters.leftAnchor, constant: 0).isActive = true
        speciesLabel.rightAnchor.constraint(equalTo: imageCharacters.rightAnchor, constant: 0).isActive = true
    }
    
    private func createAnchorGenderLabel() {
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10).isActive = true
        genderLabel.leftAnchor.constraint(equalTo: speciesLabel.leftAnchor, constant: 0).isActive = true
        genderLabel.rightAnchor.constraint(equalTo: speciesLabel.rightAnchor, constant: 0).isActive = true
    }
    
    private func createAnchorEpisodeCountLabel() {
        episodeCount.translatesAutoresizingMaskIntoConstraints = false
        episodeCount.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10).isActive = true
        episodeCount.leftAnchor.constraint(equalTo: genderLabel.leftAnchor, constant: 0).isActive = true
        episodeCount.rightAnchor.constraint(equalTo: genderLabel.rightAnchor, constant: 0).isActive = true
    }
    
    private func createAnchorLocationLabel() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: episodeCount.bottomAnchor, constant: 10).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: episodeCount.leftAnchor, constant: 0).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: episodeCount.rightAnchor, constant: 0).isActive = true
    }
}
