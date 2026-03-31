---
title: Proxy.revocable()
short-title: revocable()
slug: Web/JavaScript/Reference/Global_Objects/Proxy/revocable
page-type: javascript-static-method
browser-compat: javascript.builtins.Proxy.revocable
sidebar: jsref
---

Phương thức tĩnh **`Proxy.revocable()`** tạo một đối tượng {{jsxref("Proxy")}} có thể thu hồi.

## Cú pháp

```js-nolint
Proxy.revocable(target, handler)
```

### Tham số

- `target`
  - : Đối tượng target cần bọc với `Proxy`. Có thể là bất kỳ loại đối tượng nào, bao gồm mảng gốc, hàm, hoặc thậm chí một proxy khác.
- `handler`
  - : Một đối tượng có các thuộc tính là hàm xác định hành vi của `proxy` khi một thao tác được thực hiện trên nó.

### Giá trị trả về

Một đối tượng thuần với hai thuộc tính sau:

- `proxy`
  - : Một đối tượng Proxy giống hệt như được tạo bằng lời gọi [`new Proxy(target, handler)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy).
- `revoke`
  - : Một hàm không có tham số để thu hồi (tắt) `proxy`.

## Mô tả

Hàm factory `Proxy.revocable()` giống như constructor [`Proxy()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy), ngoại trừ việc ngoài tạo một đối tượng proxy, nó còn tạo một hàm `revoke` có thể được gọi để vô hiệu hóa proxy. Đối tượng proxy và hàm `revoke` được bọc trong một đối tượng thuần.

Hàm `revoke` không nhận bất kỳ tham số nào, cũng không dựa vào giá trị `this`. Đối tượng `proxy` được tạo ra được gắn với hàm `revoke` như một [private field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) mà hàm `revoke` truy cập trên chính nó khi được gọi (sự tồn tại của private field không thể quan sát từ bên ngoài, nhưng nó có ảnh hưởng đến cách thu gom rác xảy ra). Đối tượng `proxy` _không_ bị bắt giữ trong [closure](/en-US/docs/Web/JavaScript/Guide/Closures) của hàm `revoke` (điều này sẽ làm cho việc thu gom rác của `proxy` không thể thực hiện nếu `revoke` vẫn còn tồn tại).

Sau khi hàm `revoke()` được gọi, proxy trở nên không thể sử dụng: bất kỳ trap nào đến handler đều ném ra {{jsxref("TypeError")}}. Khi một proxy đã bị thu hồi, nó vẫn bị thu hồi, và gọi `revoke()` lại không có hiệu lực — thực ra, lời gọi `revoke()` tách đối tượng `proxy` khỏi hàm `revoke`, nên hàm `revoke` sẽ không thể truy cập proxy nữa. Nếu proxy không được tham chiếu ở nơi nào khác, nó sẽ đủ điều kiện để thu gom rác. Hàm `revoke` cũng tách `target` và `handler` khỏi `proxy`, nên nếu `target` không được tham chiếu ở nơi nào khác, nó cũng sẽ đủ điều kiện để thu gom rác, ngay cả khi proxy của nó vẫn còn tồn tại, vì không còn cách nào để tương tác có ý nghĩa với đối tượng target nữa.

Cho phép người dùng tương tác với một đối tượng thông qua proxy có thể thu hồi cho phép bạn [kiểm soát vòng đời](/en-US/docs/Web/JavaScript/Guide/Memory_management) của đối tượng được tiếp xúc với người dùng — bạn có thể làm cho đối tượng đủ điều kiện để thu gom rác ngay cả khi người dùng vẫn đang giữ tham chiếu đến proxy của nó.

## Ví dụ

### Sử dụng Proxy.revocable()

```js
const revocable = Proxy.revocable(
  {},
  {
    get(target, name) {
      return `[[${name}]]`;
    },
  },
);
const proxy = revocable.proxy;
console.log(proxy.foo); // "[[foo]]"

revocable.revoke();

console.log(proxy.foo); // TypeError is thrown
proxy.foo = 1; // TypeError again
delete proxy.foo; // still TypeError
typeof proxy; // "object", typeof doesn't trigger any trap
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Proxy")}}
