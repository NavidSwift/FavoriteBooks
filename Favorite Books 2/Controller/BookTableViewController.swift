//
//  BookTableViewController.swift
//  Favorite Books 2
//
//  Created by Navid on 1/7/22.
//

import UIKit

class BookTableViewController: UITableViewController {
    var books: [Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()


        
        self.title = "Favorite Books"
    }

    @IBAction func editButtonPressed(_ sender: Any) {
        
        let editingMode = tableView.isEditing
        
        tableView.setEditing(!editingMode, animated: true)
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.update(book)
        cell.showsReorderControl = true
        return cell
        
    }
    
    @IBSegueAction func addBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        return BookFormTableViewController(coder: coder, book: nil)
        
        
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
   
        let bookToEdit: Book?
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {return BookFormTableViewController(coder: coder, book: nil)}
        bookToEdit = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: bookToEdit)
    }
    
 
    
    
    
   @IBAction func unwindToTable(seague: UIStoryboardSegue){
        
       guard seague.identifier == "saveUnwind",let sourceControl = seague.source as? BookFormTableViewController,let book = sourceControl.book else {return}
       
       if let indexPath = tableView.indexPathForSelectedRow {
           print("ok")
           books[indexPath.row] = book
           tableView.reloadRows(at: [indexPath], with: .none)
           
           
           
       } else {
         print("Hi")
           let newIndexPath = IndexPath(row: books.count, section: 0)
           books.append(book)
           tableView.insertRows(at: [newIndexPath], with: .none)
       }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    

}
