---
title: handler.apply()
short-title: apply()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/apply
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.apply
sidebar: jsref
---

Phương thức **`handler.apply()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Call]]`, được sử dụng bởi các thao tác như lời gọi hàm.

{{InteractiveExample("JavaScript Demo: handler.apply()", "taller")}}

```js interactive-example
function sum(a, b) {
  return a + b;
}

const handler = {
  apply(target, thisArg, argumentsList) {
    console.log(`Calculate sum: ${argumentsList}`);
    // Expected output: "Calculate sum: 1,2"

    return target(argumentsList[0], argumentsList[1]) * 10;
  },
};

const proxy = new Proxy(sum, handler);

console.log(sum(1, 2));
// Expected output: 3
console.log(proxy(1, 2));
// Expected output: 30
```

## Cú pháp

```js-nolint
new Proxy(target, {
  apply(target, thisArg, argumentsList) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `apply()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích có thể gọi được.
- `thisArg`
  - : Đối số `this` cho lời gọi.
- `argumentsList`
  - : Một {{jsxref("Array")}} chứa các đối số được truyền vào hàm.

### Giá trị trả về

Phương thức `apply()` có thể trả về bất kỳ giá trị nào, đại diện cho giá trị trả về của lời gọi hàm.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Lời gọi hàm: `proxy(...args)`
- {{jsxref("Function.prototype.apply()")}} và {{jsxref("Function.prototype.call()")}}
- {{jsxref("Reflect.apply()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Call]]`.

### Bất biến

Phương thức nội bộ `[[Call]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- `target` phải tự nó là đối tượng có thể gọi được. Tức là, nó phải là một đối tượng hàm.

## Ví dụ

### Bẫy lời gọi hàm

Đoạn mã sau bẫy một lời gọi hàm.

```js
const p = new Proxy(function () {}, {
  apply(target, thisArg, argumentsList) {
    console.log(`called: ${argumentsList}`);
    return argumentsList[0] + argumentsList[1] + argumentsList[2];
  },
});

console.log(p(1, 2, 3)); // "called: 1,2,3"
// 6
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Function.prototype.apply()")}}
- {{jsxref("Function.prototype.call()")}}
- {{jsxref("Reflect.apply()")}}
