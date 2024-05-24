//
//  SwiftUIView.swift
//  
//
//  Created by Euan on 2024/2/15.
//

import SwiftUI

struct SearchSumView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \CosmeticCoreDataModel.index, ascending: true)
    ], animation: .default)
    private var cosmetics: FetchedResults<CosmeticCoreDataModel>
    
    @Binding var isEnter: Bool
    
    @State private var selectionID: CosmeticCoreDataModel.ID?
    @State var isPresented = false
    @State var isShowInfo = false
    @State private var currentSelectionID: CosmeticCoreDataModel.ID?
    @State private var searchText = ""

    private var searchResults: [CosmeticCoreDataModel] {
        if searchText.isEmpty {
            return cosmetics.filter { _ in true }
        } else {
            return cosmetics.filter ({cosmetic in
                cosmetic.name.lowercased().trimmingCharacters(in: .whitespaces).contains(searchText.lowercased().trimmingCharacters(in: .whitespaces))
            }) + cosmetics.filter ({cosmetic in
                cosmetic.brand.lowercased().trimmingCharacters(in: .whitespaces).contains(searchText.lowercased().trimmingCharacters(in: .whitespaces))
            })
//            + cosmetics.filter ({cosmetic in
//                var isContain: Bool = false
//                var index: Int = 0
//                while(!isContain && index < cosmetic.ingredients.count) {
//                    isContain = cosmetic.ingredients[index].description.lowercased().contains(searchText.lowercased())
//                    index += 1
//                }
//                return isContain
//            })
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            NavigationStack {
                ZStack(alignment: .top) {
                    
                    // MARK: Table
                    renderTable()
                        .zIndex(1.0)
                    
                        .sheet(isPresented: $isPresented) {
                            CosmeticSheetView(isPresented: $isPresented, cosmetic: cosmetics[currentSelectionID! - 1])
                        }
                    
                        .sheet(isPresented: $isShowInfo) {
                            CosmeticFunctionView.illustrationView()
                            
                        }
                    
                    // MARK: system
                        .searchable(text: $searchText, placement: .toolbar, prompt: "Search for Brand or Name")
                    
                        .navigationTitle("Table")
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    isShowInfo = true
                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundStyle(Color.primary)
                                }
                            }
                            
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    isEnter = false
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(Color.primary)
                                }
                            }
                        }
                }
            }
        }
    }
    
    func renderTable() -> some View {
        Table(of: CosmeticCoreDataModel.self, selection: $selectionID) {
            
            TableColumn("ID") { cosmetic in
                // Return compact version of the view
                if isCompact {
                    VStack(alignment: .leading) {
                        Text(cosmetic.brand + " - " + cosmetic.name)
                            .bold()
                            .lineLimit(1)
                        HStack {
                            Text("Efficacy: ")
                                .foregroundStyle(Color.secondary)
                            CosmeticFunctionView(cosmetic: cosmetic)
                        }
                        HStack{
                            Text("Inapplicable Skin Type: ")
                                .foregroundStyle(Color.secondary)
                            if (cosmetic.combination && cosmetic.dry && cosmetic.normal && cosmetic.oily && cosmetic.sensitive) {
                                Text("none")
                            } else {
                                SkinTypeViewSheet(cosmetic: cosmetic)
                            }
                        }
                    }
                }
                // Return normal version of the view
                else {
                    Text(cosmetic.index.description)
                }
            }
            .width(min: isCompact ? 100: 10, max: isCompact ? 1000 : 50)
            
            
            TableColumn("Brand", value: \.brand)
                .width(min: 50, max: 300)
            
            TableColumn("Name", value: \.name)
                .width(min: 200, max: 600)
            //            TableColumn("Rank", value: \.rank.description)
            //            TableColumn("Price", value: \.price.description)
            
            TableColumn("Efficacy") { cosmetic in
                CosmeticFunctionView(cosmetic: cosmetic)
            }
            .width(min: 80, max: 200)
            
            TableColumn("Inapplicable") { cosmetic in
                SkinTypeView(cosmetic: cosmetic)
            }
            .width(min: 80, max: 200)
            
            
        } rows: {
            ForEach(searchResults) { cosmetic in
                TableRow(cosmetic)
            }
        }
        .contextMenu(forSelectionType: CosmeticCoreDataModel.ID.self) { items in
            
        } primaryAction: { itemID in
            self.isPresented = true
            currentSelectionID = selectionID
            print(itemID.description)
        }
        .overlay(
            Image("noise")
                .resizable()
                .blendMode(.screen)
                .opacity(0.1)
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
        )
    }
}
