---
title: "XRLayerEvent: hàm khởi tạo XRLayerEvent()"
short-title: XRLayerEvent()
slug: Web/API/XRLayerEvent/XRLayerEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.XRLayerEvent.XRLayerEvent
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`XRLayerEvent`** tạo và trả về một đối tượng {{domxref("XRLayerEvent")}} mới. Các sự kiện này liên quan đến sự thay đổi trạng thái của một đối tượng {{domxref("XRLayer")}}.

## Cú pháp

```js-nolint
new XRLayerEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt giá trị là `redraw`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `layer`
      - : {{domxref("XRLayer")}} mà sự kiện sẽ được gửi đến.

### Giá trị trả về

Một đối tượng {{domxref("XRLayer")}} mới đại diện cho một đối tượng của loại được chỉ định và được cấu hình như mô tả trong tham số `eventInitDict`.

## Ví dụ

### Tạo một `XRLayerEvent` mới

Trong ví dụ này, một sự kiện `redraw` mới được tạo cho một {{domxref("XRQuadLayer")}}.

```js
const redrawEvent = new XRLayerEvent("redraw", {
  layer: quadLayer,
});

quadLayer.dispatchEvent();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("EventTarget.dispatchEvent()")}}
