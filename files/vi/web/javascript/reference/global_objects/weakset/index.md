---
title: WeakSet
slug: Web/JavaScript/Reference/Global_Objects/WeakSet
page-type: javascript-class
browser-compat: javascript.builtins.WeakSet
sidebar: jsref
---

**`WeakSet`** là một tập hợp các giá trị có thể garbage collected, bao gồm các đối tượng và [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry). Một giá trị trong `WeakSet` chỉ được xuất hiện một lần. Nó là duy nhất trong tập hợp của `WeakSet`.

## Mô tả

Các giá trị của WeakSet phải là garbage-collectable. Hầu hết {{Glossary("Primitive", "các kiểu dữ liệu nguyên thủy")}} có thể được tạo tùy ý và không có vòng đời, vì vậy chúng không thể được lưu trữ. Đối tượng và [symbol không được đăng ký](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) có thể được lưu trữ vì chúng là garbage-collectable.

Các điểm khác biệt chính so với đối tượng {{jsxref("Set")}} là:

- `WeakSet` là tập hợp **chỉ gồm đối tượng và symbol**. Chúng không thể chứa các giá trị tùy ý của bất kỳ kiểu nào, như {{jsxref("Set")}} có thể.
- `WeakSet` là _weak_ (yếu), nghĩa là các tham chiếu đến các đối tượng trong `WeakSet` được giữ _yếu_. Nếu không có tham chiếu nào khác đến một giá trị được lưu trong `WeakSet`, những giá trị đó có thể bị garbage collected.

  > [!NOTE]
  > Điều này cũng có nghĩa là không có danh sách các giá trị hiện tại được lưu trong tập hợp. `WeakSet` không thể liệt kê.

### So sánh key

Giống như `Set` thông thường, so sánh giá trị dựa trên thuật toán [SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality), giống với toán tử `===` vì `WeakSet` chỉ có thể giữ các giá trị đối tượng và symbol. Điều này có nghĩa là đối với các giá trị đối tượng, sự bình đẳng dựa trên đồng nhất đối tượng. Chúng được so sánh theo [tham chiếu](/en-US/docs/Glossary/Object_reference), không phải theo giá trị.

## Constructor

- {{jsxref("WeakSet/WeakSet", "WeakSet()")}}
  - : Tạo một đối tượng `WeakSet` mới.

## Thuộc tính thể hiện

Các thuộc tính này được định nghĩa trên `WeakSet.prototype` và chia sẻ bởi tất cả các thể hiện `WeakSet`.

- {{jsxref("Object/constructor", "WeakSet.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng thể hiện. Đối với các thể hiện `WeakSet`, giá trị ban đầu là constructor {{jsxref("WeakSet/WeakSet", "WeakSet")}}.
- `WeakSet.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"WeakSet"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thể hiện

- {{jsxref("WeakSet.prototype.add()")}}
  - : Chèn giá trị được chỉ định vào set này, nếu nó chưa có.
- {{jsxref("WeakSet.prototype.delete()")}}
  - : Xóa giá trị được chỉ định khỏi set này, nếu nó có trong set.
- {{jsxref("WeakSet.prototype.has()")}}
  - : Trả về boolean cho biết giá trị được chỉ định có tồn tại trong `WeakSet` này hay không.

## Ví dụ

### Sử dụng đối tượng WeakSet

```js
const ws = new WeakSet();
const foo = {};
const bar = {};

ws.add(foo);
ws.add(bar);

ws.has(foo); // true
ws.has(bar); // true

ws.delete(foo); // removes foo from the set
ws.has(foo); // false, foo has been removed
ws.has(bar); // true, bar is retained
```

Lưu ý rằng `foo !== bar`. Mặc dù chúng là các đối tượng tương tự, _chúng không phải **cùng một đối tượng**_. Và vì vậy cả hai đều được thêm vào set.

### Phát hiện tham chiếu vòng

Các hàm gọi đệ quy chính mình cần một cách để bảo vệ chống lại các cấu trúc dữ liệu vòng bằng cách theo dõi những đối tượng nào đã được xử lý.

`WeakSet` là lý tưởng cho mục đích này:

```js
// Execute a callback on everything stored inside an object
function execRecursively(fn, subject, _refs = new WeakSet()) {
  // Avoid infinite recursion
  if (_refs.has(subject)) {
    return;
  }

  fn(subject);
  if (typeof subject === "object" && subject) {
    _refs.add(subject);
    for (const key in subject) {
      execRecursively(fn, subject[key], _refs);
    }
    _refs.delete(subject);
  }
}

const foo = {
  foo: "Foo",
  bar: {
    bar: "Bar",
  },
};

foo.bar.baz = foo; // Circular reference!
execRecursively((obj) => console.log(obj), foo);
```

Ở đây, một `WeakSet` được tạo trong lần chạy đầu tiên, và được truyền cùng với mỗi lần gọi hàm tiếp theo (sử dụng tham số nội bộ `_refs`).

Số lượng đối tượng hoặc thứ tự duyệt của chúng không quan trọng, vì vậy `WeakSet` phù hợp hơn (và hiệu quả hơn) so với {{jsxref("Set")}} để theo dõi các tham chiếu đối tượng, đặc biệt nếu có một số lượng rất lớn các đối tượng liên quan.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `WeakSet` trong `core-js`](https://github.com/zloirock/core-js#weakset)
- {{jsxref("Map")}}
- {{jsxref("Set")}}
- {{jsxref("WeakMap")}}
