---
title: "WindowControlsOverlay: sự kiện geometrychange"
short-title: geometrychange
slug: Web/API/WindowControlsOverlay/geometrychange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.WindowControlsOverlay.geometrychange_event
---

{{APIRef("Window Controls Overlay API")}}{{SeeCompatTable}}

Sự kiện `geometrychange` được kích hoạt khi vị trí, kích thước hoặc khả năng hiển thị của vùng thanh tiêu đề của Progressive Web App thay đổi.

Điều này chỉ áp dụng cho Progressive Web Apps được cài đặt trên hệ điều hành máy tính và sử dụng [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("geometrychange", (event) => { })

ongeometrychange = (event) => { }
```

## Loại sự kiện

Một {{domxref("WindowControlsOverlayGeometryChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("WindowControlsOverlayGeometryChangeEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- `titlebarAreaRect`
  - : Một {{domxref("DOMRect")}} đại diện cho vị trí và kích thước của vùng thanh tiêu đề trong nội dung của ứng dụng.
- `visible`
  - : Một {{Glossary("Boolean")}} cho biết lớp phủ điều khiển cửa sổ có hiển thị hay không.

## Ví dụ

Sử dụng `addEventListener()`:

```js
navigator.windowControlsOverlay.addEventListener("geometrychange", (event) => {
  const { x, y, width, height } = event.titlebarAreaRect;
  console.log(
    `The titlebar area coordinates are x:${x}, y:${y}, width:${width}, height:${height}`,
  );
});
```

Sử dụng thuộc tính trình xử lý sự kiện `ongeometrychange`:

```js
navigator.windowControlsOverlay.ongeometrychange = (event) => {
  const { x, y, width, height } = event.titlebarAreaRect;
  console.log(
    `The titlebar area coordinates are x:${x}, y:${y}, width:${width}, height:${height}`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
