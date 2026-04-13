---
title: "USBConnectionEvent: hàm khởi tạo USBConnectionEvent()"
short-title: USBConnectionEvent()
slug: Web/API/USBConnectionEvent/USBConnectionEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.USBConnectionEvent.USBConnectionEvent
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`USBConnectionEvent()`** tạo một đối tượng {{domxref("USBConnectionEvent")}} mới. Hàm khởi tạo này thường không được sử dụng, nó được trình duyệt tạo ra để phản hồi với việc kết nối và ngắt kết nối của thiết bị USB.

## Cú pháp

```js-nolint
new USBConnectionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt giá trị là `connect` hoặc `disconnect`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `device`
      - : Một {{domxref("USBDevice")}} đại diện cho thiết bị USB đang được kết nối hoặc ngắt kết nối.

### Giá trị trả về

Một đối tượng {{domxref("USBConnectionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
