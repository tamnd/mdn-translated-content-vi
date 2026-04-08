---
title: handler.construct()
short-title: construct()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/construct
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.construct
sidebar: jsref
---

Phương thức **`handler.construct()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Construct]]`, được sử dụng bởi các thao tác như toán tử {{jsxref("Operators/new", "new")}}. Để thao tác new hợp lệ trên đối tượng Proxy kết quả, target được dùng để khởi tạo proxy phải tự nó là một constructor hợp lệ.

{{InteractiveExample("JavaScript Demo: handler.construct()", "taller")}}

```js interactive-example
function Monster(disposition) {
  this.disposition = disposition;
}

const handler = {
  construct(target, args) {
    console.log(`Creating a ${target.name}`);
    // Expected output: "Creating a monster"

    return new target(...args);
  },
};

const ProxiedMonster = new Proxy(Monster, handler);

console.log(new ProxiedMonster("fierce").disposition);
// Expected output: "fierce"
```

## Cú pháp

```js-nolint
new Proxy(target, {
  construct(target, argumentsList, newTarget) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `construct()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng constructor đích.
- `argumentsList`
  - : Một {{jsxref("Array")}} chứa các đối số được truyền vào constructor.
- `newTarget`
  - : Constructor ban đầu được gọi.

### Giá trị trả về

Phương thức `construct()` phải trả về một đối tượng, đại diện cho đối tượng mới được tạo.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new): `new myFunction(...args)`
- {{jsxref("Reflect.construct()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[Construct]]`.

### Bất biến

Phương thức nội bộ `[[Construct]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- `target` phải tự nó là constructor.
- Kết quả phải là một {{jsxref("Object")}}.

## Ví dụ

### Bẫy toán tử new

Đoạn mã sau bẫy toán tử {{jsxref("Operators/new", "new")}}.

```js
const p = new Proxy(function () {}, {
  construct(target, argumentsList, newTarget) {
    console.log(`called: ${argumentsList}`);
    return { value: argumentsList[0] * 10 };
  },
});

console.log(new p(1).value); // "called: 1"
// 10
```

Đoạn mã sau vi phạm bất biến.

```js example-bad
const p = new Proxy(function () {}, {
  construct(target, argumentsList, newTarget) {
    return 1;
  },
});

new p(); // TypeError is thrown
```

Đoạn mã sau khởi tạo proxy không đúng cách. `target` trong khởi tạo Proxy phải tự nó là một constructor hợp lệ cho toán tử {{jsxref("Operators/new", "new")}}.

```js example-bad
const p = new Proxy(
  {},
  {
    construct(target, argumentsList, newTarget) {
      return {};
    },
  },
);

new p(); // TypeError is thrown, "p" is not a constructor
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Operators/new", "new")}}
- {{jsxref("Reflect.construct()")}}
