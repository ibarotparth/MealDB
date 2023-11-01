//
//  DessertListViewController.swift
//  MealDB
//
//  Created by csuftitan on 10/26/23.
//

import UIKit

class DessertListViewController: UIViewController {

    @IBOutlet weak var dessertCollectionView: UICollectionView!
    private var viewModel = DessertViewModel(apiManager: APIManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dessertCollectionView.register(UINib(nibName: "DessertCell", bundle: nil), forCellWithReuseIdentifier: "DessertCell")
        configuration()
        // Do any additional setup after loading the view.
    }
    
}

extension DessertListViewController {
    
    func configuration() {
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchDesserts()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                /// indicator show
                print("Desserts Loading...")
            case .stopLoading:
                // indicator hide
                print("Stop Loading...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    self.dessertCollectionView.reloadData()
                }
            case .error(let error):
                print(error)
            }
            
        }
    }
}

// MARK: - CollectionView Delegates

extension DessertListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "DessertCell",
            for: indexPath) as? DessertCell else {
            return UICollectionViewCell()
        }
        let meal = viewModel.meals[indexPath.row]
        cell.meal = meal
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row >= 0 && indexPath.row < viewModel.meals.count else {
            return
        }
        
        let meal = viewModel.meals[indexPath.row]
    
        if let detailViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MealDetailViewController") as? MealDetailViewController  {
            detailViewController.mealId = meal.idMeal
            self.navigationController?.pushViewController(detailViewController,animated:true)
        }
    }
}
