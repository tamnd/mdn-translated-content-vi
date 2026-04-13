---
title: "VRDisplayEvent: hàm khởi tạo VRDisplayEvent()"
short-title: VRDisplayEvent()
slug: Web/API/VRDisplayEvent/VRDisplayEvent
page-type: web-api-constructor
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayEvent.VRDisplayEvent
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Hàm khởi tạo **`VRDisplayEvent()`** tạo đối tượng {{domxref("VRDisplayEvent")}}.

> [!NOTE]
> Hàm khởi tạo này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
new VRDisplayEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `vrdisplayconnect`, `vrdisplaydisconnect`, `vrdisplayactivate`, `vrdisplaydeactivate`, `vrdisplayblur`,
    `vrdisplaypointerrestricted`, `vrdisplaypointerunrestricted`, hoặc `vrdisplaypresentchange`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `display`
      - : {{domxref("VRDisplay")}} mà sự kiện liên quan đến.
    - `reason`
      - : Một chuỗi đại diện cho lý do con người có thể đọc được tại sao sự kiện được kích hoạt (xem {{domxref("VRDisplayEvent.reason")}}).

### Giá trị trả về

Một đối tượng {{domxref("VRDisplayEvent")}} mới.

## Ví dụ

```js
const myEventObject = new VRDisplayEvent("custom", {
  display: vrDisplay,
  reason: "Custom reason",
});
```

## Thông số kỹ thuật

Hàm khởi tạo này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
