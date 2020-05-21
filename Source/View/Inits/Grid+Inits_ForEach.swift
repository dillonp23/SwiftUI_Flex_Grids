//
//  Grid+Inits_ForEach.swift
//  ExyteGrid
//
//  Created by Denis Obukhov on 07.05.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import SwiftUI

//Single ForEach init
extension Grid {
    public init(tracks: [GridTrack], spacing: GridSpacing = Constants.defaultSpacing, @ViewBuilder content: () -> ForEach<Range<Int>, Int, Content>) {
        self.trackSizes = tracks
        self.spacing = spacing
        self.items =
            content().data.enumerated().map { GridItem(AnyView(content().content($0.element)), id: AnyHashable(($0.offset))) }
    }
    
    public init<Data>(tracks: [GridTrack], spacing: GridSpacing = Constants.defaultSpacing, @ViewBuilder content: () -> ForEach<Data, Data.Element.ID, Content>) where Data: RandomAccessCollection, Data.Element: Identifiable {
        self.trackSizes = tracks
        self.spacing = spacing
        self.items =
            content().data.enumerated().map { GridItem(AnyView(content().content($0.element)), id: AnyHashable($0.element.id)) }
    }
}
