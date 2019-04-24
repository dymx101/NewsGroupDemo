##  Library needed

Network: `AlamoFire`
ImageDownloading: `Kingfisher`
Database: `RealmSwift`
LoadingHUD: `SVProgressHUD`
DI: `Swinject`
AutoLayout: `SnapKit`

## Architecture
MVVM + Coordinator

## Screens
1. Photo List Screen
2. Phto Detail Screen

## MVVM architecture - class design
### Views
1. `PhotoListViewController`
 - photoListView (`UICollectionView`)
 - `PhotoListItemCell`
     * ivPhoto: `UIImageView`
     * viewTitleBg: `UIView`
     * lblTitle: `UILabel`
2. `PhotoDetailViewController`
- ivPhoto: `UIImageView`
- viewTitleBg: `UIView`
- lblTitle: `UILabel`

### View-Models
1. `PhotoListViewModel`
- title: `String` = "Gallery"
- networkManager: `NetworkManager`
- photos: [`Photo`]
- refreshPhotoList()
- getPhotoList()
- savePhotoList(photoList: [`Photo`])
- loadPhotoList(): [`Photo`]
2. `PhotoDetailViewModel`
- title: `String` = "Photo"
- photo: `Photo`

3. `PhotoListItemCellViewModel`
- photo: `Photo`

### Models
1. `Photo`: `Object`, `Codable`
- albumId: `Int?`
- id: `Int?`
- title: `String?`
- url: `String?`
- thumbnailUrl: `String?`

2. `NetworkManager`
- sessionManager
- getPhotoList(completion: `Result<[Photo], Error>`)

3. enum `Endpoint`: `URLRequestConvertible`
case `getPhotoList`
- baseUrl: `String`
- method: `String`

4. `DatabaseManager`
- realm: `Realm`
- savePhoto(_ photo: `Photo`)
- savePhotoList(_ photoList: `[Photo]`)
- loadPhotoList(): [`Photo`]
- removeAllPhotos()

## Coordinator design
- `Coordinator`
- `PhotoListCoordinator`: `Coordinator`
- `PhotoDetailCoordinator`: `Coordinator`

## Unit Test
- PhotoListViewModelTests
- PhotoDetailViewModelTests
- PhotoListItemCellViewModelTests
- PhotoTests
- NetworkManagerTests
- EndpointTests
- DatabaseManagerTests

## UI Test
- Click the first cell in the photo list screen
- should goes to photo detail screen
