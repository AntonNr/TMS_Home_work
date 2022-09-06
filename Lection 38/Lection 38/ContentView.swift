import SwiftUI

struct ContentView: View {
    
    var landmark: Landmark
    
    var body: some View {
            ScrollView {
                CircleImage(image: landmark.image)
                VStack {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        Spacer()
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text(landmark.description)
                }.padding()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        ContentView(landmark: landmarks[0])
    }
}
