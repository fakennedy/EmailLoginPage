//
//  CameraPage.swift
//  Email Login Page
//
//  Created by Izzie Watts on 18/08/2021.
//

import SwiftUI
import AVFoundation

struct CameraPage: View {
    var body: some View {
        CameraView()
    }
}

struct CameraPage_Previews: PreviewProvider {
    static var previews: some View {
        CameraPage()
    }
}

struct CameraView: View{
    @StateObject var camera = CameraModel()
    
    var body: some View{
        ZStack{
            
            //Preview for camera
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                
                if camera.isTaken{
                    HStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    //if taken show save
                    if camera.isTaken{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical,10)
                                .padding(.horizontal,20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.leading)
                       
                        Spacer()
                    }else{
                        Button(action: {camera.isTaken.toggle()}, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                }
                .frame(height: 75)
            }
        }
        .onAppear(perform: {
            camera.check()
        })
    }
}

class CameraModel: ObservableObject{
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    //Capturing photo data
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview :AVCaptureVideoPreviewLayer!
    
    
    func check(){
        //check permission
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            setup()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video){ (status) in
                if status{
                    self.setup()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setup(){
        //setting up camera
        do{
            //setting config
            self.session.beginConfiguration()
            //Change for your own
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            //checking and adding to session
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            //Same for output
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}


//setting up preview
struct CameraPreview{
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) -> UIView{
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        //your own properties
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context){
        
    }
}

//https://www.youtube.com/watch?v=8hvaniprctk
//Forgot to look at the time 
