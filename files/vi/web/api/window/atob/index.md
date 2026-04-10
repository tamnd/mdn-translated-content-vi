---
title: "Window: phương thức atob()"
short-title: atob()
slug: Web/API/Window/atob
page-type: web-api-instance-method
browser-compat: api.atob
---

{{APIRef("HTML DOM")}}

Phương thức **`atob()`** của giao diện {{domxref("Window")}} giải mã một
chuỗi dữ liệu đã được mã hóa bằng phương thức {{glossary("Base64")}}. Bạn có thể sử dụng
phương thức {{domxref("Window.btoa()")}} để mã hóa và truyền
dữ liệu có thể gây ra vấn đề truyền tải, sau đó truyền đi và sử dụng
phương thức `atob()` để giải mã lại dữ liệu. Ví dụ: bạn có thể mã hóa,
truyền tải và giải mã các ký tự điều khiển như giá trị {{Glossary("ASCII")}} từ 0 đến 31.

Ngoài ra, hãy cân nhắc sử dụng phương thức {{jsxref("Uint8Array.fromBase64()")}}, phương thức này tạo ra một đối tượng `Uint8Array` từ một chuỗi được mã hóa base64. Kết quả là một mảng byte, dễ xử lý hơn so với chuỗi chứa các byte thô.

## Cú pháp

```js-nolint
atob(encodedData)
```

### Tham số

- `encodedData`
  - : Một chuỗi được mã hóa base64, sử dụng bảng chữ cái được tạo bởi {{domxref("Window.btoa()")}}.

### Giá trị trả về

Một chuỗi nhị phân chứa các byte thô được giải mã từ `encodedData`. Chuỗi trong JavaScript được mã hóa dưới dạng {{glossary("UTF-16")}}, nghĩa là mỗi ký tự phải có mã code point nhỏ hơn 256, đại diện cho một byte dữ liệu.

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu `encodedData` không phải là base64 hợp lệ.

## Ví dụ

```js
const encodedData = window.btoa("Hello, world"); // mã hóa một chuỗi
const decodedData = window.atob(encodedData); // giải mã chuỗi
```

Để biết thêm ví dụ, xem phương thức {{domxref("Window.btoa()")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `atob`](https://github.com/zloirock/core-js#base64-utility-methods) có sẵn trong [`core-js`](https://github.com/zloirock/core-js)
- [`data` URLs](/en-US/docs/Web/URI/Reference/Schemes/data)
- {{domxref("WorkerGlobalScope.atob()")}}: cùng phương thức, nhưng trong phạm vi worker.
- {{domxref("Window.btoa()")}}
- {{jsxref("Uint8Array.fromBase64()")}}
