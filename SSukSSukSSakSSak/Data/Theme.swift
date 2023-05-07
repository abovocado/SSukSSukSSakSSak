//
//  Theme.swift
//  SSukSSukSSakSSak
//
//  Created by SY AN on 2023/04/06.
//  Card view 에서 각 shower 객체마다 가지는 바탕색 정의

import Foundation
// Color > SwiftUI framework에서만 제공하는 기능 >> Color 객체를 사용하기 위해 필수로 import
import SwiftUI

enum Theme: String, Identifiable, CaseIterable, Codable {
    // 색상 별 case 정의
    case lilyBlue
    case lilyPink
    case lilyYellow
    case lilyGreen
    
    // 1. main color 정의
    var mainColor: Color {
        // Color는 기본적으로 rawValue로 접근할 수 있다
        Color(rawValue)
    }
    
    // 2. accent Color 정의 (main color에 따라)
    var accentColor: Color {
        // 블루, 핑크일 때 > 액센트 컬러 화이트 // 그린, 옐로우일 때 > 액센트 블랙
        // instance 그 자체 (Theme 여기서는)
        switch self{
            
            // case ,,, :
            case .lilyBlue, .lilyPink
            : return .white
            
            case .lilyGreen, .lilyYellow
            : return .black
                
        }
    }
    
    var colorName: String {
        String(rawValue)
    }
    
    var id :String{
        colorName
    }
    
    
}

