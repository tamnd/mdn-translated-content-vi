---
title: "XREquirectLayer: redraw event"
short-title: redraw
slug: Web/API/XREquirectLayer/redraw_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XREquirectLayer.redraw_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Sự kiện `redraw` được gửi đến đối tượng `XREquirectLayer` khi các tài nguyên cơ bản của lớp bị mất hoặc khi XR Compositor không thể tái chiếu lớp nữa. Nếu sự kiện này được gửi, tác giả nên vẽ lại nội dung của lớp trong khung animation XR tiếp theo.

Xem thêm thuộc tính {{domxref("XRCompositionLayer.needsRedraw")}} cũng có sẵn cho các đối tượng `XREquirectLayer` thông qua kế thừa từ {{domxref("XRCompositionLayer")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính event handler.

```js-nolint
addEventListener("redraw", (event) => { })

onredraw = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("XRLayerEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRLayerEvent.layer", "layer")}} {{ReadOnlyInline}}
  - : {{domxref("XRLayer")}} đã tạo ra sự kiện.

## Ví dụ

### Sử dụng sự kiện `redraw`

Bạn có thể truyền `redraw` vào {{domxref("EventTarget.addEventListener()", "addEventListener()")}}:

```js
equirectLayer.addEventListener("redraw", (event) => {
  // redraw the layer
});
```

Ngoài ra, bạn có thể sử dụng thuộc tính event handler `onredraw` để thiết lập handler cho sự kiện `redraw`:

```js
equirectLayer.onredraw = (event) => {
  // redraw the layer
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCompositionLayer.needsRedraw")}}
