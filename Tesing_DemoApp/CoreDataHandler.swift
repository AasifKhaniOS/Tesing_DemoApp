//
//  CoreDataHandler.swift
//  DemoApp
//
//  Created by hammoq on 05/02/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func registerUser(_ user: UserModel) -> Bool {
        let newUser = User(context: context)
        newUser.name = user.name
        newUser.email = user.email
        newUser.password = user.password

        do {
            try context.save()
            print("User registered successfully")
            return true
        } catch {
            print("Error registering user: \(error.localizedDescription)")
            return false
        }
    }
    
    func userExists(user: UserModel) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", user.email!)
        
        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return false
        }
    }
    
    func fetchUser(user: UserModel) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", user.email!, user.password!)
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchAllUser() -> [User] {
        var allUsers: [User] = []
        do {
            let users = try context.fetch(User.fetchRequest())
            allUsers.append(contentsOf: users)
            return allUsers
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            return []
        }
    }
}
