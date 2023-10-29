//
//  SpotifuiViewController.swift
//  Spotifui
//
//  Created by Nika Jamatashvili on 29.10.23.
//

import UIKit

class SpotifuiViewController: UIViewController {
    
    private var tableView = UITableView()
    private var musics: [Music] = []
    
    struct Cells {
        static let musicCell = "MusicCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // title = "Spotiფუი"
        configureTableView()
        musics = fetchData()
        configureNavbar()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 64
        tableView.register(MusicCell.self, forCellReuseIdentifier: Cells.musicCell)
        tableView.pin(to: view)
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavbar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        let navigationItem = UINavigationItem(title: "Spotiფუი")
        navigationItem.rightBarButtonItem = addButton
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        navBar.setItems([navigationItem], animated: false)
        
        self.tableView.tableHeaderView = navBar
    }
    
    @objc private func addButtonPressed() {
        let navigationController = UINavigationController(rootViewController: AddNewItemToListViewController())
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

extension SpotifuiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.musicCell) as! MusicCell
        let music = musics[indexPath.row]
        cell.set(music: music)
        
        return cell
    }
}

extension SpotifuiViewController {
    func fetchData() -> [Music] {
        let music1 = Music(image: Images.ninoC, title: "Afrebi")
        let music2 = Music(image: Images.mziaG, title: "Mimkitxave bosha qalo")
        let music3 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music4 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music5 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music6 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music7 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music8 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music9 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        let music10 = Music(image: Images.xatiaW, title: "xatias nebismieri")
        
        return [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}

extension SpotifuiViewController: AddNewMusicInArray {
    func addNewMusic(title: String, image: UIImage) {
        let newMusic = Music(image: image, title: title)
        musics.append(newMusic)
        tableView.reloadData()
    }
}
