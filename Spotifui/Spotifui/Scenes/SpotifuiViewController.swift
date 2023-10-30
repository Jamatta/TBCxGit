//
//  SpotifuiViewController.swift
//  Spotifui
//
//  Created by Nika Jamatashvili on 29.10.23.
//

import UIKit

class SpotifuiViewController: UIViewController, UINavigationControllerDelegate {
    
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
        let vc =  AddNewItemToListViewController()
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMusic = musics[indexPath.row]
        
        let detailViewController = ItemDetailsViewController(music: selectedMusic)
        
        self.present(detailViewController, animated: true, completion: nil)
    }
}

extension SpotifuiViewController {
    func fetchData() -> [Music] {
        let music1 = Music(image: Images.ninoC, title: "Afrebi - Nino chxeidze")
        let music2 = Music(image: Images.mziaG, title: "Mimkitxave bosha qalo")
        let music3 = Music(image: Images.xatiaW, title: "Xatia Tseretelis nebismieri")
        let music5 = Music(image: Images.artwork, title: "Mere ra - Tamuna amonashvili")
        let music6 = Music(image: Images.katamadze, title: "Quchashi - Nino Katamadze")
        let music7 = Music(image: Images.maxinji, title: "Maxinji vaaaar")
        let music8 = Music(image: Images.stefane, title: "Xelebi - Stefane x DJ Rembo (remix)")
        let music9 = Music(image: Images.swopa, title: "Xelebi - Stefane")
        let music10 = Music(image: Images.tikaj, title: "Tika Jamburias bestebi")
        let music11 = Music(image: Images.sefa, title: "White Horse - Merab Sefashvili")
        let music12 = Music(image: Images.bigtiko, title: "Sheni saxe - BIG Tiko")
        let music13 = Music(image: Images.pataragio, title: "Me da shen - Patara gio fb Bedina")
        
        return [music1, music2, music3, music5, music6, music7, music8, music9, music10, music11, music12, music13]
    }
}

extension SpotifuiViewController: AddNewMusicDelegate {
    func addNewMusic(title: String, image: UIImage) {
        let newMusic = Music(image: image, title: title)
        musics.append(newMusic)
        tableView.reloadData()
    }
}
