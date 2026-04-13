---
title: "WindowControlsOverlayGeometryChangeEvent: hàm khởi tạo WindowControlsOverlayGeometryChangeEvent()"
short-title: WindowControlsOverlayGeometryChangeEvent()
slug: Web/API/WindowControlsOverlayGeometryChangeEvent/WindowControlsOverlayGeometryChangeEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.WindowControlsOverlayGeometryChangeEvent.WindowControlsOverlayGeometryChangeEvent
---

{{APIRef("Window Controls Overlay API")}}{{SeeCompatTable}}

Hàm khởi tạo **`WindowControlsOverlayGeometryChangeEvent()`** trả về một đối tượng {{domxref("WindowControlsOverlayGeometryChangeEvent")}} mới, đại diện cho hình học hiện tại của vùng thanh tiêu đề của Progressive Web App trên máy tính.

## Cú pháp

```js-nolint
new WindowControlsOverlayGeometryChangeEvent(type, options)
```

### Tham số

_Hàm khởi tạo `WindowControlsOverlayGeometryChangeEvent()` cũng kế thừa các đối số từ {{domxref("Event.Event", "Event()")}}._

- `type`
  - : Một chuỗi cho biết loại sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `geometrychange`.
- `options`
  - : Một đối tượng với các thuộc tính sau:
    - `visible` {{optional_inline}}
      - : Một cờ boolean là true khi các giá trị của đối tượng `titlebarAreaRect` không phải là 0. Giá trị mặc định là `false`.
    - `titlebarAreaRect`
      - : Một {{domxref("DOMRect")}} đại diện cho vị trí và kích thước của vùng thanh tiêu đề.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WindowControlsOverlayGeometryChangeEvent")}} mà nó thuộc về.
