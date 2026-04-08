---
title: Iterator
slug: Web/JavaScript/Reference/Global_Objects/Iterator
page-type: javascript-class
browser-compat: javascript.builtins.Iterator
sidebar: jsref
---

Đối tượng **`Iterator`** là đối tượng tuân theo [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) bằng cách cung cấp phương thức `next()` trả về đối tượng kết quả iterator. Tất cả các iterator tích hợp sẵn đều kế thừa từ lớp `Iterator`. Lớp `Iterator` cung cấp phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.iterator) trả về chính đối tượng iterator, làm cho iterator cũng có thể [lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Nó cũng cung cấp một số phương thức trợ giúp để làm việc với các iterator.

## Mô tả

Sau đây là tất cả các iterator JavaScript tích hợp sẵn:

- _Array Iterator_ được trả về bởi {{jsxref("Array.prototype.values()")}}, {{jsxref("Array.prototype.keys()")}}, {{jsxref("Array.prototype.entries()")}}, [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator), {{jsxref("TypedArray.prototype.values()")}}, {{jsxref("TypedArray.prototype.keys()")}}, {{jsxref("TypedArray.prototype.entries()")}}, [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator), và [`arguments[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/Symbol.iterator).
- _String Iterator_ được trả về bởi [`String.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator).
- _Map Iterator_ được trả về bởi {{jsxref("Map.prototype.values()")}}, {{jsxref("Map.prototype.keys()")}}, {{jsxref("Map.prototype.entries()")}}, và [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator).
- _Set Iterator_ được trả về bởi {{jsxref("Set.prototype.values()")}}, {{jsxref("Set.prototype.keys()")}}, {{jsxref("Set.prototype.entries()")}}, và [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator).
- _RegExp String Iterator_ được trả về bởi [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll) và {{jsxref("String.prototype.matchAll()")}}.
- Đối tượng {{jsxref("Generator")}} được trả về bởi [hàm generator](/en-US/docs/Web/JavaScript/Reference/Statements/function*).
- _Segments Iterator_ được trả về bởi phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments/Symbol.iterator) của đối tượng [`Segments`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments) được trả về bởi [`Intl.Segmenter.prototype.segment()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment).
- _Iterator Helper_ được trả về bởi các phương thức trợ giúp iterator như {{jsxref("Iterator.prototype.filter()")}} và {{jsxref("Iterator.prototype.map()")}}.

Các Web API cũng có thể trả về iterator. Một số tái sử dụng các iterator JavaScript cốt lõi trong khi một số khác định nghĩa các iterator riêng của chúng. Ví dụ:

- Các đối tượng [Array-Like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#array-like_objects) như [`NodeList`](/en-US/docs/Web/API/NodeList) trả về _Array Iterator_ từ các phương thức tương ứng `keys()`, `values()`, `entries()`, và `[Symbol.iterator]()`.
- Các đối tượng [Map-Like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) từ Web API như [`Headers`](/en-US/docs/Web/API/Headers) trả về kiểu iterator riêng như _Headers Iterator_ từ các phương thức tương ứng `keys()`, `values()`, `entries()`, và `[Symbol.iterator]()`.
- Các đối tượng [Set-Like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) từ Web API như [`FontFaceSet`](/en-US/docs/Web/API/FontFaceSet) trả về kiểu iterator riêng như _FontFaceSet Iterator_ từ các phương thức tương ứng `keys()`, `values()`, `entries()`, và `[Symbol.iterator]()`.

> [!NOTE]
> [`NodeIterator`](/en-US/docs/Web/API/NodeIterator) và các giao diện cũ khác được đặt tên như vậy nhưng không tuân theo [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) hay [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol).

Mỗi iterator này có một đối tượng prototype riêng, định nghĩa phương thức `next()` được sử dụng bởi iterator cụ thể đó. Ví dụ, tất cả các đối tượng string iterator kế thừa từ đối tượng ẩn `StringIteratorPrototype`, có phương thức `next()` lặp chuỗi này theo điểm mã. `StringIteratorPrototype` cũng có thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) có giá trị khởi tạo là chuỗi `"String Iterator"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}. Tương tự, các prototype iterator khác cũng có giá trị `[Symbol.toStringTag]` riêng của chúng, giống với tên được đặt ở trên.

Tất cả các đối tượng prototype này kế thừa từ `Iterator.prototype`, cung cấp phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator) trả về chính đối tượng iterator, làm cho iterator cũng có thể [lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol).

### Phương thức trợ giúp iterator

> [!NOTE]
> Các phương thức này là các trợ giúp _iterator_, không phải trợ giúp _iterable_, vì yêu cầu duy nhất để một đối tượng có thể lặp là sự hiện diện của phương thức `[Symbol.iterator]()`. Không có prototype dùng chung để cài đặt các phương thức này.

Lớp `Iterator` cung cấp một số phương thức trợ giúp để làm việc với các iterator. Ví dụ, bạn có thể bị cám dỗ làm như sau:

```js
const nameToDeposit = new Map([
  ["Anne", 1000],
  ["Bert", 1500],
  ["Carl", 2000],
]);

const totalDeposit = [...nameToDeposit.values()].reduce((a, b) => a + b);
```

Điều này trước tiên chuyển đổi iterator được trả về bởi {{jsxref("Map.prototype.values()")}} thành mảng, sau đó sử dụng phương thức {{jsxref("Array.prototype.reduce()")}} để tính tổng. Tuy nhiên, điều này vừa tạo ra mảng trung gian vừa lặp mảng hai lần. Thay vào đó, bạn có thể sử dụng phương thức `reduce()` của chính iterator:

```js
const totalDeposit = nameToDeposit.values().reduce((a, b) => a + b);
```

Phương thức này có thể hiệu quả hơn, đặc biệt về mặt bộ nhớ, vì nó chỉ lặp iterator một lần mà không ghi nhớ bất kỳ giá trị trung gian nào. Các phương thức trợ giúp iterator cần thiết để làm việc với các iterator vô hạn:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const seq = fibonacci();
const firstThreeDigitTerm = seq.find((n) => n >= 100);
```

Bạn không thể chuyển đổi `seq` thành mảng, vì nó là vô hạn. Thay vào đó, bạn có thể sử dụng phương thức `find()` của chính iterator, chỉ lặp `seq` đến mức cần thiết để tìm giá trị đầu tiên thỏa mãn điều kiện.

Bạn sẽ tìm thấy nhiều phương thức iterator tương tự với các phương thức mảng, chẳng hạn như:

| Phương thức Iterator                       | Phương thức Array                       |
| ------------------------------------------ | --------------------------------------- |
| {{jsxref("Iterator.prototype.every()")}}   | {{jsxref("Array.prototype.every()")}}   |
| {{jsxref("Iterator.prototype.filter()")}}  | {{jsxref("Array.prototype.filter()")}}  |
| {{jsxref("Iterator.prototype.find()")}}    | {{jsxref("Array.prototype.find()")}}    |
| {{jsxref("Iterator.prototype.flatMap()")}} | {{jsxref("Array.prototype.flatMap()")}} |
| {{jsxref("Iterator.prototype.forEach()")}} | {{jsxref("Array.prototype.forEach()")}} |
| {{jsxref("Iterator.prototype.map()")}}     | {{jsxref("Array.prototype.map()")}}     |
| {{jsxref("Iterator.prototype.reduce()")}}  | {{jsxref("Array.prototype.reduce()")}}  |
| {{jsxref("Iterator.prototype.some()")}}    | {{jsxref("Array.prototype.some()")}}    |

{{jsxref("Iterator.prototype.drop()")}} và {{jsxref("Iterator.prototype.take()")}} kết hợp phần nào tương tự với {{jsxref("Array.prototype.slice()")}}.

### Các đối tượng trợ giúp iterator

> [!NOTE]
> _Đối tượng trợ giúp iterator_ và _phương thức trợ giúp iterator_ là hai khái niệm khác nhau. Đối tượng trợ giúp iterator có thể được phát hiện tại thời gian chạy, trong khi "phương thức trợ giúp iterator" chỉ là tên cho một tập hợp các phương thức hiểu. _Iterator helper_ có thể đề cập đến đối tượng hoặc phương thức, tùy thuộc vào ngữ cảnh.

Trong số các phương thức trợ giúp iterator, {{jsxref("Iterator/filter", "filter()")}}, {{jsxref("Iterator/flatMap", "flatMap()")}}, {{jsxref("Iterator/map", "map()")}}, {{jsxref("Iterator/drop", "drop()")}}, và {{jsxref("Iterator/take", "take()")}} trả về đối tượng _Iterator Helper_ mới. Iterator helper cũng là instance `Iterator`, làm cho các phương thức trợ giúp này có thể được xâu chuỗi. Tất cả các đối tượng iterator helper kế thừa từ đối tượng prototype chung, triển khai giao thức iterator:

- `next()`
  - : Gọi phương thức `next()` của iterator cơ bản, áp dụng phương thức trợ giúp cho kết quả và trả về kết quả.
- `return()`
  - : Gọi phương thức `return()` của iterator cơ bản và trả về kết quả.

Iterator helper chia sẻ cùng nguồn dữ liệu với iterator cơ bản, vì vậy việc lặp iterator helper khiến iterator cơ bản cũng được lặp. Không có cách nào để "phân nhánh" một iterator để cho phép nó được lặp nhiều lần.

```js
const it = [1, 2, 3].values();
const it2 = it.drop(0); // Essentially a copy
console.log(it.next().value); // 1
console.log(it2.next().value); // 2
console.log(it.next().value); // 3
```

### Các iterator đúng nghĩa

Có hai loại "iterator": các đối tượng tuân theo [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) (yêu cầu tối thiểu là sự hiện diện của phương thức `next()`), và các đối tượng kế thừa từ lớp `Iterator`, được hưởng các phương thức trợ giúp. Chúng không kéo theo nhau — các đối tượng kế thừa từ `Iterator` không tự động trở thành iterator, vì lớp `Iterator` không định nghĩa phương thức `next()`. Thay vào đó, đối tượng cần định nghĩa phương thức `next()` của chính nó. _Iterator đúng nghĩa_ là đối tượng vừa tuân theo giao thức iterator vừa kế thừa từ `Iterator`, và hầu hết code đều mong muốn các iterator là iterator đúng nghĩa và các iterable trả về iterator đúng nghĩa. Để tạo iterator đúng nghĩa, định nghĩa lớp mở rộng {{jsxref("Iterator/Iterator", "Iterator")}}, hoặc sử dụng phương thức {{jsxref("Iterator.from()")}}.

```js
class MyIterator extends Iterator {
  next() {
    // …
  }
}

const myIterator = Iterator.from({
  next() {
    // …
  },
});
```

## Constructor

- {{jsxref("Iterator/Iterator", "Iterator()")}}
  - : Được thiết kế để được [mở rộng](/en-US/docs/Web/JavaScript/Reference/Classes/extends) bởi các lớp khác tạo iterator. Ném lỗi khi được xây dựng độc lập.

## Phương thức tĩnh

- {{jsxref("Iterator.concat()")}}
  - : Tạo đối tượng `Iterator` mới từ danh sách các đối tượng iterable. Iterator mới tạo ra các giá trị từ mỗi iterable đầu vào theo thứ tự.
- {{jsxref("Iterator.from()")}}
  - : Tạo đối tượng `Iterator` mới từ đối tượng iterator hoặc iterable.
- {{jsxref("Iterator.zip()")}} {{experimental_inline}}
  - : Tạo đối tượng `Iterator` mới tổng hợp các phần tử từ nhiều đối tượng iterable bằng cách tạo ra các mảng chứa các phần tử ở cùng vị trí.
- {{jsxref("Iterator.zipKeyed()")}} {{experimental_inline}}
  - : Tạo đối tượng `Iterator` mới tổng hợp các phần tử từ nhiều đối tượng iterable bằng cách tạo ra các đối tượng chứa các phần tử ở cùng vị trí, với khóa được chỉ định bởi đầu vào.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Iterator.prototype` và được chia sẻ bởi tất cả các instance `Iterator`.

- {{jsxref("Object/constructor", "Iterator.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `Iterator`, giá trị khởi tạo là constructor {{jsxref("Iterator/Iterator", "Iterator")}}.
- `Iterator.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Iterator"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

    > [!NOTE]
    > Không giống `[Symbol.toStringTag]` trên hầu hết các lớp tích hợp sẵn, `Iterator.prototype[Symbol.toStringTag]` có thể ghi được vì lý do tương thích web.

## Phương thức instance

- {{jsxref("Iterator.prototype.drop()")}}
  - : Trả về đối tượng iterator helper mới bỏ qua số phần tử đã cho ở đầu iterator này.
- {{jsxref("Iterator.prototype.every()")}}
  - : Trả về `false` nếu tìm thấy phần tử không thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, nếu iterator cạn kiệt mà không tìm thấy phần tử như vậy, trả về `true`.
- {{jsxref("Iterator.prototype.filter()")}}
  - : Trả về đối tượng iterator helper mới chỉ tạo ra những phần tử của iterator mà hàm callback được cung cấp trả về `true`.
- {{jsxref("Iterator.prototype.find()")}}
  - : Trả về phần tử đầu tiên do iterator tạo ra thỏa mãn hàm kiểm tra được cung cấp. Nếu không có giá trị nào thỏa mãn hàm kiểm tra, trả về {{jsxref("undefined")}}.
- {{jsxref("Iterator.prototype.flatMap()")}}
  - : Trả về đối tượng iterator helper mới lấy từng phần tử trong iterator gốc, chạy qua hàm ánh xạ và tạo ra các phần tử được trả về bởi hàm ánh xạ (chứa trong iterator hoặc iterable khác).
- {{jsxref("Iterator.prototype.forEach()")}}
  - : Thực thi hàm được cung cấp một lần cho mỗi phần tử do iterator tạo ra.
- {{jsxref("Iterator.prototype.map()")}}
  - : Trả về đối tượng iterator helper mới tạo ra các phần tử của iterator, mỗi phần tử được biến đổi bởi hàm ánh xạ.
- {{jsxref("Iterator.prototype.reduce()")}}
  - : Thực thi hàm callback "reducer" do người dùng cung cấp trên mỗi phần tử do iterator tạo ra, truyền giá trị trả về từ phép tính trên phần tử trước đó. Kết quả cuối cùng của việc chạy reducer trên tất cả các phần tử là một giá trị duy nhất.
- {{jsxref("Iterator.prototype.some()")}}
  - : Trả về `true` nếu tìm thấy phần tử thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, nếu iterator cạn kiệt mà không tìm thấy phần tử như vậy, trả về `false`.
- {{jsxref("Iterator.prototype.take()")}}
  - : Trả về đối tượng iterator helper mới tạo ra số phần tử đã cho trong iterator này rồi kết thúc.
- {{jsxref("Iterator.prototype.toArray()")}}
  - : Tạo instance {{jsxref("Array")}} mới được điền bởi các phần tử do iterator tạo ra.
- [`Iterator.prototype[Symbol.dispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.dispose)
  - : Gọi phương thức `return()` của `this`, nếu nó tồn tại. Điều này triển khai _giao thức disposable_ và cho phép nó được xử lý khi sử dụng với {{jsxref("Statements/using", "using")}} hay {{jsxref("Statements/await_using", "await using")}}.
- [`Iterator.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.iterator)
  - : Trả về chính đối tượng iterator. Điều này cho phép các đối tượng iterator cũng có thể lặp.

## Ví dụ

### Sử dụng iterator như iterable

Tất cả các iterator tích hợp sẵn cũng có thể lặp, vì vậy bạn có thể sử dụng chúng trong vòng lặp `for...of`:

```js
const arrIterator = [1, 2, 3].values();
for (const value of arrIterator) {
  console.log(value);
}
// Logs: 1, 2, 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Iterator` in `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill of `Iterator` and associated helpers](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Statements/function*", "function*")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
