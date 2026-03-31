---
title: Generator.prototype.next()
short-title: next()
slug: Web/JavaScript/Reference/Global_Objects/Generator/next
page-type: javascript-instance-method
browser-compat: javascript.builtins.Generator.next
sidebar: jsref
---

Phương thức **`next()`** của các thực thể {{jsxref("Generator")}} trả về một đối tượng với hai thuộc tính `done` và `value`. Bạn cũng có thể cung cấp tham số cho phương thức `next` để gửi một giá trị tới generator.

## Cú pháp

```js-nolint
next()
next(value)
```

### Tham số

- `value` {{optional_inline}}
  - : Giá trị để gửi tới generator.

    Giá trị này sẽ được gán là kết quả của biểu thức `yield`. Ví dụ, trong `variable = yield expression`, giá trị được truyền cho hàm `.next()` sẽ được gán cho `variable`.

### Giá trị trả về

Một {{jsxref("Object")}} với hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu generator đã vượt qua cuối luồng điều khiển của nó. Trong trường hợp này `value` chỉ định _giá trị trả về_ của generator (có thể là undefined).
    - `false` nếu generator có thể tạo thêm giá trị.
- `value`
  - : Bất kỳ giá trị JavaScript nào được yield hoặc trả về bởi generator.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu generator đang chạy.

## Ví dụ

### Sử dụng next()

Ví dụ sau cho thấy một generator và đối tượng mà phương thức `next` trả về:

```js
function* gen() {
  yield 1;
  yield 2;
  yield 3;
}

const g = gen(); // Generator { }
g.next(); // { value: 1, done: false }
g.next(); // { value: 2, done: false }
g.next(); // { value: 3, done: false }
g.next(); // { value: undefined, done: true }
```

### Sử dụng next() với danh sách

Trong ví dụ này, `getPage` nhận một danh sách và "phân trang" nó thành các đoạn có kích thước `pageSize`. Mỗi lần gọi `next` sẽ yield một đoạn như vậy.

```js
function* getPage(list, pageSize = 1) {
  for (let index = 0; index < list.length; index += pageSize) {
    yield list.slice(index, index + pageSize);
  }
}

const list = [1, 2, 3, 4, 5, 6, 7, 8];
const page = getPage(list, 3); // Generator { }

page.next(); // { value: [1, 2, 3], done: false }
page.next(); // { value: [4, 5, 6], done: false }
page.next(); // { value: [7, 8], done: false }
page.next(); // { value: undefined, done: true }
```

### Gửi giá trị tới generator

Trong ví dụ này, `next` được gọi với một giá trị.

> [!NOTE]
> Lần gọi đầu tiên không ghi nhật ký bất cứ điều gì, vì generator ban đầu không yield bất cứ thứ gì.

```js
function* gen() {
  while (true) {
    const value = yield;
    console.log(value);
  }
}

const g = gen();
g.next(1); // Trả về { value: undefined, done: false }
// Không có nhật ký ở bước này: giá trị đầu tiên được gửi qua `next` bị mất
g.next(2); // Trả về { value: undefined, done: false }
// Ghi nhật ký 2
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/function*", "function*")}}
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
