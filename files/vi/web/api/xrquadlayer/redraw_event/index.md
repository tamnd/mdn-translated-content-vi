---
title: "XRQuadLayer: redraw event"
short-title: redraw
slug: Web/API/XRQuadLayer/redraw_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRQuadLayer.redraw_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Sự kiện `redraw` được gửi đến đối tượng `XRQuadLayer` khi các tài nguyên bên dưới của layer bị mất hoặc khi compositor XR không thể chiếu lại layer. Nếu sự kiện này được gửi, các tác giả nên vẽ lại nội dung của layer trong frame hoạt ảnh XR tiếp theo.

Xem thêm thuộc tính {{domxref("XRCompositionLayer.needsRedraw")}} cũng có sẵn cho các đối tượng `XRQuadLayer` thông qua kế thừa từ {{domxref("XRCompositionLayer")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("redraw", (event) => { })

onredraw = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("XRLayerEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("XRLayerEvent.layer", "layer")}} {{ReadOnlyInline}}
  - : {{domxref("XRLayer")}} đã tạo ra sự kiện.

## Ví dụ

### Sử dụng sự kiện `redraw`

Bạn có thể truyền `redraw` cho {{domxref("EventTarget.addEventListener()", "addEventListener()")}}:

```js
quadLayer.addEventListener("redraw", (event) => {
  // redraw the layer
});
```

Ngoài ra, bạn có thể sử dụng thuộc tính trình xử lý sự kiện `onredraw` để thiết lập trình xử lý cho sự kiện `redraw`:

```js
quadLayer.onredraw = (event) => {
  // redraw the layer
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCompositionLayer.needsRedraw")}}
