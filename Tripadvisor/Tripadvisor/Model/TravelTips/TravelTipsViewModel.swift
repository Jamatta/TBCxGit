//
//  TravelTipsViewModel.swift
//  Tripadvisor
//
//  Created by Nika Jamatashvili on 14.12.23.
//

import SwiftUI

class TravelTipsViewModel: ObservableObject {
    
     let travelingTips = [
        "Pack light and smart to avoid carrying excessive luggage.",
        "Always carry essential documents like passport, IDs, and travel insurance.",
        "Research and learn a few common phrases in the local language for better communication.",
        "Inform your bank about your travel plans to avoid card issues while abroad.",
        "Keep a portable charger for your electronic devices handy.",
        "Try local cuisine and food specialties to immerse yourself in the culture.",
        "Stay hydrated and carry a reusable water bottle.",
        "Plan your itinerary but be flexible for unexpected adventures.",
        "Backup important data and documents digitally.",
        "Respect local customs and traditions."
    ]
    
    func displayRandomTip() -> String {
        var randomNumber = Int.random(in: 1...10)
        
        return travelingTips[randomNumber]
        
    }
}
