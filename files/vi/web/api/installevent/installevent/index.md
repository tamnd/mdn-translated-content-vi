---
title: "InstallEvent: InstallEvent() constructor"
short-title: InstallEvent()
slug: Web/API/InstallEvent/InstallEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.InstallEvent.InstallEvent
---

{{APIRef("Service Workers API")}}{{SeeCompatTable}}

Hàm khởi tạo **`InstallEvent()`** tạo một đối tượng {{domxref("InstallEvent")}} mới.

## Cú pháp

```js-nolint
new InstallEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt giá trị này là `install`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể chứa bất kỳ cài đặt tùy chỉnh nào bạn muốn áp dụng cho đối tượng sự kiện. Hiện tại không có tùy chọn bắt buộc nào, nhưng điều này được định nghĩa để tương thích với tương lai.

### Giá trị trả về

Một đối tượng {{domxref("InstallEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
