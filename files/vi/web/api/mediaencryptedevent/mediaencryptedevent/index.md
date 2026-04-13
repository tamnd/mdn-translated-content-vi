---
title: MediaEncryptedEvent()
slug: Web/API/MediaEncryptedEvent/MediaEncryptedEvent
page-type: web-api-constructor
browser-compat: api.MediaEncryptedEvent.MediaEncryptedEvent
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Hàm khởi tạo **`MediaEncryptedEvent()`** tạo ra đối tượng {{domxref("MediaEncryptedEvent")}} mới.

## Cú pháp

```js-nolint
new MediaEncryptedEvent(type)
new MediaEncryptedEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi với tên của sự kiện. Giá trị này phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó là `encrypted`.
- `options` {{optional_inline}}
  - : Đối tượng có _thêm_ các thuộc tính tùy chọn, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}:
    - `initDataType` {{optional_inline}}
      - : Chuỗi (không phân biệt chữ hoa chữ thường) với loại định dạng của dữ liệu khởi tạo liên quan. Mặc định là `""`.
    - `initData` {{optional_inline}}
      - : {{jsxref("ArrayBuffer")}} chứa dữ liệu khởi tạo liên quan, hoặc `null`. Mặc định là `null`.

### Giá trị trả về

Đối tượng {{domxref("MediaEncryptedEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
