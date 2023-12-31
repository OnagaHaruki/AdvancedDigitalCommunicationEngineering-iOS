import SwiftUI

struct CharacterInfoView: View {
    @State private var appearAnimation = false
    var characterInfo: CharacterInfo
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Spacer()
                    Text(characterInfo.comment)
                        .font(.system(size: 23))
                        .bold()
                        .offset(x: -50, y: 0)
                }
                .foregroundColor(Color(hexString: characterInfo.fontColor))
                .frame(width: 500, height: 200)
                .background(Color(hexString: characterInfo.backgroundColor))
                .rotationEffect(Angle(degrees: 20))
                // アニメーションのための初期位置
                .offset(x: self.appearAnimation ? 0 : -3*geometry.size.width,
                        y: self.appearAnimation ? 0 : -geometry.size.height)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.appearAnimation = true
                    }
                }
                .position(x: geometry.size.width/2, y: geometry.size.height-20)

                HStack {
                    Text(characterInfo.role)
                    .bold()
                    .offset(x: 60, y: 0)
                    Spacer()
                }
                .foregroundColor(Color(hexString: characterInfo.fontColor))
                .frame(width: 500, height: 75)
                .background(Color(hexString: characterInfo.backgroundColor))
                .rotationEffect(Angle(degrees: -20))
                // アニメーションのための初期位置
                .offset(x: self.appearAnimation ? 0 : 3*geometry.size.width,
                        y: self.appearAnimation ? 0 : -geometry.size.height)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.appearAnimation = true
                    }
                }
                .position(x: geometry.size.width/2, y: geometry.size.height-130)

                AsyncImageView(url: characterInfo.imageURL)

                HStack {
                    Spacer()
                    VStack {
                        Text(characterInfo.school)
                        Text(characterInfo.grade)
                    }
                    .bold()
                    .offset(x: -60, y: 0)
                }
                .foregroundColor(Color(hexString: characterInfo.fontColor))
                .frame(width: 500, height: 75)
                .background(Color(hexString: characterInfo.backgroundColor))
                .rotationEffect(Angle(degrees: 15))
                // アニメーションのための初期位置
                .offset(x: self.appearAnimation ? 0 : -3*geometry.size.width,
                        y: self.appearAnimation ? 0 : -geometry.size.height)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.appearAnimation = true
                    }
                }
                .position(x: geometry.size.width/2, y: 180)

                VStack {
                    Text(characterInfo.name)
                        .font(.system(size: 70))
                        .bold()
                    Text("CV: " + characterInfo.voice)
                        .bold()
                }
                .foregroundColor(Color(hexString: characterInfo.fontColor))
                .frame(width: 1000, height: 130)
                .background(Color(hexString: characterInfo.backgroundColor))
                .rotationEffect(Angle(degrees: -15))
                // アニメーションのための初期位置
                .offset(x: self.appearAnimation ? 0 : 3*geometry.size.width,
                        y: self.appearAnimation ? 0 : -geometry.size.height)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.appearAnimation = true
                    }
                }
                .position(x: geometry.size.width/2, y: 145)
            }
            .ignoresSafeArea(edges: [.top])
        }
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var characterInfo = CharacterInfo(name: "後藤 ひとり",
                                             school: "秀華高校",
                                             grade: "1年生",
                                             role: "作詞\nリードギター",
                                             voice: "青山吉能",
                                             comment: "絶対いやだ！\n働きたくない！！\n怖い！\n社会が怖い！！",
                                             imageURL: URL(string: "http://\(PlistAccessor.serverIpAddress):8000/static/guiter_hero.jpg")!
    )
    static var previews: some View {
        CharacterInfoView(characterInfo: characterInfo)
    }
}
