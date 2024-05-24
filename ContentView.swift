import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    
    @State var isChangeColorMode: Bool = false
    
    @State var isShowSheet = false
    @State var isShowFacePage = false
    
    @State private var topPadding: CGFloat = 50.0
    @State private var verticalPadding: CGFloat = 0
    @State private var horizontalPadding: CGFloat = 0
    @State private var topPaddingTitle: CGFloat = 10
    
    private let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
        
    var body: some View {
        ZStack {
            if !globalVariables.isFirstLaunch {
                Rectangle()
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)         .modifier(ColorInvert())
                    .zIndex(9.0)
                
                IntroView()

                    .zIndex(10.0)

            }
            
            ZStack(alignment: .top) {
                HStack {
                    Text("Born with Skin")
                        .font(.system(size: 36, weight: .bold, design: .serif))
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        globalVariables.currentMode = colorScheme == .light ? .dark : .light
                        isChangeColorMode.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isChangeColorMode.toggle()

                        }

                    } label: {
                        Image(systemName: colorScheme == .light ? "moon.stars.fill" : "sun.max")
                            .foregroundStyle(Color.primary)
                            .scaleEffect(1.5)
                    }
                    .padding()
                    
                    Button {
                        isShowFacePage = true
                    } label: {
                        Image(systemName: "face.smiling.inverse")
                            .foregroundStyle(Color.primary)
                            .scaleEffect(1.5)
                    }
                    .padding()
                    
                    Button {
                        isShowSheet = true
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundStyle(Color.primary)
                            .scaleEffect(1.5)
                    }
                    .padding()
                }
                .padding(.top, topPaddingTitle * 0.5)
                .padding(.horizontal, topPaddingTitle)
                
                .zIndex(1.0)
                
 
                
                HStack(spacing: -20) {
                    if !globalVariables.isPortrait && !globalVariables.isEnterProductViewAbstract {
                        PersonView()
                            .scaleEffect(0.8)
                            .padding(.top, horizontalSizeClass == .regular ? 0 : 50)
                            .padding(.leading, horizontalSizeClass == .regular ? -170 : -50)
                        

                    }
                    
                    ZStack {
                        IllustrationScrollView()
                            .padding(.top, topPadding)
                            .padding(.vertical, verticalPadding)
                            .padding(.horizontal, horizontalPadding)
                        if !globalVariables.isEnterProductViewAbstract && !globalVariables.isPortrait {
                            
                            LinearGradient(colors: [colorScheme == .light ? Color.white : Color.black, .clear, .clear, .clear, .clear, .clear], startPoint: .leading, endPoint: .trailing)
                                .allowsHitTesting(false)
                                .padding(.leading, -20)
                            
//                                        if !globalVariables.isPortrait && !globalVariables.isEnterProductViewAbstract {
//                                            VStack {
//                                                Spacer()
//                            
//                                                //                HStack{
//                                                if colorScheme == .light {
//                                                    HandView()
//                                                        .scaleEffect(0.75)
//                                                        .allowsTightening(false)
//                                                        .padding(.top, horizontalSizeClass == .regular ? 500 : 50)
//                                                        .padding(.leading, horizontalSizeClass == .regular ? -600 : -50)
//                                                        .colorInvert()
//                                                } else {
//                                                    HandView()
//                                                        .scaleEffect(0.75)
//                                                        .allowsTightening(false)
//                                                        .padding(.top, horizontalSizeClass == .regular ? 500 : 50)
//                                                        .padding(.leading, horizontalSizeClass == .regular ? -600 : -50)
//                                                }
//                                            }
//                                            .zIndex(10.0)
//                                        }
                        }
                    }
                }
                .zIndex(2.0)
                
                
                if isShowSheet {
                    SearchSumView(isEnter: $isShowSheet)
                        .zIndex(3.0)
                }
            }
            .sheet(isPresented: $isShowFacePage) {
                VStack(alignment: .leading) {
                    Button {
                        isShowFacePage = false
                    } label: {
                        Text("Close")
                            .bold()
                            .foregroundStyle(.secondary)
                            .padding()
                    }
                    InquiryFaceView()
                        .padding()
                }
                
            }
            .zIndex(1.0)
        }
        .onReceive(globalVariables.$isPortrait, perform: { _ in
            // MARK: Restore PAD
            if UIDevice.current.userInterfaceIdiom == .pad {
                print(">>><<< BACK")
                topPaddingTitle = 30

                if globalVariables.isEnterProductViewAbstract {
                    
                }
                else {
                    self.topPadding = 80
                    setEnterCardPad(isWhichProcess: !globalVariables.isPortrait)
                    setNotEnterCardPad()
                }
                
            }
            // MARK: Restore PHONE
            else if UIDevice.current.userInterfaceIdiom == .phone {
                print(">>><<< BACK")
                
                if globalVariables.isEnterProductViewAbstract {
                    
                }
                else {
                    self.topPadding = 90
                    setEnterCardPhone(isWhichProcess: !globalVariables.isPortrait)
                    setNotEnterCardPhone()
                }
            }
        })
        
        
        .onReceive(globalVariables.$isEnterProductViewAbstract, perform: { heading in
            // MARK: PAD
            if UIDevice.current.userInterfaceIdiom == .pad {
                if globalVariables.isEnterProductViewAbstract {
//                    self.topPadding = globalVariables.isEnterProductViewAbstract ? -50 : 80
                    self.topPadding = 0
                    setEnterCardPad(isWhichProcess: globalVariables.isPortrait)
                } else {
                    self.topPadding = 80
                    setNotEnterCardPad()
                }
            }
            // MARK: PHONE
            else if UIDevice.current.userInterfaceIdiom == .phone {
                print(">>> PHONE")
                
                if globalVariables.isEnterProductViewAbstract {
                    print(">>> Enter PHONE Card")
                    self.topPadding = 0
                        setEnterCardPhone(isWhichProcess: globalVariables.isPortrait)
                } else {
                    print(">>> Not Enter PHONE Card")
                    self.topPadding = 90
                    setNotEnterCardPhone()
                }
            }
        })
        .onReceive(globalVariables.$isFirstLaunch) { _ in
            print("www")
        }
        .preferredColorScheme(isChangeColorMode ? globalVariables.currentMode : colorScheme)
    }
    
    func setEnterCardPad(isWhichProcess: Bool) {
        if isWhichProcess {
            print(">>> Enter Portrait")
            self.horizontalPadding = 0
        } else {
            print(">>> Enter Landscape")
            self.verticalPadding = 0
        }
    }
    
    func setNotEnterCardPad() {
        if globalVariables.isPortrait {
            print(">>> Not enter - Portrait")
            self.horizontalPadding = 200
        } else {
            print(">>> Not enter - Landscape")
            self.verticalPadding = 100
        }
    }
    
    func setEnterCardPhone(isWhichProcess: Bool) {
        if isWhichProcess {
            print(">>> Enter Portrait")
            self.horizontalPadding = 0
        } else {
            print(">>> Enter Landscape")
            self.verticalPadding = 0
        }
    }
    
    func setNotEnterCardPhone() {
        if globalVariables.isPortrait {
            print(">>> Not enter - Portrait")
            self.horizontalPadding = 20
        } else {
            print(">>> Not enter - Landscape")
            self.verticalPadding = 0
        }
    }
}
