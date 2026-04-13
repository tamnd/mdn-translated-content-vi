---
title: "PresentationConnectionAvailableEvent: hàm khởi tạo PresentationConnectionAvailableEvent()"
short-title: PresentationConnectionAvailableEvent()
slug: Web/API/PresentationConnectionAvailableEvent/PresentationConnectionAvailableEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.PresentationConnectionAvailableEvent.PresentationConnectionAvailableEvent
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`PresentationConnectionAvailableEvent()`** tạo một đối tượng {{domxref("PresentationConnectionAvailableEvent")}} mới.

## Cú pháp

```js-nolint
new PresentationConnectionAvailableInit(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `connectionavailable`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `connection`
      - : Đối tượng {{domxref("PresentationConnection")}} liên kết.

### Giá trị trả về

Một đối tượng {{domxref("PresentationConnectionAvailableEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
