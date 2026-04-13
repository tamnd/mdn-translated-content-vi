---
title: "XRInputSourceEvent: hàm khởi tạo XRInputSourceEvent()"
short-title: XRInputSourceEvent()
slug: Web/API/XRInputSourceEvent/XRInputSourceEvent
page-type: web-api-constructor
browser-compat: api.XRInputSourceEvent.XRInputSourceEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Hàm khởi tạo **`XRInputSourceEvent()`** tạo và trả về đối tượng {{domxref("XRInputSourceEvent")}} mới mô tả một sự kiện (thay đổi trạng thái) đã xảy ra trên thiết bị đầu vào người dùng WebXR được đại diện bởi {{domxref("XRInputSource")}}.

## Cú pháp

```js-nolint
new XRInputSourceEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `select`, `selectend`, `selectstart`, `squeeze`, `squeezeend`, `squeezestart`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `frame`
      - : Một đối tượng {{domxref("XRFrame")}} đại diện cho khung sự kiện trong đó sự kiện xảy ra.
        Sự kiện này _không_ liên quan đến quá trình hoạt ảnh và không chứa thông tin người xem trong đó.
    - `inputSource`
      - : Một đối tượng {{domxref("XRInputSource")}} đại diện cho thiết bị đầu vào mà sự kiện đang được gửi từ đó.

### Giá trị trả về

Một đối tượng {{domxref("XRInputSourceEvent")}} mới đại diện cho sự kiện được mô tả bởi `type` và `eventInitDict`.

## Ví dụ

Ví dụ này tạo một sự kiện {{domxref("XRSession.select_event", "select")}} mới và gửi nó đến {{domxref("XRSession")}}.

```js
let event = new XRInputSourceEvent("select", {
  frame: eventFrame,
  inputSource: source,
});
if (event) {
  xrSession.dispatchEvent(event);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
