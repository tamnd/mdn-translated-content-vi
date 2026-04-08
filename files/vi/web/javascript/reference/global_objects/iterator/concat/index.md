---
title: Iterator.concat()
short-title: concat()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/concat
page-type: javascript-static-method
browser-compat: javascript.builtins.Iterator.concat
sidebar: jsref
---

Phương thức tĩnh **`Iterator.concat()`** tạo một đối tượng {{jsxref("Iterator")}} mới từ danh sách các đối tượng có thể lặp. Iterator mới sẽ yield các giá trị từ mỗi iterable đầu vào theo thứ tự.

## Cú pháp

```js-nolint
Iterator.concat(it)
Iterator.concat(it1, it2)
Iterator.concat(it1, it2, /* …, */ itN)
```

### Tham số

- `it1`, `it2`, …, `itN`
  - : Một đối tượng triển khai giao thức [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Các [Iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) không đồng thời là iterable không thể được truyền trực tiếp vào phương thức này; chúng phải được bọc bằng {{jsxref("Iterator.from()")}} trước.

### Giá trị trả về

Một đối tượng {{jsxref("Iterator")}} mới yield các giá trị từ mỗi iterable đầu vào theo thứ tự.

## Mô tả

Phương thức `Iterator.concat()` về mặt khái niệm tương tự như phương thức [`concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) của `Array`, nhưng nó hoạt động trên bất kỳ loại iterable nào và trả về một iterator thay vì mảng. Điều này có nghĩa là các iterable có thể được lặp một cách lười biếng, tránh việc cấp phát hoặc tính toán không cần thiết. Nó cũng có nghĩa là về mặt kỹ thuật, bạn có thể [nối các _iterable vô hạn_](#nối_các_iterable_vô_hạn), nhưng kết quả từ các iterable sau iterable vô hạn đầu tiên sẽ không bao giờ đạt được.

Trong khi mỗi iterable có thể là vô hạn, danh sách các iterable phải là hữu hạn — và khá giới hạn về số lượng vì các engine áp đặt giới hạn rất thấp trên số lượng đối số của hàm. Nếu bạn cần nối một số lượng lớn — thậm chí vô hạn — các iterable, hãy sử dụng {{jsxref("Iterator.prototype.flatMap()")}} thay thế.

```js
function* infiniteIterables() {
  for (let i = 1; ; i++) {
    yield Array(i).fill(i);
  }
}

// KHÔNG TỐT:
// Iterator.concat(...infiniteIterables());
// Toán tử spread không bao giờ kết thúc

// TỐT:
const it = infiniteIterables().flatMap((x) => x);
// Dãy số vô hạn: 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, ...
```

Phương thức `Iterator.concat()` có chức năng tương tự như hàm sau, sử dụng toán tử [`yield*`](/en-US/docs/Web/JavaScript/Reference/Operators/yield*) để yield các giá trị từ mỗi iterable đầu vào theo thứ tự:

```js
function* concat(...iterables) {
  for (const iterable of iterables) {
    yield* iterable;
  }
}
```

Giống như `yield*`, `Iterator.concat()` không hỗ trợ các đối số không phải iterable (tức là không có phương thức `[Symbol.iterator]()`). Điều này là vì `Iterator.concat()` luôn nhận quyền sở hữu các iterator của nó và [đóng](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#returnvalue) các iterator đang mở khi phương thức thoát. Với các đối số iterable, `Iterator.concat()` lấy các iterator từng cái một và chỉ đóng iterator hiện tại khi quá trình lặp bị dừng. Với các đối số iterator, không rõ liệu người gọi hay `Iterator.concat()` chịu trách nhiệm đóng các iterator, đặc biệt là những iterator mà `Iterator.concat()` chưa đến, vì vậy phương thức đơn giản là không cho phép các đối số không phải iterable.

## Ví dụ

### Kết hợp các map

Trong ví dụ này, chúng ta tạo một {{jsxref("Map")}} mới là hợp nhất của ba map khác. Hàm tạo {{jsxref("Map/Map", "Map()")}} chấp nhận một iterable gồm các cặp key-value, trong khi [Map iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator) yield các cặp key-value từ map, vì vậy chỉ cần sử dụng `Iterator.concat()` trên các map là đủ để tạo map mới.

```js
const map1 = new Map([
  ["a", 1],
  ["b", 2],
]);
const map2 = new Map([
  ["c", 3],
  ["d", 4],
]);
const map3 = new Map([
  ["a", 5],
  ["e", 6],
]);

const map = new Map(Iterator.concat(map1, map2, map3));
console.log(map);
// Map(5) {'a' => 5, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 6}
```

Lưu ý rằng giá trị của key `"a"` trong map kết quả là `5`. Điều này vì hàm tạo `Map` sử dụng giá trị cuối cùng cho mỗi key.

### Nối các iterable vô hạn

Khi bất kỳ iterable đầu vào nào là vô hạn, iterator kết quả cũng sẽ vô hạn. Điều này không ngay lập tức là vấn đề vì các iterator có thể được tiêu thụ một cách lười biếng và đóng bất cứ lúc nào, nhưng có nghĩa là các iterable sau iterable vô hạn đầu tiên sẽ không bao giờ đạt được.

```js
function* it1() {
  yield 1;
  yield 2;
}

function* it2() {
  let i = 3;
  while (true) {
    yield i++;
  }
}

function* it3() {
  yield "done";
}

const it = Iterator.concat(it1(), it2(), it3());
for (const value of it.take(10)) {
  console.log(value); // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
}
// "done" không bao giờ đạt được
```

### Nối các iterable khác kiểu

Bạn có thể nối các iterable khác kiểu nhau.

```js
const array = [1, 2, 3];
const set = new Set([4, 5, 6]);
function* gen() {
  yield 7;
  yield 8;
  yield 9;
}

const it = Iterator.concat(array, set, gen());
console.log([...it]); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

Các phần tử của mỗi iterable cũng có thể là các kiểu khác nhau, giống như mảng.

```js
const array = [1, "two", 3];
const set = new Set([true, {}]);

const it = Iterator.concat(array, set);
console.log([...it]); // [1, "two", 3, true, {}]
```

### Nối các đối tượng không phải iterable

Các đối tượng không phải iterable ném ra `TypeError` khi được truyền vào `Iterator.concat()` vì chúng không có phương thức `[Symbol.iterator]()`.

```js
const nonIterable = {
  next() {
    return { done: true };
  },
};

const it = Iterator.concat(nonIterable); // TypeError: object is not iterable
```

Vì tất cả các iterator tích hợp đều kế thừa từ lớp {{jsxref("Iterator")}}, chúng đều là iterable và có thể được truyền vào `Iterator.concat()`.

```js
const arrayIterator = [1, 2, 3][Symbol.iterator]();

const it = Iterator.concat(arrayIterator); // Không có lỗi
```

Để truyền một iterator không đồng thời là iterable, bạn có thể bọc nó bằng {{jsxref("Iterator.from()")}}.

```js
const nonIterable = {
  next() {
    return { done: true };
  },
};

const it = Iterator.concat(Iterator.from(nonIterable)); // Không có lỗi
```

Một lựa chọn khác là sử dụng {{jsxref("Iterator.prototype.flatMap()")}} thay thế, vì nó tự động gọi `Iterator.from()`. Nhưng hãy cẩn thận: bạn cần gọi `flatMap()` trên một iterator, không phải trên một mảng, vì {{jsxref("Array.prototype.flatMap()")}} chỉ hỗ trợ giá trị trả về là mảng.

```js
const nonIterable = {
  next() {
    return { done: true };
  },
};

const it = [nonIterable].values().flatMap((x) => x); // Không có lỗi
```

Khi triển khai các iterator của riêng bạn, hãy cân nhắc làm cho chúng có thể lặp bằng cách [kế thừa từ `Iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Iterator#subclassing_iterator) hoặc thêm phương thức `[Symbol.iterator]()` trả về `this`.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.concat` trong `core-js`](https://github.com/zloirock/core-js#iterator-sequencing)
- [es-shims polyfill của `Iterator.concat`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.from()")}}
- {{jsxref("Array.prototype.concat()")}}
