//
//  ContentView.swift
//  ToDo App
//
//  Created by Nika Jamatashvili on 08.12.23.
//

import SwiftUI

struct CustomColors {
    static let pink = Color(hex: 0xBA83DE)
    static let darkPink = Color(hex: 0xBA83DE, alpha: 0.69)
    static let background = Color(hex: 0x020206)
    static let darkGrey = Color(hex: 0x1F1F1F)
    static let silver = Color(hex: 0xFFFFFF, alpha: 0.8)
    static let zero = Color(hex: 0xFFFFFF, alpha: 0.0)
}
struct PastelColors {
    static let yellow = Color(hex: 0xFACBBA)
    static let sky = Color(hex: 0xD7F0FF)
    static let rose = Color(hex: 0xFAD9FF)
}

extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct ToDoTask: Identifiable {
    let id: UUID
    let title: String
    let dueDate: String
    var isCompleted: Bool = false
    var color: Color
}

struct ToDoListView: View {
    @State var tasks: [ToDoTask] = [
        ToDoTask(id: UUID(), title: "Mobile App Research", dueDate: "6 Oct", color: PastelColors.yellow),
        ToDoTask(id: UUID(), title: "Prepare Wireframes", dueDate: "8 Oct", color: PastelColors.rose),
        ToDoTask(id: UUID(), title: "Create Prototype", dueDate: "10 Oct", color: PastelColors.sky),
        ToDoTask(id: UUID(), title: "Design UI Elements", dueDate: "12 Oct", color: PastelColors.yellow),
        ToDoTask(id: UUID(), title: "Implement Backend", dueDate: "14 Oct", color: PastelColors.rose),
        ToDoTask(id: UUID(), title: "Testing Phase", dueDate: "16 Oct", color: PastelColors.sky)
    ]
    @State var completedTasks: [ToDoTask] = []
    
    var incompleteTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    var progressWidth: CGFloat {
        CGFloat(100) / CGFloat(tasks.count) * CGFloat(tasks.count - incompleteTasksCount)
    }
    
    var body: some View {
        ZStack {
            CustomColors.background.opacity(1).edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack (spacing: 24){
                    HStack {
                        Text("You have \(incompleteTasksCount) tasks to complete")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .frame(width: 200)
                            .offset(x: -12)
                        
                        Spacer()
                        ZStack {
                            Image("avatar00")
                                .frame(width: 44, height: 44)
                            
                            Spacer()
                            Text("\(incompleteTasksCount)")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 16, y: 16)
                        }
                    }
                    
                    Button(action: {
                        completeAllTasks()
                    }) {
                        Text("Complete all")
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [CustomColors.pink, CustomColors.darkPink]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(8)
                    }
                }
                .padding(.vertical, 16)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Daily Task")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                        Text("\(incompleteTasksCount) / \(tasks.count) Task Completed")
                            .foregroundColor(CustomColors.silver)
                            .font(.title3)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Keep  working")
                                    .foregroundColor(CustomColors.silver)
                            }
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(CustomColors.darkPink)
                                        .frame(height: 16)
                                        .cornerRadius(12)
                                    
                                    Rectangle()
                                        .fill(CustomColors.pink)
                                        .frame(height: 16)
                                        .frame(width: geometry.size.width / CGFloat(tasks.count) * CGFloat(tasks.count - incompleteTasksCount))
                                        .cornerRadius(12)
                                }
                            }
                            .frame(height: 16)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .background(CustomColors.darkGrey)
                    .cornerRadius(12)
                    
                }
                .foregroundColor(.white)

                List {
                    Section(header: Text("Completed Tasks")
                        .foregroundColor(CustomColors.silver)
                        .font(.headline)
                        .padding(.top)) {
                            ForEach(tasks.filter { $0.isCompleted }) { task in
                                toDoRow(for: task)
                                    .onTapGesture {
                                        toggleCompleteStatus(for: task)
                                    }
                                    .listRowInsets(EdgeInsets())
                            }
                            .listRowBackground(CustomColors.zero)
                            .listRowSeparatorTint(CustomColors.background)
                        }
                    
                    Section(header: Text("To Do Tasks")
                        .foregroundColor(CustomColors.silver)
                        .font(.headline)
                        .padding(.top)) {
                            ForEach(tasks.filter { !$0.isCompleted }) { task in
                                toDoRow(for: task)
                                    .onTapGesture {
                                        toggleCompleteStatus(for: task)
                                    }
                                    .listRowInsets(EdgeInsets())
                            }
                            .listRowBackground(CustomColors.zero)
                            .listRowSeparatorTint(CustomColors.background)
                        }
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private func toDoRow(for task: ToDoTask) -> some View {
        HStack {
            
            HStack {
                Rectangle()
                    .fill(task.color)
                    .frame(width: 16)
                    .offset(x: 0)
                
                VStack(alignment: .leading, spacing: 8) {
                    Spacer().frame(height: 8)
                    Text(task.title)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(CustomColors.silver)
                        Text(task.dueDate)
                            .font(.subheadline)
                            .foregroundColor(CustomColors.silver)
                    }
                    Spacer().frame(height: 8)
                }
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                
                if task.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(CustomColors.pink)
                    Spacer().frame(width: 12)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(CustomColors.pink)
                    Spacer().frame(width: 12)
                }
            }
            .cornerRadius(12)
            .background(CustomColors.darkGrey.cornerRadius(12))
            .frame(maxWidth: .infinity)
            
        }
        .padding(.vertical, 6)
    }
    
    private func toggleCompleteStatus(for task: ToDoTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func completeAllTasks() {
        let notCompleted = tasks.filter { !$0.isCompleted }
        for task in notCompleted {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].isCompleted = true
                completedTasks.append(tasks[index])
            }
        }
        tasks.removeAll(where: { !$0.isCompleted })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
