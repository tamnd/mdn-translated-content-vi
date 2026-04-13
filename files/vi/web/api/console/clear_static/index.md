---
title: "console: phương thức tĩnh clear()"
short-title: clear()
slug: Web/API/console/clear_static
page-type: web-api-static-method
browser-compat: api.console.clear_static
---

{{APIRef("Console API")}}

Phương thức tĩnh **`console.clear()`** xóa console nếu có thể.

Một console đồ họa, như trong các trình duyệt web, sẽ loại bỏ toàn bộ thông báo trước đó; một console hiển thị trong terminal, như trong Node.js, sẽ cố gắng xóa bằng mã escape hoặc API hệ thống; nếu không thì phương thức này sẽ không có tác dụng nào (và cũng không báo lỗi).

## Cú pháp

```js-nolint
console.clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.clear()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#clear)
- [Tài liệu của Node.js về `console.clear()`](https://nodejs.org/docs/latest/api/console.html#consoleclear)
- [Tài liệu của Google Chrome về `console.clear()`](https://developer.chrome.com/docs/devtools/console/api/#clear)
