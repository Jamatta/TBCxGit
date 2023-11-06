//
//  NoteListViewController.swift
//  Note
//
//  Created by Nika Jamatashvili on 05.11.23.
//

import UIKit

class NoteListViewController: UIViewController, UINavigationControllerDelegate {
    
    private var tableView = UITableView()
    private var notes: [Notes] = []
    
    
    struct Cells {
        static let noteCell = "NoteCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        notes = fetchData()
        configureNavbar()
       
    }
    
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 80
        tableView.register(NoteCell.self, forCellReuseIdentifier: Cells.noteCell)
        tableView.pin(to: view)
        tableView.backgroundColor = blackColor
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavbar() {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed)
        )
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    @objc private func addButtonPressed() {
        let vc =  AddNoteViewController()
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.noteCell) as! NoteCell
        let notes = notes[indexPath.row]
        cell.set(notes: notes)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        let detailViewController = NoteDetailsViewController(notes: selectedNote)
        
        
        self.present(detailViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension NoteListViewController {
    func fetchData() -> [Notes] {
        let note1 = Notes(title: "საყიდლების სია", noteText: "2 კილო ბადრიჯანი, უშაქრო კოლა და სამარხვო მაიონეზი")
        let note2 = Notes(title: "წვეულების სია", noteText: "არაყი, ლუდი, არაყი, ჭაჭა, ჭაჭა (კი ლოთი ვარ ხდ)")
        let note3 = Notes(title: "ბავშვებს უყიდე რამე", noteText: "ზუკოს წვენები და ბაბოლი კევი <3 ")
        let note4 = Notes(title: "არ დაგავიწყდეს!", noteText: "Hand In!")
        
        return [note1, note2, note3, note4]
    }
}

extension NoteListViewController: AddNewNoteDelegate {
    func addNewNotes(title: String, noteText: String) {
        let newNote = Notes(title: title, noteText: noteText)
        notes.append(newNote)
        tableView.reloadData()
    }
}

