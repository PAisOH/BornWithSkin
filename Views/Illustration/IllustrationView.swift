//
//  CommentaryView.swift
//  OrganicSkin
//
//  Created by Euan on 2024/2/2.
//

import SwiftUI

struct UniqueIDView<ID: Hashable>: Identifiable {
    public let id: ID
    let view: AnyView
}

struct IllustrationScrollView: View {
    
    @Environment(\.managedObjectContext) var viewContext

    @EnvironmentObject var globalVariables: GlobalVariables
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }

    @Namespace private var cardNS

    @State private var selectProductView: ProductViewAbstract?

    @State private var scrollPosition: Int?
    @State private var lastScrollPosition: Int?
    @State var isShowSheet = false
    @State var isAlert = false
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \ProgressCoreDataModel.index, ascending: true)
    ], animation: .default)
    private var progresses: FetchedResults<ProgressCoreDataModel>
    

    
    private var pageArray: [ProductViewAbstract] = [
        CleanserPage(),
        MoisturizerPage(),
        SunscreenPage(),
        AcneSerumPage(),
        GlowSerumPage(),
        RepairMaskPage(),
        AntiAgingCreamPage()
    ]
    var body: some View {
        ZStack {
            // 必须要nil，不然突然转方向会漏出来
            if selectProductView == nil {
                collapsedScrollView
            } 
            if selectProductView != nil{
                expandedActiveView
                    .zIndex(2.0)
            }
        }
        .alert(isPresented: $isAlert) {
            return Alert(title: Text(selectProductView!.alertText))
        }
    }
    
    func renderContent(_ childView: ProductViewAbstract) -> some View {
        return ZStack {
            cardBackgroundView(cornerRadius: 20, productView: childView)
                .zIndex(1.0)
            
            ZStack(alignment: .bottom) {
                childView.renderActiveView()
                    .allowsHitTesting(false)
                    .background(colorScheme == .light ? Color.white : Color.black)
                    .drawingGroup(opaque: false)
                    .blendMode(colorScheme == .light ? .multiply : .difference)
                    .matchedGeometryEffect(id: childView.id, in: cardNS)
                //                .padding(.trailing, -200)
                //                .padding(.top, 100)
                    .zIndex(2.0)
                
//                Ellipse()
//                    .fill(.black)
//                    .frame(width: 300, height: 150)
//                    .rotationEffect(Angle(degrees: 30))
//                    .padding(.leading, 150)
//                    .blur(radius: 20)
//                    .blendMode(.overlay)
//                    .zIndex(1.0)
            }
            .zIndex(2.0)
            
            if progresses[childView.id - 1].isLearning {
                ZStack {
                    VStack(alignment: .leading) {                        
                        Spacer()
                        HStack {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(colorScheme == .dark ? .white.opacity(0.5) : .black)
                                .scaleEffect(2)
                                .padding(36)
                            Spacer()
                        }
                    }
                }
                .zIndex(8.0)
            }
        }
        .aspectRatio(0.6, contentMode: .fit)
        .onTapGesture {
            withAnimation(.smooth(duration: 0.26)) {
                childView.isEnter = true
                globalVariables.isEnterProductViewAbstract = true
                
                selectProductView = childView
                print("+ \(scrollPosition)")
                print("++ \(lastScrollPosition)")

            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                isAlert = true
            }
        }

    }
    
    var collapsedScrollView: some View {
        // 不能用AnyLayout，因为他没有Lazy特性，会定位失败
        //        var layout = globalVariables.isPortrait ? LazyVStack(spacing: 30 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1), content: renderContent) : LazyHStack(spacing: 20 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1), content: () -> _)
        
        
        return ZStack {
            if #available(iOS 17.0, *) {
                ScrollViewReader { scrollReader in
                    ScrollView(globalVariables.isPortrait ? .vertical : .horizontal) {
                        if globalVariables.isPortrait {
                            LazyVStack(spacing: 30 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1)) {
                                ForEach(pageArray) { childView in
                                    renderContent(childView)
                                }
                            }
                            .scrollTargetLayout()
                            .onChange(of: lastScrollPosition) { _ in
                                print("+++++++++ DETECT +++++++++")
//                                print("+++ \(scrollPosition)")
//                                print("+++++++ \(lastScrollPosition)")
                                scrollReader.scrollTo(pageArray[(lastScrollPosition ?? 1) - 1].id, anchor: .topLeading)
                            }
                        } else {
                            LazyHStack(spacing: 20 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1)) {
                                ForEach(pageArray) { childView in
                                    renderContent(childView)
                                }
                                // 注意axis 不正确的话会影响颜色
                                .scrollTransition(.animated, axis: globalVariables.isPortrait ? .vertical : .horizontal) { view, phase in
                                    view.opacity(phase != .identity ? 0.3 : 1.0)
                                        .scaleEffect(phase != .identity ? 0.9 : 1.0)
                                }
                            }
                            .scrollTargetLayout()
                            .onChange(of: lastScrollPosition) { _ in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    print("+++++++++ DETECT scroll TO: \((lastScrollPosition ?? 1) - 1)  +++++++++")
                                    //                                print("+++ \(scrollPosition)")
                                    //                                print("+++++++ \(lastScrollPosition)")
                                    scrollReader.scrollTo(pageArray[(lastScrollPosition ?? 1) - 1].id, anchor: .topLeading)
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(id: $scrollPosition)
                    .zIndex(1.0)
                }
            } else {                    
                ScrollView(globalVariables.isPortrait ? .vertical : .horizontal) {
                    if globalVariables.isPortrait {
                        LazyVStack(spacing: 30 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1)) {
                            ForEach(pageArray) { childView in
                                renderContent(childView)
                            }
                        }
                    } else {
                        LazyHStack(spacing: 20 * (UIDevice.current.userInterfaceIdiom == .pad ? 2 : 1)) {
                            ForEach(pageArray) { childView in
                                renderContent(childView)
                            }
                            // 注意axis 不正确的话会影响颜色
                        }
                    }
                }
                .zIndex(1.0)
                
            }
        }
    }
    
    var expandedActiveView: some View {
        ZStack {
            GeometryReader { geometry in
                HStack {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black.opacity(0.5))
                            .scaleEffect(1.5)
                        
                        Text("Back")
                            .foregroundColor(.black.opacity(0.5))
                            .font(.title3)
                    }
                    
                    .onTapGesture {
                        progresses[selectProductView!.id - 1].isLearning = true
                        do {
                            try self.viewContext.save()
                            print("```````Launch```````")
                            print("Launch:" + progresses[selectProductView!.id - 1].isLearning.description)
                            print("```````Launch```````")
                        } catch {
                            print("?!?!?!Launch?!?!?!")
                            
                            fatalError("<><><>\(error)")
                        }
                        
                        selectProductView!.isEnter = false
                        globalVariables.isEnterProductViewAbstract = false
                        withAnimation(.smooth(duration: 0.38)) {
                            selectProductView = nil
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        isShowSheet = true
                        print(progresses[selectProductView!.id - 1].members.count)

                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundColor(.black.opacity(0.5))
                            .scaleEffect(1.5)
                    }
                }
                .padding(.horizontal ,geometry.size.width * 0.04)
                .padding(.vertical ,geometry.size.height * 0.04)
            }
            .zIndex(3.0)
            
            //            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            //                .fill(selectProductView!.cardColor)
            cardBackgroundView(cornerRadius: 20, productView: selectProductView!)
                .zIndex(1.0)
            //                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            selectProductView?.renderActiveView()
                .background(colorScheme == .light ? Color.white : Color.black)
                .drawingGroup(opaque: true)
                .blendMode(colorScheme == .light ? .multiply : .difference)
                .zIndex(2.0)
                .matchedGeometryEffect(id: selectProductView!.id, in: cardNS)
                .edgesIgnoringSafeArea(.all)
            
            
        }
        .sheet(isPresented: $isShowSheet) {
            IngredientSheetView(isEnter: $isShowSheet, cosmetics: Array(progresses[selectProductView!.id - 1].members as! Set<CosmeticCoreDataModel>))
        }
    }
    
    func cardBackgroundView(cornerRadius: CGFloat, productView: ProductViewAbstract) -> some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
                .fill(LinearGradient(colors: globalVariables.isEnterProductViewAbstract ? [productView.cardColor, productView.cardColor, colorScheme == .light ? .white : .black, colorScheme == .light ? .white : .black] : [productView.cardColor, productView.cardColor, colorScheme == .light ? .white : .black], startPoint: .top, endPoint: .bottom))
                .zIndex(1.0)
            //                .edgesIgnoringSafeArea(.all)
            
            // 描边
            if !globalVariables.isEnterProductViewAbstract {
                RoundedRectangle(cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .fill(LinearGradient(colors: colorScheme == .light ? [Color.black, Color.white] : [Color.white, Color.black], startPoint: .bottom, endPoint: .topLeading))
                    .zIndex(2.0)
            }
            
            HStack {
                if(!globalVariables.isEnterProductViewAbstract) {
                    VStack() {
                        
                        Text(productView.label!.text)
//                            .font(isCompact ? .title : .largeTitle.weight(.semibold))
                            .font(isCompact ? .title : .system(size: 32, weight: .regular, design: .serif))

                        //                        .font(.system(size: 48, weight: .bold, design: .serif))
                            .foregroundStyle(.black)
                            .padding(.bottom, globalVariables.isPortrait ? 30 : 20)
                            .minimumScaleFactor(0.01)
                            .padding()
                        
                        Spacer()
                        
                    }
                }
                
                Spacer()
                
                if(globalVariables.isEnterProductViewAbstract) {
                    VStack(spacing: 0) {
                        Spacer()
                        
                        Text(productView.label!.text)
                            .font(isCompact ? .title : .system(size: 48, weight: .bold, design: .serif))
//                            .font(.system(size: 48, weight: .bold, design: .serif))
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                            .padding(.bottom, globalVariables.isPortrait ? 30 : 20)
                            .minimumScaleFactor(0.01)
                        
                    }
                }
                VStack(spacing: 0) {
                    Spacer()
                    Text("vol")
                        .font(.title3)
                        .foregroundStyle(.primary)
                    Rectangle()
                        .fill(.primary)
                        .frame(width: 20, height: 1)
                    Text(productView.id.description)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                        .font(.system(size: 36, weight: .semibold, design: .serif))
                }
                .padding()
            }
            .zIndex(3.0)
            
        }
        .matchedGeometryEffect(id: productView.id * 10, in: cardNS)

    }
}

