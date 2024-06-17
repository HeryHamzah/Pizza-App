//
//  PizzaScreen.swift
//  pizza
//
//  Created by MD-HeryHamzah on 09/04/24.
//

import SwiftUI

struct PizzaScreen: View {
    
    @State var pizzaViewModel = PizzaViewModel()
    @State var dragOffset: CGFloat = 0
    @State var rotationEffect: CGFloat = 0
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                //TITLE
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(pizzaViewModel.currentPizza.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(pizzaViewModel.currentPizza.desc)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
                    .padding(.trailing, 20)
                    
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    
                    Spacer()
                }
                .padding()
                
                Spacer().frame(height: 30)
                
                Image("pizza-plate")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(rotationEffect))
                    .shadow(color: .red.opacity(0.5), radius: 15, y: 20)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        Image("bassil (6)")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .position(x: 320, y: 30)
                        
                        Image("bassil (6)")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .position(x: 100)
                        
                        Image("bassil (7)")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .position(x: 60, y: 40)
                        
                        Image("bassil (1)")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .position(x: 35, y: 190)
                        
                        Image("bassil (4)")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .position(x: 60, y: 260)
                        
                        Image("bassil (2)")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .position(x: 320, y: 270)
                        
                        Image("bassil (5)")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .position(x: 360, y: 280)
                        
                        Image("bassil (3)")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .position(x: 370, y: 110)
                        
                        CustomClip()
                            .fill(Color.white)
                            .frame(width: 170, height: 30)
                            .position(x: 200, y: 300)
                        
                        GeometryReader { geo in
                            TabView(selection: $pizzaViewModel.currentPage) {
                                ForEach(pizzaList.indices, id: \.self) { index in
                                    
                                    ZStack {
                                        Image(pizzaList[index].image)
                                            .resizable()
                                            .rotationEffect(.degrees(-rotationEffect))
                                        
                                        ForEach(pizzaViewModel.selectedToppings) {
                                            topping in
                                            
                                            ForEach(0..<10) { i in
                                                Image(topping.onPizza)
                                                    .resizable()
                                                    .frame(width: topping.size, height: topping.size)
                                                
                                                    .position(x: topping.positions[i].x, y: topping.positions[i].y)
                                                    .transition(pizzaViewModel.transitions.randomElement() ?? pizzaViewModel.transitions.first!)
                                            }
                                            
                                            
                                        }
                                    }
                                    .frame(width: pizzaViewModel.selectedSize.size, height: pizzaViewModel.selectedSize.size)
                                    
                                    
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .onChange(of: pizzaViewModel.currentPage, { oldValue , newValue in
                                
                                withAnimation {
                                    pizzaViewModel.currentPage = newValue
                                    pizzaViewModel.currentPizza = pizzaList[pizzaViewModel.currentPage]
                                    
                                }
                                
                                withAnimation(.bouncy) {
                                    if oldValue < newValue {
                                        rotationEffect += 45
                                        
                                    } else {
                                        rotationEffect -= 45
                                        
                                    }
                                }
                                
                            })
                        }
                        
                        
                        Image(systemName: "minus")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .position(x: 60, y: 150)
                            .onTapGesture {
                                if pizzaViewModel.total > 1 {
                                    pizzaViewModel.total-=1
                                }
                            }
                        
                        
                        Image(systemName: "plus")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 40, height: 40)
                            .background(.thinMaterial)
                            .clipShape(Circle())
                            .position(x: 340, y: 150)
                            .onTapGesture {
                                pizzaViewModel.total+=1
                            }
                        
                    }
                
                
                
                Spacer().frame(height: 30)
                
                Text("$\(String(format: "%.2f", pizzaViewModel.currentPizza.price[pizzaViewModel.selectedSize.index] * pizzaViewModel.total))")
                    .font(.title)
                    .fontWeight(.semibold)
                    .animation(.linear(duration: 0.2), value: pizzaViewModel.selectedSize)
                    .animation(.linear(duration: 0.2), value: pizzaViewModel.total)
                
                Spacer().frame(height: 30)
                
                HStack(spacing: 25) {
                    ForEach(sizeList, id: \.self) { size in
                        
                        Group {
                            if size != pizzaViewModel.selectedSize {
                                Text(size.name)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .padding()
                            } else {
                                Text(size.name)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .padding()
                                    .background(.yellow)
                                    .clipShape(Circle())
                                    .shadow(color: .yellow.opacity(0.9), radius: 15)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                pizzaViewModel.selectedSize = size
                            }
                            
                            withAnimation {
                                pizzaViewModel.randomToppingPositions()
                            }
                            
                            
                        }
                        
                    }
                }
                .padding(.horizontal, 25)
                .frame(width: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.1), radius: 5)
                .animation(.linear, value: pizzaViewModel.selectedSize)
                
                Spacer().frame(height: 30)
                
                Text("\(pizzaViewModel.selectedToppings.count)/3")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .animation(.linear(duration: 0.2), value: pizzaViewModel.selectedToppings)
                
                Spacer().frame(height: 30)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15){
                        
                        ForEach(toppings) { topping in
                            Image(topping.onList)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .opacity(pizzaViewModel.selectedToppings.contains(topping) ? 0.5 : 1)
                                .padding(.bottom, 20)
                                .onTapGesture {
                                    if pizzaViewModel.selectedToppings.contains(topping) {
                                        withAnimation {
                                            pizzaViewModel.selectedToppings.removeAll {$0 == topping
                                            }
                                        }
                                    } else if pizzaViewModel.selectedToppings.count < 3 {
                                        withAnimation {
                                            pizzaViewModel.addTopping(topping: topping)
                                            
                                        }
                                    }
                                }
                        }
                        
                        
                    }
                }
                .scrollIndicators(.hidden)
                
                Spacer().frame(height: 30)
                
                
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "cart.fill")
                        Text("Add to cart")
                    }
                    .frame(height: 40)
                }
                )
                .tint(.brown)
                .buttonStyle(.borderedProminent)
                
                Spacer().frame(height: 30)
                
                
            }
        }
        
    }
}

struct CustomClip: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: 0), control: CGPoint(x: rect.width / 2, y: rect.height * 2))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: 0), control: CGPoint(x: rect.width / 2, y: 2 * rect.height - (rect.width / 40)))
        path.closeSubpath()
        return path
    }
}

#Preview {
    PizzaScreen()
}
