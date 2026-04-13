---
title: VirtualKeyboard
slug: Web/API/VirtualKeyboard
page-type: web-api-interface
status:
  - experimental
browser-compat: api.VirtualKeyboard
---

{{SeeCompatTable}}{{APIRef("VirtualKeyboard API")}}{{securecontext_header}}

Giao diện **`VirtualKeyboard`** của [VirtualKeyboard API](/en-US/docs/Web/API/VirtualKeyboard_API) hữu ích trên các thiết bị có bàn phím ảo trên màn hình, chẳng hạn như máy tính bảng, điện thoại di động, hoặc các thiết bị khác mà bàn phím phần cứng có thể không có.

Giao diện `VirtualKeyboard` giúp thoát ra khỏi cách xử lý tự động của trình duyệt đối với bàn phím ảo trên màn hình bằng cách giảm chiều cao của viewport để nhường chỗ cho bàn phím ảo. Bạn có thể ngăn trình duyệt thay đổi kích thước viewport, phát hiện vị trí và kích thước của bàn phím ảo, điều chỉnh bố cục trang web của bạn cho phù hợp, và lập trình hiển thị hoặc ẩn bàn phím ảo.

Bạn truy cập giao diện `VirtualKeyboard` bằng cách sử dụng {{domxref("navigator.virtualKeyboard")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `VirtualKeyboard` kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{DOMxRef("VirtualKeyboard.boundingRect")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMRect")}} mô tả hình học của bàn phím ảo.
- {{DOMxRef("VirtualKeyboard.overlaysContent")}} {{Experimental_Inline}}
  - : Một {{jsxref('Boolean')}} xác định xem trình duyệt có nên ngừng xử lý bàn phím ảo trên màn hình hay không.

## Phương thức phiên bản

_Giao diện `VirtualKeyboard` kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref('VirtualKeyboard.show()')}} {{experimental_inline}}
  - : Hiển thị bàn phím ảo.
- {{domxref('VirtualKeyboard.hide()')}} {{experimental_inline}}
  - : Ẩn bàn phím ảo.

## Sự kiện

- {{domxref("VirtualKeyboard.geometrychange_event", "geometrychange")}} {{Experimental_Inline}}
  - : Được kích hoạt khi hình học của bàn phím ảo trên màn hình thay đổi, xảy ra khi bàn phím ảo xuất hiện hoặc biến mất.

## Ví dụ

Ví dụ sau minh họa cách thoát ra khỏi hành vi tự động của bàn phím ảo và phát hiện hình học của bàn phím ảo trong trang web:

```js
if ("virtualKeyboard" in navigator) {
  navigator.virtualKeyboard.overlaysContent = true;

  navigator.virtualKeyboard.addEventListener("geometrychange", (event) => {
    const { x, y, width, height } = event.target.boundingRect;
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VirtualKeyboard_API", "The VirtualKeyboard API", "", "nocode")}}
- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
