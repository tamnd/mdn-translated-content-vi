---
title: Proxy() constructor
short-title: Proxy()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy
page-type: javascript-constructor
browser-compat: javascript.builtins.Proxy.Proxy
sidebar: jsref
---

Constructor **`Proxy()`** tạo các đối tượng {{jsxref("Proxy")}}.

## Cú pháp

```js-nolint
new Proxy(target, handler)
```

> [!NOTE]
> `Proxy()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `target`
  - : Đối tượng target cần bọc với `Proxy`. Có thể là bất kỳ loại đối tượng nào, bao gồm mảng gốc, hàm, hoặc thậm chí một proxy khác.
- `handler`
  - : Một đối tượng có các thuộc tính là hàm xác định hành vi của proxy khi một thao tác được thực hiện trên nó.

## Mô tả

Dùng constructor `Proxy()` để tạo một đối tượng `Proxy` mới. Constructor này nhận hai đối số bắt buộc:

- `target` là đối tượng bạn muốn tạo proxy
- `handler` là đối tượng xác định hành vi tùy chỉnh của proxy.

Một handler rỗng sẽ tạo ra một proxy hoạt động, trong hầu hết các khía cạnh, giống hệt target. Bằng cách định nghĩa bất kỳ hàm nào trong một tập hợp các hàm trên đối tượng `handler`, bạn có thể tùy chỉnh các khía cạnh cụ thể trong hành vi của proxy. Ví dụ, bằng cách định nghĩa `get()` bạn có thể cung cấp phiên bản tùy chỉnh cho [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) của target.

### Các hàm handler

Phần này liệt kê tất cả các hàm handler bạn có thể định nghĩa. Các hàm handler đôi khi được gọi là _trap_, vì chúng bắt các lời gọi đến đối tượng target.

- {{jsxref("Proxy/Proxy/apply", "handler.apply()")}}
  - : Một trap cho lời gọi hàm.
- {{jsxref("Proxy/Proxy/construct", "handler.construct()")}}
  - : Một trap cho toán tử {{jsxref("Operators/new", "new")}}.
- {{jsxref("Proxy/Proxy/defineProperty", "handler.defineProperty()")}}
  - : Một trap cho {{jsxref("Object.defineProperty")}}.
- {{jsxref("Proxy/Proxy/deleteProperty", "handler.deleteProperty()")}}
  - : Một trap cho toán tử {{jsxref("Operators/delete", "delete")}}.
- {{jsxref("Proxy/Proxy/get", "handler.get()")}}
  - : Một trap cho việc lấy giá trị thuộc tính.
- {{jsxref("Proxy/Proxy/getOwnPropertyDescriptor", "handler.getOwnPropertyDescriptor()")}}
  - : Một trap cho {{jsxref("Object.getOwnPropertyDescriptor")}}.
- {{jsxref("Proxy/Proxy/getPrototypeOf", "handler.getPrototypeOf()")}}
  - : Một trap cho {{jsxref("Object.getPrototypeOf")}}.
- {{jsxref("Proxy/Proxy/has", "handler.has()")}}
  - : Một trap cho toán tử {{jsxref("Operators/in", "in")}}.
- {{jsxref("Proxy/Proxy/isExtensible", "handler.isExtensible()")}}
  - : Một trap cho {{jsxref("Object.isExtensible")}}.
- {{jsxref("Proxy/Proxy/ownKeys", "handler.ownKeys()")}}
  - : Một trap cho {{jsxref("Object.getOwnPropertyNames")}} và {{jsxref("Object.getOwnPropertySymbols")}}.
- {{jsxref("Proxy/Proxy/preventExtensions", "handler.preventExtensions()")}}
  - : Một trap cho {{jsxref("Object.preventExtensions")}}.
- {{jsxref("Proxy/Proxy/set", "handler.set()")}}
  - : Một trap cho việc thiết lập giá trị thuộc tính.
- {{jsxref("Proxy/Proxy/setPrototypeOf", "handler.setPrototypeOf()")}}
  - : Một trap cho {{jsxref("Object.setPrototypeOf")}}.

## Ví dụ

### Chọn lọc proxy các property accessor

Trong ví dụ này, target có hai thuộc tính, `notProxied` và `proxied`. Chúng ta định nghĩa một handler trả về giá trị khác cho `proxied`, và cho phép bất kỳ truy cập nào khác đi thẳng đến target.

```js
const target = {
  notProxied: "original value",
  proxied: "original value",
};

const handler = {
  get(target, prop, receiver) {
    if (prop === "proxied") {
      return "replaced value";
    }
    return Reflect.get(...arguments);
  },
};

const proxy = new Proxy(target, handler);

console.log(proxy.notProxied); // "original value"
console.log(proxy.proxied); // "replaced value"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Lập trình meta](/en-US/docs/Web/JavaScript/Guide/Meta_programming)
- {{jsxref("Reflect")}}
