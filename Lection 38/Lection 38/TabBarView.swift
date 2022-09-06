import SwiftUI

struct TabBarView: View {
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView{
            TabView(selection: $selection) {
                FirstView()
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("FirstView")
                        }
                    }.tag(0)
                SecondView()
                    .tabItem {
                        VStack {
                            Image(systemName: "star")
                            Text("SecondView")
                        }
                    }.tag(1)
                ThirdScreen()
                    .tabItem {
                        VStack {
                            Image(systemName: "list.dash")
                            Text("ThirdView")
                        }
                    }.tag(2)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
