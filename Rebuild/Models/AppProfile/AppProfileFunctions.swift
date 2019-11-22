//
//  AppProfileFunctions.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/19/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import Foundation

class AppProfileFunctions {
    static func readAppProfiles(completion: @escaping ([AppProfile])->() ) -> Void {
        DispatchQueue.global(qos: .background).async {
            if AppProfileData.listOfProfiles.count == 0 {
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Coloors level 1", description: "Suscipit adipiscing bibendum est ultricies integer quis auctor elit sed. Sit amet massa vitae tortor condimentum lacinia quis vel. Pellentesque dignissim enim sit amet venenatis urna cursus eget nunc. Morbi tincidunt augue interdum velit euismod in"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Letters level 3", description: "Quisque id diam vel quam elementum. Et magnis dis parturient montes nascetur ridiculus. Odio pellentesque diam volutpat commodo sed egestas. Ut lectus arcu bibendum at varius vel pharetra vel."))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Writing level 2", description: "Amet aliquam id diam maecenas ultricies mi eget mauris pharetra. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Sed felis eget velit aliquet sagittis. Urna molestie at elementum eu facilisis sed odio. Turpis tincidunt id aliquet risus feugiat in. "))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for math level 2", description: "Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Id diam maecenas ultricies mi eget. Sed viverra ipsum nunc aliquet bibendum. Arcu vitae elementum curabitur vitae nunc. Viverra orci sagittis eu volutpat"))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Colors level 1", description: "Sed velit dignissim sodales ut eu. Sed ullamcorper morbi tincidunt ornare. Ut sem nulla pharetra diam. Quis ipsum suspendisse ultrices gravida dictum fusce. "))
                AppProfileData.listOfProfiles.append(AppProfile(title: "Profile: Apps for Letters level 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu tincidunt tortor aliquam nulla facilisi cras. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed. Pretium lectus quam id leo in vitae turpis massa sed. Sed id semper risus in hendrerit gravida. Sed risus ultricies tristique nulla aliquet enim tortor at auctor."))

            }
            DispatchQueue.main.async {
                print(AppProfileData.listOfProfiles[1].title)
                completion(AppProfileData.listOfProfiles)
            }
        }
    }
}
