---
title: "URLSearchParams: phương thức forEach()"
short-title: forEach()
slug: Web/API/URLSearchParams/forEach
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.forEach
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`forEach()`** của giao diện {{domxref("URLSearchParams")}} cho phép lặp qua tất cả các giá trị có trong đối tượng này thông qua một hàm callback.

## Cú pháp

```js-nolint
forEach(callback)
forEach(callback, thisArg)
```

### Tham số

- `callback`
  - : Hàm được thực thi trên mỗi phần tử, được truyền các đối số sau:
    - `value`
      - : Giá trị của mục hiện đang được xử lý trong đối tượng `URLSearchParams`.
    - `key`
      - : Khóa của mục hiện đang được xử lý trong đối tượng `URLSearchParams`.
    - `searchParams`
      - : Đối tượng `URLSearchParams` mà `forEach()` được gọi.

- `thisArg` {{optional_inline}}
  - : Giá trị dùng làm `this` khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Tạo đối tượng URLSearchParams kiểm thử
const searchParams = new URLSearchParams("key1=value1&key2=value2");

// Log các giá trị
searchParams.forEach((value, key) => {
  console.log(value, key);
});
```

Kết quả là:

```plain
value1 key1
value2 key2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}}.
