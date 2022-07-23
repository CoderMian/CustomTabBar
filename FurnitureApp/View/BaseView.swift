//
//  BaseView.swift
//  FurnitureApp
//
//  Created by devsaar on 28/06/2022.
//

import SwiftUI

struct BaseView: View {
    @State var  currentTab = "home"
    //hiding native tab bar
    init ()
    {
        UITabBar.appearance().isHidden = true
        
    }
    // Curve Axis Value....
    @State var curveAxis:CGFloat = 0
    var body: some View {
        VStack(spacing:0)
        {
            TabView(selection:$currentTab)
            {
               Home()
                    .tag("house.fill")
                Text("Search")
                    .tag("magnifyingglass")
                Text("Account")
                    .tag("person.fill")
            }.clipShape(
                CustomTabCurve(curveAxis:curveAxis)
            ).padding(.bottom,-90)
            HStack(spacing:0)
            {
                //tab view buttons
                TabButtons()
            }.frame(height:50)
                .padding(.horizontal,35)
        }.background(Color("TabColor"))
            .ignoresSafeArea(.container,edges:.top)
    }
    
    //tab button displayer function
    @ViewBuilder
    func TabButtons()-> some View
    {
        ForEach(["home","Bell","Settings","user"],id:\.self)
        {image in
            GeometryReader{proxy in
                //since we need current position for curve..
                Button
                {
                    withAnimation
                    {
                        currentTab = image
                        //updating curve axis
                        curveAxis = proxy.frame(in:.global).midX
                    }
                }label:
                {
                    Image(image)
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 45, height: 45)
                        .background(
                            
                            Circle()
                                .fill(Color("TabColor"))
                        ).offset(y: currentTab == image ? -25 : 0)
                }
                .frame(maxWidth:.infinity, alignment:.center)
                //intial update
                .onAppear()
                {
                    if curveAxis == 0 && image == "home"
                    {
                        curveAxis = proxy.frame(in:.global).midX

                    }
                }
            }
            .frame(height:40)
        }
    }
    //displayer function end
}
struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
