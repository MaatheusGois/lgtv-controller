//
//  GridView.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import SwiftUI

// MARK: - Cell

struct GridView: View {

    // Properties

    private var grid: [GridViewData]
    private var collums: Int

    private var index: Int {
        Int(ceil(Double(grid.count)/Double(collums)))
    }

    // Lifecycle

    init(grid: [GridViewData], collums: Int = 3) {
        self.grid = grid
        self.collums = collums
    }

    var body: some View {
        VStack {
            ForEach(.zero..<index) { i in
                HStack {
                    ForEach(.zero..<collums) { k in
                        GridCell(grid[safe: collums*i+k])
                    }
                }
            }
        }
    }
}

// MARK: - Data

struct GridViewData: Identifiable {
    var id: UUID { .init() }
    let image: DSImage
    var action: (() -> Void)?
}

// MARK: - Cell

struct GridCell: View {

    var viewData: GridViewData
    var width: CGFloat {
        #if os(iOS)
            return 90
        #endif
        #if os(macOS)
            return 70
        #endif
        #if os(watchOS)
            return 50
        #endif
    }

    init?(_ viewData: GridViewData?) {
        guard let viewData = viewData else { return nil }
        self.viewData = viewData
    }

    var body: some View {
        Image(viewData.image.rawValue)
            .resizable()
            .frame(
                width: width,
                height: width
            )
            .onTapGesture {
                viewData.action?()
            }
    }
}
