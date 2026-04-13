---
title: "XRInputSourcesChangeEvent: XRInputSourcesChangeEvent() constructor"
short-title: XRInputSourcesChangeEvent()
slug: Web/API/XRInputSourcesChangeEvent/XRInputSourcesChangeEvent
page-type: web-api-constructor
browser-compat: api.XRInputSourcesChangeEvent.XRInputSourcesChangeEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Hàm khởi tạo **`XRInputSourcesChangeEvent()`** tạo và trả về một đối tượng {{domxref("XRInputSourcesChangeEvent")}} mới, biểu diễn bản cập nhật danh sách các thiết bị đầu vào [WebXR](/en-US/docs/Web/API/WebXR_Device_API) có sẵn. Thông thường bạn sẽ không gọi hàm khởi tạo này, vì các sự kiện này được tạo và gửi đến bạn bởi hệ thống WebXR.

## Cú pháp

```js-nolint
new XRInputSourcesChangeEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt là `inputsourceschange`.
- `options`
  - : Một đối tượng có thể có các thuộc tính sau (ngoài các thuộc tính đã định nghĩa trong {{domxref("Event/Event", "Event()")}}):
    - `added`
      - : Mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}}, mỗi đối tượng biểu diễn một thiết bị đầu vào vừa có sẵn để sử dụng.
    - `removed`
      - : Mảng gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}} biểu diễn các thiết bị đầu vào không còn có sẵn nữa.
    - `session`
      - : {{domxref("XRSession")}} mà sự kiện áp dụng cho.

### Giá trị trả về

Một đối tượng {{domxref("XRInputSourcesChangeEvent")}} mới được cấu hình dựa trên các tham số đầu vào được cung cấp.

## Ví dụ

Đoạn mã sau tạo một đối tượng `XRInputSourcesChangeEvent` mới cho biết rằng một nguồn đầu vào mới, được mô tả bởi đối tượng {{domxref("XRInputSource")}} có tên `newInputSource`, đã được thêm vào hệ thống.

```js
let iscEvent = new XRInputSourcesChangeEvent("inputsourceschange", {
  session: xrSession,
  added: [newInputSource],
  removed: [],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
