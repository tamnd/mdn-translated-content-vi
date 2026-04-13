---
title: "HIDConnectionEvent: HIDConnectionEvent() constructor"
short-title: HIDConnectionEvent()
slug: Web/API/HIDConnectionEvent/HIDConnectionEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.HIDConnectionEvent.HIDConnectionEvent
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Hàm khởi tạo **`HIDConnectionEvent()`** tạo một đối tượng {{domxref("HIDConnectionEvent")}} mới. Thông thường hàm khởi tạo này không được sử dụng vì các sự kiện được tạo khi trạng thái kết nối của thiết bị thay đổi.

## Cú pháp

```js-nolint
new HIDConnectionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt giá trị này là `connect` hoặc `disconnect`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `device`
      - : Phiên bản {{domxref("HIDDevice")}} đại diện cho thiết bị đang được kết nối hoặc ngắt kết nối.

### Giá trị trả về

Một đối tượng {{domxref("HIDConnectionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
