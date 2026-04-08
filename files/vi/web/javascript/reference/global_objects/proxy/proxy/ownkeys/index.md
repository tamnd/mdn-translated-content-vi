---
title: handler.ownKeys()
short-title: ownKeys()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/ownKeys
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.ownKeys
sidebar: jsref
---

Phương thức **`handler.ownKeys()`** là một trap cho [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[OwnPropertyKeys]]` của đối tượng, được sử dụng bởi các thao tác như {{jsxref("Object.keys()")}}, {{jsxref("Reflect.ownKeys()")}}, v.v.

{{InteractiveExample("JavaScript Demo: handler.ownKeys()", "taller")}}

```js interactive-example
const monster = {
  _age: 111,
  [Symbol("secret")]: "I am scared!",
  eyeCount: 4,
};

const handler = {
  ownKeys(target) {
    return Reflect.ownKeys(target);
  },
};

const proxy = new Proxy(monster, handler);

for (const key of Object.keys(proxy)) {
  console.log(key);
  // Expected output: "_age"
  // Expected output: "eyeCount"
}
```

## Cú pháp

```js-nolint
new Proxy(target, {
  ownKeys(target) {
  }
})
```

### Tham số

Tham số sau được truyền vào phương thức `ownKeys()`. `this` được gắn với handler.

- `target`
  - : Đối tượng đích.

### Giá trị trả về

Phương thức `ownKeys()` phải trả về một [đối tượng giống mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#array-like_objects) trong đó mỗi phần tử là {{jsxref("String")}} hoặc {{jsxref("Symbol")}} và không có phần tử trùng lặp.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Object.getOwnPropertySymbols()")}}
- {{jsxref("Object.keys()")}}
- {{jsxref("Reflect.ownKeys()")}}

Hoặc bất kỳ thao tác nào khác gọi đến [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[OwnPropertyKeys]]`.

### Các bất biến

Phương thức nội bộ `[[OwnPropertyKeys]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Kết quả phải là một {{jsxref("Object")}}.
- Danh sách các key không được chứa giá trị trùng lặp.
- Kiểu của mỗi key phải là {{jsxref("String")}} hoặc {{jsxref("Symbol")}}.
- Danh sách kết quả phải chứa các key của tất cả thuộc tính own non-configurable của đối tượng đích. Tức là, đối với tất cả các key được trả về bởi {{jsxref("Reflect.ownKeys()")}} trên đối tượng đích, nếu key đó có `configurable: false` theo {{jsxref("Reflect.getOwnPropertyDescriptor()")}}, thì key đó phải có trong danh sách kết quả.
- Nếu đối tượng đích không thể mở rộng (not extensible), thì danh sách kết quả phải chứa tất cả các key của các thuộc tính own của đối tượng đích và không có giá trị nào khác. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` trên `target`, thì danh sách kết quả phải chứa các giá trị giống hệt kết quả của {{jsxref("Reflect.ownKeys()")}} trên `target`.

## Ví dụ

### Chặn getOwnPropertyNames

Đoạn code sau chặn {{jsxref("Object.getOwnPropertyNames()")}}.

```js
const p = new Proxy(
  {},
  {
    ownKeys(target) {
      console.log("called");
      return ["a", "b", "c"];
    },
  },
);

console.log(Object.getOwnPropertyNames(p));
// "called"
// [ 'a', 'b', 'c' ]
```

Đoạn code sau vi phạm một bất biến.

```js example-bad
const obj = {};
Object.defineProperty(obj, "a", {
  configurable: false,
  enumerable: true,
  value: 10,
});

const p = new Proxy(obj, {
  ownKeys(target) {
    return [123, 12.5, true, false, undefined, null, {}, []];
  },
});

console.log(Object.getOwnPropertyNames(p));

// TypeError: proxy [[OwnPropertyKeys]] must return an array
// with only string and symbol elements
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Constructor `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Reflect.ownKeys()")}}
