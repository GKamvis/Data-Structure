class Node<T> {
  // T generuc tipdir, yəni kod müyəyən bir tipə bağlı olmadan istifadə edə bilirik.
// Bu T placeholder kimi f'aliyyət göstərir.
// Node<int> intNode = Node<int>(10);
// Node<String> stringNode = Node<String>("Hello");

  T? value; // Node dəyərini tutur
  Node<T>? next; // Sıradakı yerinin referansı

  Node(this.value,
      [this.next]); // Value də qəbül edəcək şəkildə yenidən tərtib edək
}

class LinkedList<T> {
  Node<T>? head; // bu listdəki ilk dəyərə referans verir

  // Listi IsEmpty adlı funksiya ilə yoxlayaq
  bool isEmpty() {
    return head == null;
  }

  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpty()) {
      head = newNode;
    } else {
      var current = head;

      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void remove(T value) {
    if (isEmpty()) return;
    if (head != null && head!.value == value) {
      head = head!.next;
      return;
    }
    var current = head;
    while (current != null && current.next != null) {
      if (current.next!.value == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  void printList() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

void main() {
  final list = LinkedList();
  list.add(1);
  list.add(22);

  list.add(13);

  list.printList();
  list.remove(2);
  list.printList();
}
