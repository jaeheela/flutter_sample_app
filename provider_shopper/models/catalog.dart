import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

/// 불변 클래스
/// => 인스턴스 생성 후에는 수정할 수 없으며,
/// => 이는 코드의 안정성을 높이고 예측 가능한 동작을 유지하는 데 도움
/// 불변 클래스의 장점
/// => 안정성 및 예측 가능성: 불변 객체는 생성 후에 수정할 수 없습니다. 이는 프로그램의 상태를 예측 가능하게 만들어 버그를 줄이고 코드의 안정성을 향상시킵니다.
/// => 쓰레드 안전성: 불변 객체는 여러 스레드에서 안전하게 공유될 수 있습니다. 한 번 생성된 객체를 여러 곳에서 참조하더라도 내부 상태가 변경되지 않기 때문에 동기화 문제를 피할 수 있습니다.
/// => 동등성 비교 용이성: 불변 클래스는 보통 equals() 메서드를 쉽게 구현할 수 있습니다. 이는 두 객체가 동등한지 여부를 판단하는 데 도움이 됩니다.
/// => 캐싱 및 재사용: 불변 객체는 한 번 생성된 후에는 변경되지 않기 때문에 동일한 값을 갖는 객체는 캐싱되어 재사용될 수 있습니다. 이는 메모리 사용을 최적화하고 성능을 향상시킬 수 있습니다.
/// =>  함수형 프로그래밍 지원: 불변성은 함수형 프로그래밍의 핵심 개념 중 하나이며, 함수형 스타일의 코드를 작성하는 데 불변 클래스가 도움을 줍니다.
/// => 불변 클래스는 특히 데이터 모델이나 상태를 나타내는 데에 유용합니다.
/// => 예를 들면, 상태 관리를 위한 객체나 함수형 프로그래밍에서 불변성을 요구하는 상황에서 특히 효과적입니다.
@immutable
class Item {
  final int id;
  final String name;
  final Color color; // Material Design의 기본 색상 중 하나
  final int price = 42;

  /// 생성자
  /// => id와 name은 필수적으로 제공
  /// => 색상은 id를 기반으로 Material Design의 색상 중 하나로 초기화
  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  /// => hashCode는 객체의 해시 코드를 반환
  /// => operator ==는 두 객체가 동등한지 여부를 확인
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}