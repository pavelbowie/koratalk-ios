//
//  SegmentioOptions+Extensions.swift
//  UIComponents
//
//  Created by Pavel Mac on 23/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Segmentio

public extension SegmentioOptions {
    
    static func options() -> SegmentioOptions {
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom, ratio: 0.32, height: 2, color: .appYellow)
        
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions(type: .none, height: 0, color: .appWhite)
        
        let verticalSeparatorOptions = SegmentioVerticalSeparatorOptions(ratio: 1, color: .appSecondary)
        
        let segmentStates = SegmentioStates(defaultState: SegmentioState(backgroundColor: .clear,
                                                                         titleFont: .font(.ttcommonsBold, size: .medium),
                                                                         titleTextColor: .appOrange),
                                            selectedState: SegmentioState(backgroundColor: .clear,
                                                                          titleFont: .font(.ttcommonsBold, size: .medium),
                                                                          titleTextColor: .appYellow),
                                            highlightedState: SegmentioState(backgroundColor: .clear,
                                                                             titleFont: .font(.ttcommonsBold, size: .medium),
                                                                             titleTextColor: .appYellow))
        
        let options = SegmentioOptions(backgroundColor: .appWhite,
                                       segmentPosition: .fixed(maxVisibleItems: 2),
                                       scrollEnabled: false, indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparatorOptions,
                                       verticalSeparatorOptions: verticalSeparatorOptions,
                                       imageContentMode: .center,
                                       labelTextAlignment: .center,
                                       segmentStates: segmentStates)
        return options
    }
}
