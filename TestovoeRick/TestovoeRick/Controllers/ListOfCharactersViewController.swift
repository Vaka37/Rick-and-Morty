//
//  ViewController.swift
//  TestovoeRick
//
//  Created by Kalandarov Vakil on 16.04.2022.
//


import UIKit

class ListOfCharactersViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var tableForCharacters = UITableView()
    private lazy var addCharacters = UIButton()
    
    private var identefire = "My cell"
    private var networkService = NetworkService()
    
    private var detailCharacters: [Results] = []
    private var url: CharactersModel?
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableForCharacters()
        getListCharacters()
        createAddButton()
    }
    
    //MARK: - Private methods
    
    private func getListCharacters() {
        networkService.createNetworkService(http: "https://rickandmortyapi.com/api/character") { result in
            switch result {
            case .success(let url):
                DispatchQueue.main.async {
                    self.url = url
                    self.detailCharacters = url.results
                    self.tableForCharacters.reloadData()
                }
            case .failure(_):
                self.showErrorAlert(text: "Проверьте подключение интернета")
            }
        }
    }
    
    private func createAddButton() {
        addCharacters.backgroundColor = .systemGray
        addCharacters.setTitle("Load more", for: .normal)
        addCharacters.addTarget(self, action: #selector(addButtonMethod), for: .touchUpInside)
        addCharacters.layer.cornerRadius = 20
        addCharacters.clipsToBounds = true
        view.addSubview(addCharacters)
        createAnchorButton()
    }
    
    @objc func addButtonMethod() {
        networkService.createNetworkService(http: url?.info.next ?? "") { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.url = model
                    self.detailCharacters.append(contentsOf: model.results)
                    self.tableForCharacters.reloadData()
                }
            case .failure(_):
                self.showErrorAlert(text: "Проверьте подключение интернета")
            }
        }
    }
    
    private func createTableForCharacters() {
        tableForCharacters.dataSource = self
        tableForCharacters.delegate = self
        tableForCharacters.register(CellCharacters.self, forCellReuseIdentifier: identefire)
        view.addSubview(tableForCharacters)
        createAnchorTable()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ListOfCharactersViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identefire, for: indexPath) as? CellCharacters{
            cell.getInfoCharacters(model: detailCharacters[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.getInfoCharacters(info: detailCharacters[indexPath.row])
        present(vc, animated: true, completion: nil)
    }
}

//MARK: - Layout

extension ListOfCharactersViewController {
    private func createAnchorTable() {
        tableForCharacters.translatesAutoresizingMaskIntoConstraints = false
        tableForCharacters.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableForCharacters.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableForCharacters.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableForCharacters.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
    }
    
    private func createAnchorButton() {
        addCharacters.translatesAutoresizingMaskIntoConstraints = false
        addCharacters.topAnchor.constraint(equalTo: tableForCharacters.bottomAnchor, constant: 5).isActive = true
        addCharacters.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        addCharacters.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        addCharacters.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    }
    
}

