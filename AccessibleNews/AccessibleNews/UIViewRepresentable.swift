//
//  UIViewRepresentable.swift
//  AccessibleNews
//
//  Created by Nika Jamatashvili on 28.12.23.
//

import SwiftUI

struct UITableViewRepresentable: View {
    
    // MARK: Properties
    @StateObject var viewModel: NewsViewModel
    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory
    @State var selectedFontSize: CGFloat = 18 // Default font size
    
    // MARK: Body
    var body: some View {
        NavigationView {
            UIList(rows: $viewModel.data, fontSize: $selectedFontSize, sizeCategory: sizeCategory)
                .background(Color.gray.opacity(0.12))
                .onAppear {
                    viewModel.fetchNews()
                }
                .navigationTitle("News") // Set the navigation title here
                .navigationBarItems(
                    trailing: Menu(content: {
                        ForEach([12, 16, 18, 20, 24], id: \.self) { size in
                            Button(action: {
                                selectedFontSize = CGFloat(size)
                            }) {
                                Text("\(size)")
                            }
                        }
                    }) {
                        Image(systemName: "textformat.size")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(8)
                    }
                )
        }
    }
}

#Preview {
    UITableViewRepresentable(viewModel: NewsViewModel())
}

// MARK: Representable
struct UIList: UIViewRepresentable {
    
    @Binding var rows: [News]
    @Binding var fontSize: CGFloat
    var sizeCategory: ContentSizeCategory
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    func makeUIView(context: Context) -> UITableView {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    //MARK: from SwiftUI to UIKit
    func updateUIView(_ uiView: UITableView, context: Context) {
        DispatchQueue.main.async{
            context.coordinator.reloadData()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        private var parent: UIList
        
        init(parent: UIList) {
            self.parent = parent
        }
        
        func reloadData() {
            parent.tableView.reloadData()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.parent.rows.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let newsItem = parent.rows[indexPath.row]
            let articleCellView = ArticleCellView(news: newsItem)
            let hostingController = UIHostingController(rootView: articleCellView)
            let hostedView = hostingController.view!
            
            hostedView.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(hostedView)
            
            NSLayoutConstraint.activate([
                hostedView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                hostedView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                hostedView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
                hostedView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
            ])
            
            return cell
        }
    }
}
