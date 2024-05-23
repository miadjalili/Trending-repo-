//
//  RepositorieView.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import SwiftUI

struct RepositorieView: View {
    
    @ObservedObject var viewModel: RepositoriesViewModel = RepositoriesViewModel()
    @State private var showErrorView = false
    @State var showBanner: Bool = false
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(
        title: "Data Loaded from Offline Storage",
        detail: "The app is currently operating in offline mode. All data displayed is retrieved from the local database. Please connect to the internet for the latest updates.",
        type: .Error
    )
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    LoadingListView()
                } else if showErrorView {
                    LoadingWithError(retryAction: {
                        Task {
                            showErrorView = false
                            showBanner = false
                            await viewModel.getRepositories()
                        }
                    }) {
                        showErrorView = false
                        bannerData.type = .Error
                        showBanner = true
                    }
                } else {
                    RepositoryListView(repositories: viewModel.Repositories)
                        .refreshable {
                            showErrorView = false
                            showBanner = false
                            Task {
                                await viewModel.getRepositories()
                            }
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape")
                        .frame(width: 35, height: 35)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Trending")
            .navigationBarTitleDisplayMode(.inline)
        }
        .banner(data: $bannerData, show: $showBanner)
        .onChange(of: viewModel.hasError) { hasError in
            if hasError {
                showErrorView = true
            }
        }
        .task {
            await viewModel.getRepositories()
        }
    }
}

struct LoadingListView: View {
    var body: some View {
        List {
            Section {
                ForEach(1...9, id: \.self) { _ in
                    RepositorieTrendCell()
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                        .redactShimmer(condition: true)
                }
            }
            .listRowBackground(Color.clear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 65)
        .scrollContentBackground(.hidden)
    }
}

struct RepositoryListView: View {
    var repositories: [RepositorieModel]

    var body: some View {
        List {
            Section {
                ForEach(repositories, id: \.self) { repository in
                    RepositorieTrendCell(
                        imageName: repository.owner?.avatarURL ?? "",
                        title: repository.name,
                        libraryName: repository.fullName,
                        desc: repository.description ?? ""
                    )
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                }
            }
            .listRowBackground(Color.clear)
        }
        .frame(maxWidth: .infinity)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    RepositorieView()
}
