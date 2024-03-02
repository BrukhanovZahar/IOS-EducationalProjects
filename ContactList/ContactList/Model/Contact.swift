//
//  Contact.swift
//  ContactList
//
//  Created by Захар Брюханов on 03.03.2024.
//

import Foundation

protocol ContactProtocol {
    var title: String { get set }
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
    
}
