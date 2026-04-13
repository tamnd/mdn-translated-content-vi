---
title: "XRCubeLayer: sự kiện redraw"
short-title: redraw
slug: Web/API/XRCubeLayer/redraw_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRCubeLayer.redraw_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Sự kiện `redraw` được gửi đến đối tượng `XRCubeLayer` khi các tài nguyên cơ bản của layer bị mất hoặc khi XR Compositor không còn có thể chiếu lại layer. Nếu sự kiện này được gửi, tác giả nên vẽ lại nội dung của layer trong khung hoạt ảnh XR tiếp theo.

Xem thêm thuộc tính {{domxref("XRCompositionLayer.needsRedraw")}} cũng có sẵn cho các đối tượng `XRCubeLayer` thông qua kế thừa từ {{domxref("XRCompositionLayer")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("redraw", (event) => { })

onredraw = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRLayerEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("XRLayerEvent.layer", "layer")}} {{ReadOnlyInline}}
  - : {{domxref("XRLayer")}} đã tạo ra sự kiện.

## Ví dụ

### Sử dụng sự kiện `redraw`

Bạn có thể truyền `redraw` vào {{domxref("EventTarget.addEventListener()", "addEventListener()")}}:

```js
cubeLayer.addEventListener("redraw", (event) => {
  // redraw the layer
});
```

Ngoài ra, bạn có thể sử dụng thuộc tính trình xử lý sự kiện `onredraw` để thiết lập trình xử lý cho sự kiện `redraw`:

```js
cubeLayer.onredraw = (event) => {
  // redraw the layer
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCompositionLayer.needsRedraw")}}
