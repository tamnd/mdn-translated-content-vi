---
title: WeakMap
slug: Web/JavaScript/Reference/Global_Objects/WeakMap
page-type: javascript-class
browser-compat: javascript.builtins.WeakMap
sidebar: jsref
---

**`WeakMap`** là một tập hợp các cặp key/value mà key phải là đối tượng hoặc [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry), với value thuộc bất kỳ [kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures) tùy ý, và không tạo tham chiếu mạnh đến key của nó. Nghĩa là, sự hiện diện của một đối tượng làm key trong `WeakMap` không ngăn đối tượng đó bị garbage collected. Khi một đối tượng được dùng làm key đã được thu thập, các giá trị tương ứng của nó trong bất kỳ `WeakMap` nào cũng trở thành ứng viên cho garbage collection — miễn là chúng không được tham chiếu mạnh ở nơi khác. Kiểu nguyên thủy duy nhất có thể được dùng làm key của `WeakMap` là symbol — cụ thể hơn, [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) — vì các symbol không được đăng ký được đảm bảo là duy nhất và không thể được tạo lại.

`WeakMap` cho phép liên kết dữ liệu với các đối tượng theo cách không ngăn các đối tượng key bị thu thập, ngay cả khi các giá trị tham chiếu đến các key. Tuy nhiên, `WeakMap` không cho phép quan sát tính sống còn của các key của nó, đó là lý do tại sao nó không cho phép liệt kê; nếu `WeakMap` cung cấp bất kỳ phương thức nào để lấy danh sách các key, danh sách đó sẽ phụ thuộc vào trạng thái của garbage collection, tạo ra tính không xác định. Nếu bạn muốn có danh sách các key, bạn nên dùng {{jsxref("Map")}} thay vì `WeakMap`.

Bạn có thể tìm hiểu thêm về `WeakMap` trong phần [Đối tượng WeakMap](/en-US/docs/Web/JavaScript/Guide/Keyed_collections#weakmap_object) của hướng dẫn [Keyed collections](/en-US/docs/Web/JavaScript/Guide/Keyed_collections).

## Mô tả

Các key của WeakMap phải là garbage-collectable. Hầu hết {{Glossary("Primitive", "các kiểu dữ liệu nguyên thủy")}} có thể được tạo tùy ý và không có vòng đời, vì vậy chúng không thể được dùng làm key. Đối tượng và [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) có thể được dùng làm key vì chúng là garbage-collectable.

### So sánh key

Giống như `Map` thông thường, so sánh giá trị dựa trên thuật toán [SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality), giống với toán tử `===` vì `WeakMap` chỉ có thể giữ key là đối tượng và symbol. Điều này có nghĩa là đối với các key đối tượng, sự bình đẳng dựa trên đồng nhất đối tượng. Chúng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

### Tại sao dùng WeakMap?

Một API map _có thể_ được triển khai trong JavaScript với hai mảng (một cho key, một cho value) được chia sẻ bởi bốn phương thức API. Việc thiết lập các phần tử trên map này sẽ liên quan đến việc đẩy một key và value vào cuối mỗi mảng đó đồng thời. Kết quả là, các chỉ số của key và value sẽ tương ứng với cả hai mảng. Việc lấy value từ map sẽ liên quan đến việc duyệt qua tất cả các key để tìm khớp, sau đó sử dụng chỉ số của khớp này để lấy value tương ứng từ mảng value.

Một triển khai như vậy sẽ có hai bất tiện chính:

1. Bất tiện đầu tiên là set và tìm kiếm O(n) (_n_ là số lượng key trong map) vì cả hai thao tác đều phải duyệt qua danh sách key để tìm giá trị khớp.
2. Bất tiện thứ hai là rò rỉ bộ nhớ vì các mảng đảm bảo rằng các tham chiếu đến mỗi key và mỗi value được duy trì vô thời hạn. Các tham chiếu này ngăn các key bị garbage collected, ngay cả khi không có tham chiếu nào khác đến đối tượng. Điều này cũng ngăn các value tương ứng bị garbage collected.

Ngược lại, trong `WeakMap`, một đối tượng key tham chiếu mạnh đến nội dung của nó miễn là key chưa bị garbage collected, nhưng tham chiếu yếu sau đó. Do đó, `WeakMap`:

- không ngăn garbage collection, cuối cùng sẽ xóa các tham chiếu đến đối tượng key
- cho phép garbage collection của bất kỳ value nào nếu các đối tượng key của chúng không được tham chiếu từ nơi nào khác ngoài `WeakMap`

`WeakMap` có thể là một cấu trúc đặc biệt hữu ích khi ánh xạ các key đến thông tin về key có giá trị _chỉ khi_ key chưa bị garbage collected.

Nhưng vì `WeakMap` không cho phép quan sát tính sống còn của các key, các key của nó không thể liệt kê. Không có phương thức nào để lấy danh sách các key. Nếu có, danh sách sẽ phụ thuộc vào trạng thái của garbage collection, tạo ra tính không xác định. Nếu bạn muốn có danh sách các key, bạn nên dùng {{jsxref("Map")}}.

## Constructor

- {{jsxref("WeakMap/WeakMap", "WeakMap()")}}
  - : Tạo một đối tượng `WeakMap` mới.

## Thuộc tính thể hiện

Các thuộc tính này được định nghĩa trên `WeakMap.prototype` và chia sẻ bởi tất cả các thể hiện `WeakMap`.

- {{jsxref("Object/constructor", "WeakMap.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng thể hiện. Đối với các thể hiện `WeakMap`, giá trị ban đầu là constructor {{jsxref("WeakMap/WeakMap", "WeakMap")}}.
- `WeakMap.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"WeakMap"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thể hiện

- {{jsxref("WeakMap.prototype.delete()")}}
  - : Xóa entry được chỉ định bởi key khỏi `WeakMap` này.
- {{jsxref("WeakMap.prototype.get()")}}
  - : Trả về value tương ứng với key trong `WeakMap` này, hoặc `undefined` nếu không có.
- {{jsxref("WeakMap.prototype.getOrInsert()")}}
  - : Trả về value tương ứng với key được chỉ định trong `WeakMap` này. Nếu key không có, nó chèn một entry mới với key và giá trị mặc định đã cho, và trả về giá trị đã chèn.
- {{jsxref("WeakMap.prototype.getOrInsertComputed()")}}
  - : Trả về value tương ứng với key được chỉ định trong `WeakMap` này. Nếu key không có, nó chèn một entry mới với key và giá trị mặc định được tính từ callback đã cho, và trả về giá trị đã chèn.
- {{jsxref("WeakMap.prototype.has()")}}
  - : Trả về boolean cho biết có entry với key được chỉ định tồn tại trong `WeakMap` này hay không.
- {{jsxref("WeakMap.prototype.set()")}}
  - : Thêm một entry mới với key và value được chỉ định vào `WeakMap` này, hoặc cập nhật entry hiện có nếu key đã tồn tại.

## Ví dụ

### Sử dụng WeakMap

```js
const wm1 = new WeakMap();
const wm2 = new WeakMap();
const wm3 = new WeakMap();
const o1 = {};
const o2 = () => {};
const o3 = window;

wm1.set(o1, 37);
wm1.set(o2, "azerty");
wm2.set(o1, o2); // a value can be anything, including an object or a function
wm2.set(o2, undefined);
wm2.set(wm1, wm2); // keys and values can be any objects. Even WeakMaps!

wm1.get(o2); // "azerty"
wm2.get(o2); // undefined, because that is the set value
wm2.get(o3); // undefined, because there is no key for o3 on wm2

wm1.has(o2); // true
wm2.has(o2); // true (even if the value itself is 'undefined')
wm2.has(o3); // false

wm3.set(o1, 37);
wm3.get(o1); // 37

wm1.has(o1); // true
wm1.delete(o1);
wm1.has(o1); // false
```

### Triển khai lớp giống WeakMap với phương thức .clear()

```js
class ClearableWeakMap {
  #wm;
  constructor(init) {
    this.#wm = new WeakMap(init);
  }
  clear() {
    this.#wm = new WeakMap();
  }
  delete(k) {
    return this.#wm.delete(k);
  }
  get(k) {
    return this.#wm.get(k);
  }
  has(k) {
    return this.#wm.has(k);
  }
  set(k, v) {
    this.#wm.set(k, v);
    return this;
  }
}
```

### Giả lập thành viên private

Các nhà phát triển có thể dùng `WeakMap` để liên kết dữ liệu private với một đối tượng, với các lợi ích sau:

- So với {{jsxref("Map")}}, WeakMap không giữ tham chiếu mạnh đến đối tượng được dùng làm key, vì vậy metadata chia sẻ cùng vòng đời với đối tượng, tránh rò rỉ bộ nhớ.
- So với việc dùng các thuộc tính không liệt kê và/hoặc {{jsxref("Symbol")}}, WeakMap nằm bên ngoài đối tượng và không có cách nào để code người dùng lấy metadata thông qua các phương thức phản chiếu như {{jsxref("Object.getOwnPropertySymbols")}}.
- So với [closure](/en-US/docs/Web/JavaScript/Guide/Closures), WeakMap có thể được tái sử dụng cho tất cả các thể hiện được tạo từ một constructor, giúp tiết kiệm bộ nhớ hơn, và cho phép các thể hiện khác nhau của cùng một lớp đọc các thành viên private của nhau.

```js
let Thing;

{
  const privateScope = new WeakMap();
  let counter = 0;

  Thing = function () {
    this.someProperty = "foo";

    privateScope.set(this, {
      hidden: ++counter,
    });
  };

  Thing.prototype.showPublic = function () {
    return this.someProperty;
  };

  Thing.prototype.showPrivate = function () {
    return privateScope.get(this).hidden;
  };
}

console.log(typeof privateScope);
// "undefined"

const thing = new Thing();

console.log(thing);
// Thing {someProperty: "foo"}

thing.showPublic();
// "foo"

thing.showPrivate();
// 1
```

Đây là cách xấp xỉ tương đương với đoạn sau, sử dụng [các trường private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements):

```js
class Thing {
  static #counter = 0;
  #hidden;
  constructor() {
    this.someProperty = "foo";
    this.#hidden = ++Thing.#counter;
  }
  showPublic() {
    return this.someProperty;
  }
  showPrivate() {
    return this.#hidden;
  }
}

const thing = new Thing();

console.log(thing);
// Thing {someProperty: "foo"}

thing.showPublic();
// "foo"

thing.showPrivate();
// 1
```

### Liên kết metadata

`WeakMap` có thể được dùng để liên kết metadata với một đối tượng, mà không ảnh hưởng đến vòng đời của đối tượng đó. Điều này rất giống với ví dụ thành viên private, vì các thành viên private cũng được mô hình hóa như metadata bên ngoài không tham gia vào [thừa kế nguyên mẫu](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

Trường hợp sử dụng này có thể được mở rộng cho các đối tượng đã được tạo. Ví dụ, trên web, chúng ta có thể muốn liên kết dữ liệu bổ sung với một phần tử DOM, mà phần tử DOM có thể truy cập sau đó. Một cách tiếp cận phổ biến là gắn dữ liệu như một thuộc tính:

```js
const buttons = document.querySelectorAll(".button");
buttons.forEach((button) => {
  button.clicked = false;
  button.addEventListener("click", () => {
    button.clicked = true;
    const currentButtons = [...document.querySelectorAll(".button")];
    if (currentButtons.every((button) => button.clicked)) {
      console.log("All buttons have been clicked!");
    }
  });
});
```

Cách tiếp cận này hoạt động, nhưng có một vài điểm bất lợi:

- Thuộc tính `clicked` có thể liệt kê, vì vậy nó sẽ hiển thị trong [`Object.keys(button)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys), vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in), v.v. Điều này có thể được giảm nhẹ bằng cách dùng {{jsxref("Object.defineProperty()")}}, nhưng điều đó làm code dài dòng hơn.
- Thuộc tính `clicked` là thuộc tính chuỗi thông thường, vì vậy nó có thể được truy cập và ghi đè bởi code khác. Điều này có thể được giảm nhẹ bằng cách dùng key {{jsxref("Symbol")}}, nhưng key vẫn có thể truy cập qua {{jsxref("Object.getOwnPropertySymbols()")}}.

Sử dụng `WeakMap` khắc phục những vấn đề này:

```js
const buttons = document.querySelectorAll(".button");
const clicked = new WeakMap();
buttons.forEach((button) => {
  clicked.set(button, false);
  button.addEventListener("click", () => {
    clicked.set(button, true);
    const currentButtons = [...document.querySelectorAll(".button")];
    if (currentButtons.every((button) => clicked.get(button))) {
      console.log("All buttons have been clicked!");
    }
  });
});
```

Ở đây, chỉ có code có quyền truy cập vào `clicked` mới biết trạng thái clicked của mỗi button, và code bên ngoài không thể sửa đổi các trạng thái. Ngoài ra, nếu bất kỳ button nào bị xóa khỏi DOM, metadata liên quan sẽ tự động được garbage collected.

### Bộ nhớ đệm

Bạn có thể liên kết các đối tượng được truyền vào hàm với kết quả của hàm, để nếu cùng một đối tượng được truyền lại, kết quả đã lưu trong bộ nhớ đệm có thể được trả về mà không cần thực thi lại hàm. Điều này hữu ích nếu hàm thuần túy (nghĩa là nó không biến đổi bất kỳ đối tượng bên ngoài nào hoặc gây ra các side effect có thể quan sát khác).

```js
const cache = new WeakMap();
function handleObjectValues(obj) {
  if (cache.has(obj)) {
    return cache.get(obj);
  }
  const result = Object.values(obj).map(heavyComputation);
  cache.set(obj, result);
  return result;
}
```

Điều này chỉ hoạt động nếu đầu vào của hàm là một đối tượng. Hơn nữa, ngay cả khi đầu vào không bao giờ được truyền vào lại, kết quả vẫn tồn tại mãi trong bộ nhớ đệm miễn là key (đầu vào) còn sống. Một cách hiệu quả hơn là dùng {{jsxref("Map")}} kết hợp với các đối tượng {{jsxref("WeakRef")}}, cho phép bạn liên kết bất kỳ kiểu giá trị đầu vào nào với kết quả tính toán tương ứng (có thể rất lớn). Xem ví dụ [WeakRefs and FinalizationRegistry](/en-US/docs/Web/JavaScript/Guide/Memory_management#weakrefs_and_finalizationregistry) để biết thêm chi tiết.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `WeakMap` trong `core-js`](https://github.com/zloirock/core-js#weakmap)
- [Keyed collections](/en-US/docs/Web/JavaScript/Guide/Keyed_collections#weakmap_object)
- {{jsxref("Map")}}
- {{jsxref("Set")}}
- {{jsxref("WeakSet")}}
