---
title: Keyed collections
slug: Web/JavaScript/Guide/Keyed_collections
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Indexed_collections", "Web/JavaScript/Guide/Working_with_objects")}}

Chương này giới thiệu các tập hợp dữ liệu được lập chỉ số bằng khóa; các đối tượng `Map` và `Set` chứa các phần tử có thể duyệt theo thứ tự chèn vào.

## Maps

### Đối tượng Map

Đối tượng {{jsxref("Map")}} là một map khóa/giá trị có thể duyệt các phần tử theo thứ tự chèn.

Đoạn code sau trình bày một số thao tác cơ bản với `Map`. Xem thêm trang tham chiếu {{jsxref("Map")}} để biết thêm ví dụ và API đầy đủ. Bạn có thể dùng vòng lặp {{jsxref("Statements/for...of", "for...of")}} để trả về mảng `[key, value]` trong mỗi lần lặp.

```js
const sayings = new Map();
sayings.set("dog", "woof");
sayings.set("cat", "meow");
sayings.set("elephant", "toot");
sayings.size; // 3
sayings.get("dog"); // woof
sayings.get("fox"); // undefined
sayings.has("bird"); // false
sayings.delete("dog");
sayings.has("dog"); // false

for (const [key, value] of sayings) {
  console.log(`${key} goes ${value}`);
}
// "cat goes meow"
// "elephant goes toot"

sayings.clear();
sayings.size; // 0
```

### So sánh Object và Map

Theo truyền thống, {{jsxref("Object", "objects", "", 1)}} được dùng để ánh xạ chuỗi sang giá trị. Object cho phép bạn đặt khóa thành giá trị, lấy lại giá trị đó, xóa khóa và kiểm tra xem có gì được lưu tại một khóa hay không. Tuy nhiên, `Map` có thêm một số ưu điểm giúp nó trở thành map tốt hơn.

- Khóa của `Object` là [string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), trong khi khóa của `Map` có thể là bất kỳ giá trị nào.
- Bạn có thể dễ dàng lấy `size` của `Map`, trong khi phải theo dõi thủ công kích thước của `Object`.
- Việc duyệt map theo thứ tự chèn của các phần tử.
- `Object` có prototype, vì vậy có các khóa mặc định trong map. (Điều này có thể bỏ qua bằng cách dùng `map = Object.create(null)`.)

Ba gợi ý sau giúp bạn quyết định nên dùng `Map` hay `Object`:

- Dùng map thay object khi các khóa chưa biết cho đến runtime, và khi tất cả khóa có cùng kiểu và tất cả giá trị có cùng kiểu.
- Dùng map nếu cần lưu trữ giá trị primitive làm khóa vì object xử lý mỗi khóa như chuỗi dù đó là giá trị số, boolean hay primitive nào khác.
- Dùng object khi có logic thao tác trên từng phần tử riêng lẻ.

### Đối tượng WeakMap

{{jsxref("WeakMap")}} là tập hợp các cặp khóa/giá trị mà khóa phải là đối tượng hoặc [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry), với giá trị thuộc bất kỳ [kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures) tùy ý, và không tạo tham chiếu mạnh đến khóa. Tức là, sự tồn tại của một đối tượng làm khóa trong `WeakMap` không ngăn đối tượng đó bị garbage collect. Khi đối tượng được dùng làm khóa bị thu gom, các giá trị tương ứng của nó trong bất kỳ `WeakMap` nào cũng trở thành ứng viên garbage collection — miễn là chúng không được tham chiếu mạnh ở nơi khác. Kiểu primitive duy nhất có thể dùng làm khóa `WeakMap` là symbol — cụ thể hơn là [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) — vì symbol không đăng ký được đảm bảo là duy nhất và không thể tạo lại.

API của `WeakMap` về cơ bản giống API của `Map`. Tuy nhiên, `WeakMap` không cho phép quan sát sức sống của các khóa, đó là lý do tại sao nó không cho phép enumeration. Vì vậy không có phương thức để lấy danh sách các khóa trong `WeakMap`. Nếu có, danh sách sẽ phụ thuộc vào trạng thái garbage collection, gây ra tính không xác định.

Để biết thêm thông tin và code ví dụ, xem "Why WeakMap?" trên trang tham chiếu {{jsxref("WeakMap")}}.

Một use case của đối tượng `WeakMap` là lưu trữ dữ liệu private cho đối tượng, hoặc ẩn chi tiết triển khai. Trong ví dụ sau, dữ liệu private và các phương thức nằm bên trong đối tượng và được lưu trong đối tượng `privates`, đây là `WeakMap`. Mọi thứ được public trên instance và prototype; mọi thứ khác không thể truy cập từ bên ngoài vì `privates` không được export từ module.

```js
const privates = new WeakMap();

export default function Public() {
  const me = {
    // Private data goes here
  };
  privates.set(this, me);
}

Public.prototype.method = function () {
  const me = privates.get(this);
  // Do stuff with private data in `me`
  // …
};
```

> [!NOTE]
> Use case này hiện có thể được triển khai với [classes và private fields](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

## Sets

### Đối tượng Set

Đối tượng {{jsxref("Set")}} là tập hợp các giá trị duy nhất. Bạn có thể duyệt các phần tử theo thứ tự chèn. Một giá trị trong `Set` chỉ có thể xuất hiện một lần; nó là duy nhất trong tập hợp `Set`.

Đoạn code sau trình bày một số thao tác cơ bản với `Set`. Xem thêm trang tham chiếu {{jsxref("Set")}} để biết thêm ví dụ và API đầy đủ.

```js
const mySet = new Set();
mySet.add(1);
mySet.add("some text");
mySet.add("foo");

mySet.has(1); // true
mySet.delete("foo");
mySet.size; // 2

for (const item of mySet) {
  console.log(item);
}
// 1
// "some text"
```

### Chuyển đổi giữa Array và Set

Bạn có thể tạo {{jsxref("Array")}} từ Set bằng {{jsxref("Array.from")}} hoặc [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax). Ngoài ra, hàm tạo `Set` cũng nhận `Array` để chuyển đổi theo chiều ngược lại.

> [!NOTE]
> `Set` lưu trữ _giá trị duy nhất_ — vì vậy bất kỳ phần tử trùng lặp nào từ Array sẽ bị xóa khi chuyển đổi!

```js
Array.from(mySet);
[...mySet2];

mySet2 = new Set([1, 2, 3, 4]);
```

### So sánh Array và Set

Theo truyền thống, tập hợp các phần tử được lưu trong mảng trong JavaScript ở nhiều tình huống. Tuy nhiên, đối tượng `Set` có một số ưu điểm:

- Xóa phần tử mảng theo giá trị (`arr.splice(arr.indexOf(val), 1)`) rất chậm.
- `Set` cho phép xóa phần tử theo giá trị. Với mảng, bạn phải `splice` dựa trên chỉ số phần tử.
- Giá trị {{jsxref("NaN")}} không thể tìm thấy bằng `indexOf` trong mảng.
- `Set` lưu trữ các giá trị duy nhất. Bạn không cần theo dõi thủ công các bản sao.

### Đối tượng WeakSet

Đối tượng {{jsxref("WeakSet")}} là tập hợp các giá trị có thể garbage collect, bao gồm objects và [symbol không đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Một giá trị trong `WeakSet` chỉ có thể xuất hiện một lần. Nó là duy nhất trong tập hợp `WeakSet`.

Sự khác biệt chính so với đối tượng {{jsxref("Set")}} là:

- Ngược với `Set`, `WeakSet` là **tập hợp _chỉ_ của objects hoặc symbols**, không phải giá trị tùy ý thuộc bất kỳ kiểu nào.
- `WeakSet` là _weak_: Tham chiếu đến các đối tượng trong tập hợp được giữ yếu. Nếu không có tham chiếu khác đến đối tượng được lưu trong `WeakSet`, chúng có thể bị garbage collect. Điều đó cũng có nghĩa là không có danh sách các đối tượng hiện đang được lưu trong tập hợp.
- `WeakSet` không thể enumerable.

Các use case của đối tượng `WeakSet` bị giới hạn. Chúng không làm rò rỉ bộ nhớ, nên có thể an toàn khi dùng các element DOM làm khóa và đánh dấu chúng để theo dõi, chẳng hạn.

## Bình đẳng khóa và giá trị của Map và Set

Cả bình đẳng khóa của đối tượng `Map` lẫn bình đẳng giá trị của đối tượng `Set` đều dựa trên [thuật toán SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality):

- Bình đẳng hoạt động như toán tử so sánh đồng nhất `===`.
- `-0` và `+0` được coi là bằng nhau.
- {{jsxref("NaN")}} được coi là bằng chính nó (ngược với `===`).

{{PreviousNext("Web/JavaScript/Guide/Indexed_collections", "Web/JavaScript/Guide/Working_with_objects")}}
