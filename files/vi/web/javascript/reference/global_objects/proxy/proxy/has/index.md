---
title: handler.has()
short-title: has()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/has
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.has
sidebar: jsref
---

Phương thức **`handler.has()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[HasProperty]]`, được sử dụng bởi các thao tác như toán tử {{jsxref("Operators/in", "in")}}.

{{InteractiveExample("JavaScript Demo: handler.has()", "taller")}}

```js interactive-example
const handler = {
  has(target, key) {
    if (key[0] === "_") {
      return false;
    }
    return key in target;
  },
};

const monster = {
  _secret: "easily scared",
  eyeCount: 4,
};

const proxy = new Proxy(monster, handler);
console.log("eyeCount" in proxy);
// Expected output: true

console.log("_secret" in proxy);
// Expected output: false

console.log("_secret" in monster);
// Expected output: true
```

## Cú pháp

```js-nolint
new Proxy(target, {
  has(target, property) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `has()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.

### Giá trị trả về

Phương thức `has()` phải trả về một {{jsxref("Boolean")}} chỉ ra liệu thuộc tính có tồn tại hay không. Các giá trị khác được [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- Toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in): `foo in proxy`
- Kiểm tra [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with): `with(proxy) { (foo); }`
- {{jsxref("Reflect.has()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[HasProperty]]`.

### Bất biến

Phương thức nội bộ `[[HasProperty]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Một thuộc tính không thể được báo cáo là không tồn tại, nếu nó tồn tại như là thuộc tính riêng không cấu hình được của đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false` cho thuộc tính trên `target`, trap phải trả về `true`.
- Một thuộc tính không thể được báo cáo là không tồn tại, nếu nó tồn tại như là thuộc tính riêng của đối tượng đích và đối tượng đích không thể mở rộng. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`, và {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về một property descriptor cho thuộc tính trên `target`, trap phải trả về `true`.

## Ví dụ

### Bẫy toán tử in

Đoạn mã sau bẫy toán tử {{jsxref("Operators/in", "in")}}.

```js
const p = new Proxy(
  {},
  {
    has(target, prop) {
      console.log(`called: ${prop}`);
      return true;
    },
  },
);

console.log("a" in p);
// "called: a"
// true
```

Đoạn mã sau vi phạm bất biến.

```js example-bad
const obj = { a: 10 };
Object.preventExtensions(obj);

const p = new Proxy(obj, {
  has(target, prop) {
    return false;
  },
});

"a" in p; // TypeError is thrown
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Operators/in", "in")}}
- {{jsxref("Reflect.has()")}}
