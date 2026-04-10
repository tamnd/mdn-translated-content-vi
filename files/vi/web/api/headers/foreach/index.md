---
title: "Headers: phương thức forEach()"
short-title: forEach()
slug: Web/API/Headers/forEach
page-type: web-api-instance-method
browser-compat: api.Headers.forEach
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`Headers.forEach()`** thực thi một hàm callback một lần cho mỗi cặp khóa/giá trị trong đối tượng [`Headers`](/en-US/docs/Web/API/Headers).

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được thực thi cho mỗi mục trong map. Nó nhận các đối số sau:
    - `value`
      - : Giá trị của mục header hiện đang được duyệt.
    - `key`
      - : Tên của mục header hiện đang được duyệt.
    - `object`
      - : Đối tượng Headers đang được duyệt.
- `thisArg` {{Optional_Inline}}
  - : Giá trị sẽ được dùng làm `this` khi thực thi `callback`.

### Giá trị trả về

{{jsxref("undefined")}}.

## Mô tả

Phương thức `Headers.forEach()` thực thi callback được cung cấp một lần cho mỗi khóa thực sự tồn tại của Headers. Nó không được gọi cho những khóa đã bị xóa. Tuy nhiên, nó vẫn được thực thi cho những khóa vẫn tồn tại nhưng có giá trị undefined.

## Ví dụ

### In nội dung của đối tượng Headers

Đoạn mã sau ghi một dòng cho mỗi cặp khóa/giá trị trong đối tượng `myHeaders`.

```js
// Create a new test Headers object
const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Cookie", "This is a demo cookie");
myHeaders.append("compression", "gzip");

// Display the key/value pairs
myHeaders.forEach((value, key) => {
  console.log(`${key} ==> ${value}`);
});
```

Kết quả là:

```plain
compression ==> gzip
content-type ==> application/json
cookie ==> This is a demo cookie
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Map.prototype.forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/forEach)
- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
