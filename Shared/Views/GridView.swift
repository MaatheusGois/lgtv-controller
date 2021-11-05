//
//  GridView.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import SwiftUI

// MARK: - Grid

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
        List {
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
    let title: String
    var action: (() -> Void)?
}

// MARK: - Cell

struct GridCell: View {

    var viewData: GridViewData

    init?(_ viewData: GridViewData?) {
        guard let viewData = viewData else { return nil }
        self.viewData = viewData
    }

    var body: some View {
        Text(viewData.title)
            .onTapGesture {
                viewData.action?()
            }
            .frame(maxWidth: .infinity)
    }
}
