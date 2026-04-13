---
title: WindowControlsOverlay
slug: Web/API/WindowControlsOverlay
page-type: web-api-interface
status:
  - experimental
browser-compat: api.WindowControlsOverlay
---

{{APIRef("Window Controls Overlay API")}}{{securecontext_header}}{{SeeCompatTable}}

Giao diện **`WindowControlsOverlay`** của [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API) hiển thị thông tin về hình học của vùng thanh tiêu đề trong Progressive Web Apps trên máy tính, và một sự kiện để biết khi nào nó thay đổi. Giao diện này có thể truy cập từ {{domxref('Navigator.windowControlsOverlay')}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("WindowControlsOverlay.visible")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{Glossary("Boolean")}} cho biết lớp phủ điều khiển cửa sổ có hiển thị hay không.

## Phương thức phiên bản

- {{domxref("WindowControlsOverlay.getTitlebarAreaRect()")}} {{Experimental_Inline}}
  - : Trả về kích thước và vị trí của thanh tiêu đề.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng {{domxref('EventTarget.addEventListener()')}} hoặc bằng cách gán trình lắng nghe sự kiện vào thuộc tính `oneventname` tương ứng của giao diện này.

- {{domxref("WindowControlsOverlay/geometrychange_event", "geometrychange")}} {{Experimental_Inline}}
  - : Được kích hoạt khi hình học của vùng thanh tiêu đề thay đổi.

## Ví dụ

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
