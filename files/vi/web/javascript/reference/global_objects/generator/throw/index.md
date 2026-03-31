---
title: Generator.prototype.throw()
short-title: throw()
slug: Web/JavaScript/Reference/Global_Objects/Generator/throw
page-type: javascript-instance-method
browser-compat: javascript.builtins.Generator.throw
sidebar: jsref
---

Phương thức **`throw()`** của các thực thể {{jsxref("Generator")}} hoạt động như thể câu lệnh `throw` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, thông báo cho generator về một điều kiện lỗi và cho phép nó xử lý lỗi hoặc thực hiện dọn dẹp và đóng lại.

## Cú pháp

<!-- Thông thường chúng ta không thêm chủ ngữ "generatorInstance" cho các phương thức. Tuy nhiên, ở đây là cần thiết vì "throw" là từ khóa, vì vậy nếu không thì cú pháp không hợp lệ. -->

```js-nolint
generatorInstance.throw(exception)
```

### Tham số

- `exception`
  - : Ngoại lệ cần ném ra. Để mục đích gỡ lỗi, nó hữu ích khi là `instanceof` {{jsxref("Error")}}.

### Giá trị trả về

Nếu ngoại lệ được ném ra bị bắt bởi [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) và generator tiếp tục để yield thêm giá trị, nó sẽ trả về một {{jsxref("Object")}} với hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu luồng điều khiển của hàm generator đã đến cuối.
    - `false` nếu hàm generator có thể tạo thêm giá trị.
- `value`
  - : Giá trị được yield từ biểu thức `yield` tiếp theo.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu generator đang chạy.

Nếu `exception` không bị bắt bởi `try...catch` trong hàm generator, nó cũng được ném ra cho người gọi của `throw()`.

## Mô tả

Phương thức `throw()`, khi được gọi, có thể được coi như thể câu lệnh `throw exception;` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, trong đó `exception` là ngoại lệ được truyền cho phương thức `throw()`. Do đó, trong luồng thông thường, gọi `throw(exception)` sẽ khiến generator ném ra ngoại lệ. Tuy nhiên, nếu biểu thức `yield` được bọc trong khối `try...catch`, lỗi có thể bị bắt và luồng điều khiển có thể tiếp tục sau khi xử lý lỗi, hoặc thoát ra một cách ưu thế.

## Ví dụ

### Sử dụng throw()

Ví dụ sau cho thấy một generator và một lỗi được ném ra bằng phương thức `throw`. Lỗi có thể bị bắt bởi khối {{jsxref("Statements/try...catch", "try...catch")}} như thông thường.

```js
function* gen() {
  while (true) {
    try {
      yield 42;
    } catch (e) {
      console.log("Error caught!");
    }
  }
}

const g = gen();
g.next();
// { value: 42, done: false }
g.throw(new Error("Something went wrong"));
// "Error caught!"
// { value: 42, done: false }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/function*", "function*")}}
