//
//  BookFormTableViewController.swift
//  Favorite Books 2
//
//  Created by Navid on 1/7/22.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    var book: Book?
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    
    
    
    
    init?(coder:NSCoder, book: Book?){
        self.book = book
        super.init(coder: coder)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let book = book {
            
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
            title = "Editing Book"
        }else {
            title = "Add Book"
        }
        
        updateSaveButton()
    }
    
    
    @IBAction func updateSaveButton(){
        
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let genre = genreTextField.text ?? ""
        let length = lengthTextField.text ?? ""
        
        saveButton.isEnabled =  !title.isEmpty && !author.isEmpty && !genre.isEmpty && !length.isEmpty
      
}
    
    
    
    @IBAction func saveButtonPressed() {
        
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let genre = genreTextField.text ?? ""
        let length = lengthTextField.text ?? ""
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "saveUnwind", sender: self)
        
    }
    

    
    
    
}
