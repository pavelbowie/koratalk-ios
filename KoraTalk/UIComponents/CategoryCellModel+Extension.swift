//
//  CategoryCellViiewModel+Extension.swift
//  KoraTalk
//
//  Created by Pavel Mac on 5/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

extension CategoryWithRecipesCellModel {
    
    convenience init(category: MainCategory) {
        let cellItems = category.recipes.map({ RecipeCellModel(recipe: $0) })
        self.init(categoryId: category.id, categoryImageURL: nil, categoryName: category.name, cellItems: cellItems)
    }
}  
