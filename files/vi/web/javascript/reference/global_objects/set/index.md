---
title: Set
slug: Web/JavaScript/Reference/Global_Objects/Set
page-type: javascript-class
browser-compat: javascript.builtins.Set
sidebar: jsref
---

Đối tượng **`Set`** cho phép bạn lưu trữ các giá trị duy nhất của bất kỳ kiểu nào, dù là {{Glossary("Primitive", "giá trị nguyên thủy")}} hay tham chiếu đối tượng.

## Mô tả

Đối tượng `Set` là các tập hợp giá trị. Một giá trị trong set **chỉ được xuất hiện một lần**; nó là duy nhất trong tập hợp của set. Bạn có thể duyệt qua các phần tử của set theo thứ tự chèn. _Thứ tự chèn_ tương ứng với thứ tự mà mỗi phần tử được chèn vào set bằng phương thức [`add()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/add) thành công (nghĩa là không có phần tử giống hệt nào đã có trong set khi `add()` được gọi).

Đặc tả yêu cầu các set phải được triển khai "sao cho, tính trung bình, cung cấp thời gian truy cập dưới tuyến tính theo số lượng phần tử trong tập hợp". Do đó, nó có thể được biểu diễn nội bộ dưới dạng bảng băm (với thời gian tra cứu O(1)), cây tìm kiếm (với thời gian tra cứu O(log(N))), hoặc bất kỳ cấu trúc dữ liệu nào khác, miễn là độ phức tạp tốt hơn O(N).

### So sánh giá trị

So sánh giá trị dựa trên thuật toán [SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality). (Trước đây nó sử dụng [SameValue](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value_equality_using_object.is), coi `0` và `-0` là khác nhau. Xem [tương thích trình duyệt](#browser_compatibility).) Điều này có nghĩa là {{jsxref("NaN")}} được coi là bằng `NaN` (dù `NaN !== NaN`) và tất cả các giá trị khác được so sánh bình đẳng theo ngữ nghĩa của toán tử `===`. Ngoài ra, đối với các khóa đối tượng, sự bình đẳng dựa trên đồng nhất đối tượng. Chúng được so sánh theo tham chiếu, không phải theo giá trị. Xem [Sử dụng đối tượng Set](#using_the_set_object) để có ví dụ.

### Hiệu năng

Phương thức [`has`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/has) kiểm tra xem một giá trị có trong set hay không, sử dụng một cách tiếp cận nhanh hơn trung bình so với việc kiểm tra hầu hết các phần tử đã được thêm vào set trước đó. Cụ thể, nó nhanh hơn trung bình so với phương thức [`Array.prototype.includes`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) khi mảng có `length` bằng với `size` của set.

### Tổ hợp Set

Đối tượng `Set` cung cấp một số phương thức cho phép bạn tổ hợp các set giống như các phép toán toán học. Các phương thức này bao gồm:

<table>
  <thead>
    <tr>
      <th scope="col">Phương thức</th>
      <th scope="col">Kiểu trả về</th>
      <th scope="col">Tương đương toán học</th>
      <th scope="col">Biểu đồ Venn</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{jsxref("Set/difference", "A.difference(B)")}}</td>
      <td><code>Set</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>∖</mo><mi>B</mi></mrow><annotation encoding="TeX">A\setminus B</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="difference/diagram.svg" alt="A Venn diagram where two circles overlap. The difference of A and B is the part of A that is not overlapping B." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/intersection", "A.intersection(B)")}}</td>
      <td><code>Set</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>∩</mo><mi>B</mi></mrow><annotation encoding="TeX">A\cap B</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="intersection/diagram.svg" alt="A Venn diagram where two circles overlap. The intersection of A and B is the part where they overlap." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/symmetricDifference", "A.symmetricDifference(B)")}}</td>
      <td><code>Set</code></td>
      <td>
        <math><semantics><mrow><mo stretchy="false">(</mo><mi>A</mi><mo>∖</mo><mi>B</mi><mo stretchy="false">)</mo><mo>∪</mo><mo stretchy="false">(</mo><mi>B</mi><mo>∖</mo><mi>A</mi><mo stretchy="false">)</mo></mrow><annotation encoding="TeX">(A\setminus B)\cup(B\setminus A)</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="symmetricDifference/diagram.svg" alt="A Venn diagram where two circles overlap. The symmetric difference of A and B is the region contained by either circle but not both." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/union", "A.union(B)")}}</td>
      <td><code>Set</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>∪</mo><mi>B</mi></mrow><annotation encoding="TeX">A\cup B</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="union/diagram.svg" alt="A Venn diagram where two circles overlap. The union of A and B is the region contained by either or both circles." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/isDisjointFrom", "A.isDisjointFrom(B)")}}</td>
      <td><code>Boolean</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>∩</mo><mi>B</mi><mo>=</mo><mi>∅</mi></mrow><annotation encoding="TeX">A\cap B = \empty</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="isDisjointFrom/diagram.svg" alt="A Venn diagram with two circles. A and B are disjoint because the circles have no region of overlap." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/isSubsetOf", "A.isSubsetOf(B)")}}</td>
      <td><code>Boolean</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>⊆</mo><mi>B</mi></mrow><annotation encoding="TeX">A\subseteq B</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="isSubsetOf/diagram.svg" alt="A Venn diagram with two circles. A is a subset of B because A is completely contained in B." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
    <tr>
      <td>{{jsxref("Set/isSupersetOf", "A.isSupersetOf(B)")}}</td>
      <td><code>Boolean</code></td>
      <td>
        <math><semantics><mrow><mi>A</mi><mo>⊇</mo><mi>B</mi></mrow><annotation encoding="TeX">A\supseteq B</annotation></semantics></math>
      </td>
      <td style="margin:0;padding:0"><img src="isSupersetOf/diagram.svg" alt="A Venn diagram with two circles. A is a superset of B because B is completely contained in A." style="margin:0;border:0;border-radius:0" width="200" /></td>
    </tr>
  </tbody>
</table>

Để làm cho chúng tổng quát hơn, các phương thức này không chỉ chấp nhận đối tượng `Set`, mà còn bất kỳ thứ gì [giống set](#set-like_objects).

### Đối tượng giống Set

Tất cả [các phương thức tổ hợp set](#set_composition) đều yêu cầu {{jsxref("Operators/this", "this")}} phải là một thể hiện `Set` thực sự, nhưng các đối số của chúng chỉ cần là set-like. Một _đối tượng giống set_ là một đối tượng cung cấp các thứ sau:

- Thuộc tính {{jsxref("Set/size", "size")}} chứa một số.
- Phương thức {{jsxref("Set/has", "has()")}} nhận một phần tử và trả về boolean.
- Phương thức {{jsxref("Set/keys", "keys()")}} trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) của các phần tử trong set.

Ví dụ, đối tượng {{jsxref("Map")}} là giống set vì chúng cũng có {{jsxref("Map/size", "size")}}, {{jsxref("Map/has", "has()")}}, và {{jsxref("Map/keys", "keys()")}}, vì vậy chúng hoạt động giống như tập hợp các khóa khi được sử dụng trong các phương thức set:

```js
const a = new Set([1, 2, 3]);
const b = new Map([
  [1, "one"],
  [2, "two"],
  [4, "four"],
]);
console.log(a.union(b)); // Set(4) {1, 2, 3, 4}
```

> [!NOTE]
> Giao thức set-like gọi phương thức `keys()` thay vì [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator) để tạo ra các phần tử. Điều này để làm cho map trở thành đối tượng giống set hợp lệ, vì đối với map, iterator tạo ra các _entry_ nhưng phương thức `has()` nhận _key_.

[Array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) không phải là set-like vì chúng không có phương thức `has()` hay thuộc tính `size`, và phương thức `keys()` của chúng tạo ra các chỉ số thay vì các phần tử. Đối tượng {{jsxref("WeakSet")}} cũng không phải là set-like vì chúng không có phương thức `keys()`.

### Đối tượng giống Set của trình duyệt

**Đối tượng `Set`-like của trình duyệt** (hay "setlike objects") là các giao diện [Web API](/en-US/docs/Web/API) hoạt động theo nhiều cách giống như `Set`.

Giống như `Set`, các phần tử có thể được duyệt theo cùng thứ tự mà chúng được thêm vào đối tượng.
Đối tượng `Set`-like và `Set` cũng có các thuộc tính và phương thức cùng tên và hành vi.
Tuy nhiên không giống `Set`, chúng chỉ cho phép một kiểu xác định trước cụ thể cho mỗi entry.

Các kiểu được phép được thiết lập trong định nghĩa IDL của đặc tả.
Ví dụ, {{domxref("GPUSupportedFeatures")}} là đối tượng `Set`-like phải sử dụng chuỗi làm key/value.
Điều này được định nghĩa trong IDL của đặc tả bên dưới:

```webidl
interface GPUSupportedFeatures {
  readonly setlike<DOMString>;
};
```

Đối tượng `Set`-like có thể là chỉ đọc hoặc đọc-ghi (xem từ khóa `readonly` trong IDL ở trên).

- Đối tượng `Set`-like chỉ đọc có thuộc tính {{jsxref("Set/size", "size")}}, và các phương thức: {{jsxref("Set/entries", "entries()")}}, {{jsxref("Set/forEach", "forEach()")}}, {{jsxref("Set/has", "has()")}}, {{jsxref("Set/keys", "keys()")}}, {{jsxref("Set/values", "values()")}}, và [`Symbol.iterator()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator).
- Đối tượng `Set`-like có thể ghi thêm có các phương thức: {{jsxref("Set/clear", "clear()")}}, {{jsxref("Set/delete", "delete()")}}, và {{jsxref("Set/add", "add()")}}.

Các phương thức và thuộc tính có cùng hành vi như các thực thể tương đương trong `Set`, ngoại trừ hạn chế về kiểu của entry.

Sau đây là các ví dụ về đối tượng trình duyệt `Set`-like chỉ đọc:

- {{domxref("GPUSupportedFeatures")}}
- {{domxref("XRAnchorSet")}}

Sau đây là các ví dụ về đối tượng trình duyệt `Set`-like có thể ghi:

- {{domxref("CustomStateSet")}}
- {{domxref("FontFaceSet")}}
- {{domxref("Highlight")}}
- {{domxref("ViewTransitionTypeSet")}}

## Constructor

- {{jsxref("Set/Set", "Set()")}}
  - : Tạo một đối tượng `Set` mới.

## Thuộc tính tĩnh

- [`Set[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.species)
  - : Hàm constructor được sử dụng để tạo các đối tượng dẫn xuất.

## Thuộc tính thể hiện

Các thuộc tính này được định nghĩa trên `Set.prototype` và chia sẻ bởi tất cả các thể hiện `Set`.

- {{jsxref("Object/constructor", "Set.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng thể hiện. Đối với các thể hiện `Set`, giá trị ban đầu là constructor {{jsxref("Set/Set", "Set")}}.
- {{jsxref("Set.prototype.size")}}
  - : Trả về số lượng giá trị trong đối tượng `Set`.
- `Set.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Set"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thể hiện

- {{jsxref("Set.prototype.add()")}}
  - : Chèn giá trị được chỉ định vào set này, nếu nó chưa có.
- {{jsxref("Set.prototype.clear()")}}
  - : Xóa tất cả các phần tử khỏi đối tượng `Set`.
- {{jsxref("Set.prototype.delete()")}}
  - : Xóa giá trị được chỉ định khỏi set này, nếu nó có trong set.
- {{jsxref("Set.prototype.difference()")}}
  - : Nhận một set và trả về một set mới chứa các phần tử trong set này nhưng không có trong set đã cho.
- {{jsxref("Set.prototype.entries()")}}
  - : Trả về một đối tượng iterator mới chứa **một mảng `[value, value]`** cho mỗi phần tử trong đối tượng `Set`, theo thứ tự chèn. Điều này tương tự với đối tượng {{jsxref("Map")}}, để _key_ của mỗi entry giống với _value_ của nó đối với `Set`.
- {{jsxref("Set.prototype.forEach()")}}
  - : Gọi `callbackFn` một lần cho mỗi giá trị có trong đối tượng `Set`, theo thứ tự chèn. Nếu tham số `thisArg` được cung cấp, nó sẽ được dùng làm giá trị `this` cho mỗi lần gọi `callbackFn`.
- {{jsxref("Set.prototype.has()")}}
  - : Trả về boolean cho biết giá trị được chỉ định có tồn tại trong `Set` này hay không.
- {{jsxref("Set.prototype.intersection()")}}
  - : Nhận một set và trả về một set mới chứa các phần tử trong cả set này và set đã cho.
- {{jsxref("Set.prototype.isDisjointFrom()")}}
  - : Nhận một set và trả về boolean cho biết set này có không có phần tử chung với set đã cho hay không.
- {{jsxref("Set.prototype.isSubsetOf()")}}
  - : Nhận một set và trả về boolean cho biết tất cả các phần tử của set này có nằm trong set đã cho hay không.
- {{jsxref("Set.prototype.isSupersetOf()")}}
  - : Nhận một set và trả về boolean cho biết tất cả các phần tử của set đã cho có nằm trong set này hay không.
- {{jsxref("Set.prototype.keys()")}}
  - : Một bí danh cho {{jsxref("Set.prototype.values()")}}.
- {{jsxref("Set.prototype.symmetricDifference()")}}
  - : Nhận một set và trả về một set mới chứa các phần tử có trong set này hoặc set đã cho, nhưng không có trong cả hai.
- {{jsxref("Set.prototype.union()")}}
  - : Nhận một set và trả về một set mới chứa các phần tử có trong set này, set đã cho, hoặc cả hai.
- {{jsxref("Set.prototype.values()")}}
  - : Trả về một đối tượng iterator mới trả về **các giá trị** cho mỗi phần tử trong đối tượng `Set` theo thứ tự chèn.
- [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator)
  - : Trả về một đối tượng iterator mới trả về **các giá trị** cho mỗi phần tử trong đối tượng `Set` theo thứ tự chèn.

## Ví dụ

### Sử dụng đối tượng Set

```js
const mySet1 = new Set();

mySet1.add(1); // Set(1) { 1 }
mySet1.add(5); // Set(2) { 1, 5 }
mySet1.add(5); // Set(2) { 1, 5 }
mySet1.add("some text"); // Set(3) { 1, 5, 'some text' }
const o = { a: 1, b: 2 };
mySet1.add(o);

mySet1.add({ a: 1, b: 2 }); // o is referencing a different object, so this is okay

mySet1.has(1); // true
mySet1.has(3); // false, since 3 has not been added to the set
mySet1.has(5); // true
mySet1.has(Math.sqrt(25)); // true
mySet1.has("Some Text".toLowerCase()); // true
mySet1.has(o); // true

mySet1.size; // 5

mySet1.delete(5); // removes 5 from the set
mySet1.has(5); // false, 5 has been removed

mySet1.size; // 4, since we just removed one value

mySet1.add(5); // Set(5) { 1, 'some text', {...}, {...}, 5 } - a previously deleted item will be added as a new item, it will not retain its original position before deletion

console.log(mySet1); // Set(5) { 1, "some text", {…}, {…}, 5 }
```

### Duyệt set

Việc duyệt qua set sẽ truy cập các phần tử theo thứ tự chèn.

```js
for (const item of mySet1) {
  console.log(item);
}
// 1, "some text", { "a": 1, "b": 2 }, { "a": 1, "b": 2 }, 5

for (const item of mySet1.keys()) {
  console.log(item);
}
// 1, "some text", { "a": 1, "b": 2 }, { "a": 1, "b": 2 }, 5

for (const item of mySet1.values()) {
  console.log(item);
}
// 1, "some text", { "a": 1, "b": 2 }, { "a": 1, "b": 2 }, 5

// key and value are the same here
for (const [key, value] of mySet1.entries()) {
  console.log(key);
}
// 1, "some text", { "a": 1, "b": 2 }, { "a": 1, "b": 2 }, 5

// Convert Set object to an Array object, with Array.from
const myArr = Array.from(mySet1); // [1, "some text", {"a": 1, "b": 2}, {"a": 1, "b": 2}, 5]

// the following will also work if run in an HTML document
mySet1.add(document.body);
mySet1.has(document.querySelector("body")); // true

// converting between Set and Array
const mySet2 = new Set([1, 2, 3, 4]);
console.log(mySet2.size); // 4
console.log([...mySet2]); // [1, 2, 3, 4]

// intersect can be simulated via
const intersection = new Set([...mySet1].filter((x) => mySet2.has(x)));

// difference can be simulated via
const difference = new Set([...mySet1].filter((x) => !mySet2.has(x)));

// Iterate set entries with forEach()
mySet2.forEach((value) => {
  console.log(value);
});
// 1
// 2
// 3
// 4
```

### Triển khai các phép toán set cơ bản

```js
function isSuperset(set, subset) {
  for (const elem of subset) {
    if (!set.has(elem)) {
      return false;
    }
  }
  return true;
}

function union(setA, setB) {
  const _union = new Set(setA);
  for (const elem of setB) {
    _union.add(elem);
  }
  return _union;
}

function intersection(setA, setB) {
  const _intersection = new Set();
  for (const elem of setB) {
    if (setA.has(elem)) {
      _intersection.add(elem);
    }
  }
  return _intersection;
}

function symmetricDifference(setA, setB) {
  const _difference = new Set(setA);
  for (const elem of setB) {
    if (_difference.has(elem)) {
      _difference.delete(elem);
    } else {
      _difference.add(elem);
    }
  }
  return _difference;
}

function difference(setA, setB) {
  const _difference = new Set(setA);
  for (const elem of setB) {
    _difference.delete(elem);
  }
  return _difference;
}

// Examples
const setA = new Set([1, 2, 3, 4]);
const setB = new Set([2, 3]);
const setC = new Set([3, 4, 5, 6]);

isSuperset(setA, setB); // returns true
union(setA, setC); // returns Set {1, 2, 3, 4, 5, 6}
intersection(setA, setC); // returns Set {3, 4}
symmetricDifference(setA, setC); // returns Set {1, 2, 5, 6}
difference(setA, setC); // returns Set {1, 2}
```

### Liên hệ với mảng

```js
const myArray = ["value1", "value2", "value3"];

// Use the regular Set constructor to transform an Array into a Set
const mySet = new Set(myArray);

mySet.has("value1"); // returns true

// Use the spread syntax to transform a set into an Array.
console.log([...mySet]); // Will show you exactly the same Array as myArray
```

### Xóa các phần tử trùng lặp khỏi mảng

```js
// Use to remove duplicate elements from an array
const numbers = [2, 13, 4, 4, 2, 13, 13, 4, 4, 5, 5, 6, 6, 7, 5, 32, 13, 4, 5];

console.log([...new Set(numbers)]); // [2, 13, 4, 5, 6, 7, 32]
```

### Liên hệ với chuỗi

```js
// Case sensitive (set will contain "F" and "f")
new Set("Firefox"); // Set(7) [ "F", "i", "r", "e", "f", "o", "x" ]

// Duplicate omission ("f" occurs twice in the string but set will contain only one)
new Set("firefox"); // Set(6) [ "f", "i", "r", "e", "o", "x" ]
```

### Sử dụng set để đảm bảo tính duy nhất của danh sách giá trị

```js
const array = Array.from(document.querySelectorAll("[id]")).map((e) => e.id);

const set = new Set(array);
console.assert(set.size === array.length);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Set` trong `core-js`](https://github.com/zloirock/core-js#set)
- [es-shims polyfill của `Set`](https://www.npmjs.com/package/es-set)
- {{jsxref("Map")}}
- {{jsxref("WeakMap")}}
- {{jsxref("WeakSet")}}
