//
//  KoraTalkDataProvider.swift
//  KoraTalk
//
//  Created by Pavel Mac on 23/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
