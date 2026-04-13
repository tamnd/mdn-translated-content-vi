---
title: "DOMException: DOMException() constructor"
short-title: DOMException()
slug: Web/API/DOMException/DOMException
page-type: web-api-constructor
browser-compat: api.DOMException.DOMException
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMException()`** trả về một đối tượng {{domxref("DOMException")}} với thông điệp và tên được chỉ định.

## Cú pháp

```js-nolint
new DOMException()
new DOMException(message)
new DOMException(message, name)
```

### Tham số

- `message` {{optional_inline}}
  - : Mô tả về ngoại lệ. Nếu không có, chuỗi rỗng `''` được sử dụng.
- `name` {{optional_inline}}
  - : Một chuỗi. Nếu tên được chỉ định là [tên lỗi chuẩn](/en-US/docs/Web/API/DOMException#error_names), thì lấy thuộc tính [`code`](/en-US/docs/Web/API/DOMException/code) của đối tượng `DOMException` sẽ trả về số mã tương ứng với tên được chỉ định. Nếu không có, chuỗi `'Error'` được sử dụng.

### Giá trị trả về

Một đối tượng {{domxref("DOMException")}} mới được tạo.

## Ví dụ

Trong ví dụ này, nhấn nút sẽ khiến một `DOMException` tùy chỉnh được ném, sau đó được bắt và thông điệp lỗi tùy chỉnh được hiển thị trong cảnh báo.

### HTML

```html
<button>Trigger DOM Exception</button>

<p id="output"></p>
```

### JavaScript

```js
const button = document.querySelector("button");

button.onclick = () => {
  try {
    throw new DOMException("Custom DOM Exception Triggered.");
  } catch (error) {
    document.querySelector("#output").textContent = `Error: ${error.message}`;
  }
};
```

### Kết quả

{{ EmbedLiveSample('Examples', '100%', 100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của hàm khởi tạo `DOMException`](https://github.com/zloirock/core-js#domexception) có trong [`core-js`](https://github.com/zloirock/core-js)
