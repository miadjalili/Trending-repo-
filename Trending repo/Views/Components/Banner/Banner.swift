//
//  Banner.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-05-22.
//

import SwiftUI

struct BannerModifier: ViewModifier {
    
    struct BannerData {
        var title:String
        var detail:String
        var type: BannerType
    }
    
    enum BannerType {
        case Info
        case Warning
        case Success
        case Error
        
        var tintColor: Color {
            switch self {
            case .Info:
                return Color(red: 67/255, green: 154/255, blue: 215/255)
            case .Success:
                return Color.green
            case .Warning:
                return Color.yellow
            case .Error:
                return Color.red
            }
        }
    }
    
    // Members for the Banner
    @Binding var data:BannerData
    @Binding var show:Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title)
                                .bold()
                            Text(data.detail)
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(data.type.tintColor)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.smooth)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation(.easeInOut)
                        {
                            self.show = false
                        }
                    }
                })
            }
        }
    }

}

extension View {
    func banner(data: Binding<BannerModifier.BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello")
        }
    }
}
