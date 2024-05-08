//
//  DataController.swift
//  KgMartShop
//
//  Created by Bema on 6/5/24.
//

import Foundation
import CoreData
import UIKit

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ProductModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("We don't save the data...")
        }
    }
    
    func addFood(name: String, price: Float, image: UIImage, description: String, brand: String, manufacturer: String, context: NSManagedObjectContext) {
        let product = Product(context: context)
        product.id = UUID()
        product.name = name
        product.price = price
        product.descriptionn = description
        product.brand  = brand
        product.manufacturer = manufacturer
        
        if let imageData = image.pngData() {
            product.imagePath = imageData
        }
        
        save(context: context)
    }
    
    func editProduct(product: Product, name: String, price: Float, image: UIImage, description: String, brand: String, manufacturer: String, context: NSManagedObjectContext) {
        product.name = name
        product.price = price
        product.descriptionn = description
        product.brand  = brand
        product.manufacturer = manufacturer
        
        if let imageData = image.pngData() {
            product.imagePath = imageData
        }
        
        save(context: context)
    }
}
