---
title: "XRSessionEvent: hàm khởi tạo XRSessionEvent()"
short-title: XRSessionEvent()
slug: Web/API/XRSessionEvent/XRSessionEvent
page-type: web-api-constructor
browser-compat: api.XRSessionEvent.XRSessionEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Hàm khởi tạo **`XRSessionEvent()`** của WebXR Device API tạo và trả về một đối tượng {{domxref("XRSessionEvent")}} mới. Các đối tượng này đại diện cho các sự kiện thông báo về sự thay đổi trạng thái trong một {{domxref("XRSession")}} đại diện cho một phiên thực tế tăng cường hoặc thực tế ảo.

## Cú pháp

```js-nolint
new XRSessionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt giá trị là `end` hoặc `visibilitychange`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `session`
      - : {{domxref("XRSession")}} mà sự kiện sẽ được gửi đến.

### Giá trị trả về

Một đối tượng {{domxref("XRSessionEvent")}} mới đại diện cho một đối tượng của loại được chỉ định và được cấu hình như mô tả trong tham số `options`.

## Ví dụ

Xem mã ví dụ tại [`XRSessionEvent`](/en-US/docs/Web/API/XRSessionEvent#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
