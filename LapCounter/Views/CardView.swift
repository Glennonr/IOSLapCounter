////
////  CardView.swift
////  LapCounter
////
////  Created by Richie Glennon on 6/22/22.
////
//
//import SwiftUI
//
//struct CardView: View {
//    var runner: Runner
//    @State private var backgroundColor: Color = .white
//    @State private var data = Runner.Data()
//    var body: some View {
//        HStack {
//            Text(runner.name)
//            Spacer()
//            HStack {
//                Text("\(runner.team)")
//                Spacer()
//                HStack{
//                    Text("Laps to Go:")
//                    Text(String(format: "%.1f", data.lapsToGo))
//                    Button(action: {
//                        if data.lapsToGo > 0 {
//                            data.lapsToGo = data.lapsToGo - 1
//                        }
//                        if data.lapsToGo == 0 {
//                            backgroundColor = .green
//                        }
//                    }){
//                        Image(systemName: "return")
//                    }
//                    .padding(.all, 4.0)
//                    .background(.green)
//                    .foregroundColor(.black)
//                    .cornerRadius(4)
//                    
//                }
//                
//            }
//            .font(.caption)
//        }
//        .padding()
//        .background(backgroundColor)
//    }
//}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let runner = Runner.sampleData[0]
//        CardView(runner: runner)
////            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
