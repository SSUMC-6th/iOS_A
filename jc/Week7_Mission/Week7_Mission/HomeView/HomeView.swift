//
//  HomeView.swift
//  Week7_Mission
//
//  Created by Jiwoong CHOI on 5/20/24.
//

import SwiftUI

struct HomeView: View {
  @Environment(\.colorScheme) var colorScheme
  let randomIndex = Int.random(in: 0 ..< 10)

  let dataLists1 = [
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Test1", location: "TestLocation1", uploadDate: "TestTime1", price: 100,
      image: Image("jc")),
  ]
  
  let dataLists2 = [
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc")),
    DataType(
      title: "Sample1", location: "Sample1", uploadDate: "SampleTime1", price: 100,
      image: Image("jc"))
  ]

  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        VStack {
          ForEach(0 ..< dataLists1.count) { index in
            if index == randomIndex {
              ScrollView(.horizontal) {
                HStack {
                  ForEach(0 ..< dataLists2.count) { index in
                    HStack(alignment: .top) {
                      dataLists2[index].image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)

                      VStack(alignment: .leading) {
                        Text(dataLists2[index].title)
                        Text("\(dataLists2[index].location) • \(dataLists2[index].uploadDate)")
                      }
                    }
                  }
                }
                .padding([.leading, .trailing], 20)
              }
            } else {
              HStack(alignment: .top) {
                dataLists1[index].image
                  .resizable()
                  .scaledToFit()
                  .frame(width: 150)

                VStack(alignment: .leading) {
                  Text(dataLists1[index].title)
                  Text("\(dataLists1[index].location) • \(dataLists1[index].uploadDate)")
                }
              }
            }
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            debugPrint("This is changing location button")
          } label: {
            Text("숭실대")
          }
        }

        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            debugPrint("This is list button")
          } label: {
            Image(systemName: "list.bullet")
          }

          Button {
            debugPrint("This is magnifying glass")
          } label: {
            Image(systemName: "magnifyingglass")
          }

          Button {
            debugPrint("This is bell")
          } label: {
            Image(systemName: "bell")
          }
        }
      }
      .tint(colorScheme == .dark ? .white : .black)
    }
  }
}

#Preview {
  HomeView()
}
