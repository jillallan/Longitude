//
//  SampleData.swift
//  Longitude
//
//  Created by Jill Allan on 03/07/2023.
//

import Foundation

struct SampleData {
    static let locations = [
        (2016, 7, 28, 8, 6, 51.436027524806505, -2.597474502627349, "St Johns Lane, Bedminster, Bristol BS3 5BA, England"),
        (2016, 7, 28, 8, 27, 51.436027524806505, -2.597474502627349, "Bedminster Station, Bristol, England"),
        (2016, 7, 28, 9, 30, 51.44966757913053, -2.5831726111207156, "Temple Meads Station, Bristol, England"),
        (2016, 7, 28, 9, 41, 51.37782769397433, -2.3569045449589785, "Bath Spa Station, Bath, England"),
        (2016, 7, 28, 9, 54, 51.46236588568934, -2.1153121616997788, "Chippenham Station, Chippenham, England"),
        (2016, 7, 28, 10, 08, 51.565890755963636, -1.7855841161142278, "Swindon Station, Swindon, England"),
        (2016, 7, 28, 10, 27, 51.611101811053956, -1.24271160076959, "Didcot Parkway Station, Didcot, England"),
        (2016, 7, 28, 10, 41, 51.45852451049556, -0.9714477161194405, "Reading Station, Reading, England"),
        (2016, 7, 28, 11, 07, 51.516725318443555, -0.1773466083527514, "Paddington Station, London, England"),
        (2016, 7, 28, 11, 16, 51.52039206527473, -0.17021864495204256, "Edgware Road Station, London, England"),
        (2016, 7, 28, 11, 19, 51.52329110822747, -0.15685228746806062, "Baker Street, London, England"),
        (2016, 7, 28, 11, 20, 51.52388225453127, -0.14395058912989314, "Great Portland Street, London, England"),
        (2016, 7, 28, 11, 21, 51.52576179854365, -0.1350089737873496, "Euston Square, London, England"),
        (2016, 7, 28, 11, 24, 51.530869876600214, -0.12313681611591933, "Kings Cross, St Pancras, London, England"),
    ]
    
    static let visitDetails = [
        (2016, 7, 28, 8, 0, 0, 10),  // St Johns Lane
        (2016, 7, 28, 8, 20, 0, 10),  // Bedminster Station
        (2016, 7, 28, 8, 40, 0, 55),  // Temple Meads
        (2016, 7, 28, 11, 7, 0, 5),  // Paddington
        (2016, 7, 28, 11, 24, 1, 0),  // St Pancras
    ]
    
    static let journeyDetails = [
        (2016, 7, 28, 8, 31, 0, 9),  // Bedminster to Temple Meads
        (2016, 7, 28, 9, 35, 1, 40),  // Temple Meads to Paddington
        (2016, 7, 28, 11, 12, 0, 20),  // Paddington to St Pancras
    ]
    
    static let activityDetails = visitDetails + journeyDetails
}
