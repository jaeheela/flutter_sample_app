import 'package:flutter/foundation.dart';
import '../models/catalog.dart';

/// CartModel(개별 상태 클래스)
/// => 상태값 (_로 시작하는 private 프로퍼티)
/// => 상태값 getter (변수명 앞에 get 붙음)
/// => 상태 변경 함수 (반드시 notifyListeners()를 호출)

/// ChangeNotifier 클래스
/// => 구독자에게 변경 알림을 제공( 무언가가 ChangeNotifier에 속하면 변경사항 알릴 수 있음)
/// => ChangeNotifier에서 카트의 상태 관리를 담당
/// => 앱의 UI의 변경과 관련된 모델 변경이 일어날 때 : notifyListeners() 호출
/// => CartModel 클래스 내의 다른 코드들은 모델 그 자체와 비지니스 로직임

class CartModel extends ChangeNotifier {

  /// _catalog
  /// => CatalogModel 타입의 변수
  /// => 카탈로그 정보를 나타냄
  late CatalogModel _catalog;

  /// _itemIds
  /// => 카트에 담긴 아이템의 고유 식별자 목록을 나타내는 리스트
  final List<int> _itemIds = [];

  /// getter 메서드
  /// => _catalog 변수에 접근함, 외부에서 현재 카탈로그에 접근할 수 있게함
  CatalogModel get catalog => _catalog;
  
  /// setter 메서드
  /// => _catalog 변수를 설정, 외부에서 새로운 카탈로그를 설정할 수 있음
  /// => 새로운 카탈로그가 제공하는 정보가 이전과 다를 경우, 리스너에게 변경을 알리고 리빌드가 필요함을 알림
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  /// getter 메서드
  /// => 현재 카트에 담긴 모든 아이템의 총 가격을 계산함
  /// => fold 함수를 사용하여 각 아이템의 가격을 합산함
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// getter 메서드
  /// => _itemIds에 있는 각 아이템의 고유 식별자를 사용하여 실제 아이템 객체를 얻어옴
  /// => 이를 통해 카트에 담긴 아이템 목록을 얻을 수 있음
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// 카트에 아이템을 추가하는 메서드
  /// => 각각 _itemIds에 아이템의 고유 식별자를 추가하고,
  /// => 변경 사항을 리스너에게 알리는 역할
  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();/// 모델이 변경되었음을 리스너에게 알리고, 해당하는 위젯이 리빌드되도록 함
  }

  /// 카트에 아이템을 제거하는 메서드
  /// => 각각 _itemIds에 아이템의 고유 식별자를 제거하고,
  /// => 변경 사항을 리스너에게 알리는 역할
  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();/// 모델이 변경되었음을 리스너에게 알리고, 해당하는 위젯이 리빌드되도록 함
  }
}
