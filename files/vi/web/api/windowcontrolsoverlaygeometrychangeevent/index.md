---
title: WindowControlsOverlayGeometryChangeEvent
slug: Web/API/WindowControlsOverlayGeometryChangeEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.WindowControlsOverlayGeometryChangeEvent
---

{{APIRef("Window Controls Overlay API")}}{{SeeCompatTable}}

Giao diện **`WindowControlsOverlayGeometryChangeEvent`** của [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API) được truyền đến {{domxref("WindowControlsOverlay/geometrychange_event", "geometrychange")}} khi kích thước hoặc khả năng hiển thị của vùng thanh tiêu đề của Progressive Web App trên máy tính thay đổi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("WindowControlsOverlayGeometryChangeEvent.WindowControlsOverlayGeometryChangeEvent", "WindowControlsOverlayGeometryChangeEvent()")}} {{Experimental_Inline}}
  - : Tạo một sự kiện `WindowControlsOverlayGeometryChangeEvent` với các tham số đã cho.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ cha {{domxref("Event")}}_.

- {{domxref("WindowControlsOverlayGeometryChangeEvent.titlebarAreaRect")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMRect")}} đại diện cho vị trí và kích thước của vùng thanh tiêu đề.
- {{domxref("WindowControlsOverlayGeometryChangeEvent.visible")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{Glossary("Boolean")}} cho biết lớp phủ điều khiển cửa sổ có hiển thị hay không.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng phiên bản `WindowControlsOverlayGeometryChangeEvent` bằng cách thêm trình xử lý sự kiện trên thuộc tính {{domxref("Navigator.windowControlsOverlay")}}, để lắng nghe các thay đổi hình học của vùng thanh tiêu đề của PWA.

```js
if ("windowControlsOverlay" in navigator) {
  navigator.windowControlsOverlay.addEventListener(
    "geometrychange",
    (event) => {
      if (event.visible) {
        const rect = event.titlebarAreaRect;
        // Do something with the coordinates of the title bar area.
      }
    },
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API).
