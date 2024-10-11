//
//  ViewController.swift
//  BTKApp
//
//  Created by semih bekdaş on 3.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    @IBOutlet weak var egitimlerTableView: UITableView!
    
    var imageNames = [String]()
    
    var currentImageIndex = 0
    
    var timer: Timer?
    
    var egitimler = [Egitimler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.layer.borderWidth = 1.0
        searchTextField.layer.cornerRadius = 8.0
        searchTextField.layer.masksToBounds = true
        
        imageNames.append("IOSBanner")
        imageNames.append("banner1")
        imageNames.append("banner2")
        imageNames.append("banner3")
        imageNames.append("banner4")
        imageNames.append("banner5")
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        egitimlerTableView.delegate = self
        egitimlerTableView.dataSource = self
        
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.scrollDirection = .horizontal

        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
        
        let ekranGenislik = UIScreen.main.bounds.width
        
        let itemGenislik = (ekranGenislik-20)
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*0.45)
        print(itemGenislik)
        
        bannerCollectionView.collectionViewLayout = tasarim
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        
        
        
        let e1 = Egitimler(name: "Matematik 101", userCount: 642, imageName: "imagemat")
        let e2 = Egitimler(name: "Twinmotion 2024", userCount: 367, imageName: "imagetwin")
        let e3 = Egitimler(name: "Problem Çözme Teknikleri", userCount: 3208, imageName: "imageproblem")
        let e4 = Egitimler(name: "Sızma Testi", userCount: 2180, imageName: "imagesizma")
        let e5 = Egitimler(name: "Elasticsearch v8", userCount: 848, imageName: "imageelastic")

        egitimler.append(e1)
        egitimler.append(e2)
        egitimler.append(e3)
        egitimler.append(e4)
        egitimler.append(e5)

        



        
        
        
        

        
        
        
    }
    


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @objc func nextImage() {
            currentImageIndex = (currentImageIndex + 1) % imageNames.count
            let indexPath = IndexPath(item: currentImageIndex, section: 0)
            bannerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

        @objc func previousImage() {
            currentImageIndex = (currentImageIndex - 1 + imageNames.count) % imageNames.count
            let indexPath = IndexPath(item: currentImageIndex, section: 0)
            bannerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return imageNames.count
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerHucreler
        let imageName = imageNames[indexPath.row]
        cell.bannerImageView.image = UIImage(named: imageName)
        
        cell.forwardButton.addTarget(self, action: #selector(nextImage), for: .touchUpInside)
        cell.backButton.addTarget(self, action: #selector(previousImage), for: .touchUpInside)
                
        
        return cell
    }
    
    @objc func changeImage() {
           currentImageIndex = (currentImageIndex + 1) % imageNames.count // Index'i sırayla artırıp resim değiştiriyoruz.
           let indexPath = IndexPath(item: currentImageIndex, section: 0)
        bannerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       }
    
    
    
    
    
    
}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return egitimler.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "egitimlerHucre") as! EgitimlerHucre
        
        let egitim = egitimler[indexPath.row]
        
        hucre.dersImage.image = UIImage(named: egitim.imageName!)
        hucre.dersLabel.text = egitim.name!
        hucre.numberLabel.text = "\(egitim.userCount!)"
        
        
        
        return hucre
    }
    
}
