---
title: handler.getOwnPropertyDescriptor()
short-title: getOwnPropertyDescriptor()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/getOwnPropertyDescriptor
page-type: javascript-instance-method
browser-compat: javascript.builtins.Proxy.handler.getOwnPropertyDescriptor
sidebar: jsref
---

Phương thức **`handler.getOwnPropertyDescriptor()`** là một trap cho [phương thức nội bộ đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[GetOwnProperty]]`, được sử dụng bởi các thao tác như {{jsxref("Object.getOwnPropertyDescriptor()")}}.

{{InteractiveExample("JavaScript Demo: handler.getOwnPropertyDescriptor()", "taller")}}

```js interactive-example
const monster = {
  eyeCount: 4,
};

const handler = {
  getOwnPropertyDescriptor(target, prop) {
    console.log(`called: ${prop}`);
    // Expected output: "called: eyeCount"

    return { configurable: true, enumerable: true, value: 5 };
  },
};

const proxy = new Proxy(monster, handler);

console.log(Object.getOwnPropertyDescriptor(proxy, "eyeCount").value);
// Expected output: 5
```

## Cú pháp

```js-nolint
new Proxy(target, {
  getOwnPropertyDescriptor(target, property) {
  }
})
```

### Tham số

Các tham số sau được truyền vào phương thức `getOwnPropertyDescriptor()`. `this` được ràng buộc với handler.

- `target`
  - : Đối tượng đích.
- `property`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} đại diện cho tên thuộc tính.

### Giá trị trả về

Phương thức `getOwnPropertyDescriptor()` phải trả về một đối tượng hoặc `undefined`, đại diện cho property descriptor. Các thuộc tính còn thiếu được chuẩn hóa theo cách giống như {{jsxref("Object.defineProperty()")}}.

## Mô tả

### Các thao tác bị chặn

Trap này có thể chặn các thao tác sau:

- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- {{jsxref("Reflect.getOwnPropertyDescriptor()")}}

Hoặc bất kỳ thao tác nào khác gọi [phương thức nội bộ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) `[[GetOwnProperty]]`.

### Bất biến

Phương thức nội bộ `[[GetOwnProperty]]` của proxy ném ra {{jsxref("TypeError")}} nếu định nghĩa handler vi phạm một trong các bất biến sau:

- Kết quả phải là một {{jsxref("Object")}} hoặc `undefined`.
- Một thuộc tính không thể được báo cáo là không tồn tại, nếu nó tồn tại như là thuộc tính riêng không cấu hình được của đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false` cho thuộc tính trên `target`, thì trap không được trả về `undefined`.
- Một thuộc tính không thể được báo cáo là không tồn tại, nếu nó tồn tại như là thuộc tính riêng của một đối tượng đích không thể mở rộng. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` cho đối tượng đích, thì trap không được trả về `undefined`.
- Một thuộc tính không thể được báo cáo là tồn tại, nếu nó không tồn tại như là thuộc tính riêng của đối tượng đích và đối tượng đích không thể mở rộng. Tức là, nếu {{jsxref("Reflect.isExtensible()")}} trả về `false` cho đối tượng đích, và {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `undefined` cho thuộc tính trên `target`, thì trap phải trả về `undefined`.
- Một thuộc tính không thể được báo cáo là không cấu hình được, trừ khi nó tồn tại như là thuộc tính riêng không cấu hình được của đối tượng đích. Tức là, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `undefined` hoặc `configurable: true` cho thuộc tính trên `target`, thì trap không được trả về `configurable: false`.
- Một thuộc tính không thể được báo cáo vừa là không cấu hình được vừa là không ghi được, trừ khi nó tồn tại như là thuộc tính riêng không cấu hình được, không ghi được của đối tượng đích. Tức là, ngoài bất biến trước đó, nếu {{jsxref("Reflect.getOwnPropertyDescriptor()")}} trả về `configurable: false, writable: true` cho thuộc tính trên `target`, thì trap không được trả về `configurable: false, writable: false`.
- Nếu một thuộc tính có thuộc tính tương ứng trên đối tượng đích, thì property descriptor của đối tượng đích phải tương thích với `descriptor`. Tức là, giả sử `target` là một đối tượng thông thường, thì {{jsxref("Object/defineProperty", "Object.defineProperty(target, property, resultObject)")}} không được ném ra lỗi. Tài liệu tham khảo `Object.defineProperty()` chứa thêm thông tin, nhưng tóm lại, khi thuộc tính đích không cấu hình được, các điều sau phải đúng:
  - `configurable`, `enumerable`, `get`, và `set` phải giống như ban đầu. `writable` cũng phải giống như ban đầu theo bất biến trước đó.
  - thuộc tính phải tiếp tục là data hoặc accessor
  - thuộc tính `value` chỉ có thể thay đổi nếu `writable` là `true`

## Ví dụ

### Bẫy getOwnPropertyDescriptor

Đoạn mã sau bẫy {{jsxref("Object.getOwnPropertyDescriptor()")}}.

```js
const p = new Proxy(
  { a: 20 },
  {
    getOwnPropertyDescriptor(target, prop) {
      console.log(`called: ${prop}`);
      return { configurable: true, enumerable: true, value: 10 };
    },
  },
);

console.log(Object.getOwnPropertyDescriptor(p, "a").value);
// "called: a"
// 10
```

Đoạn mã sau vi phạm bất biến.

```js example-bad
const obj = { a: 10 };
Object.preventExtensions(obj);
const p = new Proxy(obj, {
  getOwnPropertyDescriptor(target, prop) {
    return undefined;
  },
});

Object.getOwnPropertyDescriptor(p, "a"); // TypeError is thrown
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
- [Hàm tạo `Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy)
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- {{jsxref("Reflect.getOwnPropertyDescriptor()")}}
