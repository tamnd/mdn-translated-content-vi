---
title: "MouseEvent: screenY property"
short-title: screenY
slug: Web/API/MouseEvent/screenY
page-type: web-api-instance-property
browser-compat: api.MouseEvent.screenY
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`screenY`** của giao diện {{domxref("MouseEvent")}} cung cấp tọa độ dọc (độ lệch) của con trỏ chuột trong [tọa độ màn hình](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#screen).

## Giá trị

Giá trị dấu phẩy động `double` tính bằng pixel.

Các phiên bản đầu tiên của thông số kỹ thuật đã xác định đây là số nguyên đề cập đến số lượng pixel.

## Ví dụ

Ví dụ này hiển thị tọa độ chuột của bạn bất cứ khi nào bạn kích hoạt sự kiện {{domxref("Element/mousemove_event", "mousemove")}}.

### HTML

```html
<p>Move your mouse to see its position.</p>
<p id="screen-log"></p>
```

### JavaScript

```js
let screenLog = document.querySelector("#screen-log");
document.addEventListener("mousemove", logKey);

function logKey(e) {
  screenLog.innerText = `
    Screen X/Y: ${e.screenX}, ${e.screenY}
    Client X/Y: ${e.clientX}, ${e.clientY}`;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("MouseEvent") }}
- {{ domxref("MouseEvent.screenX","screenX") }}
- {{ domxref("MouseEvent.clientX","clientX") }} / {{ domxref("MouseEvent.clientY", "clientY") }}
- [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
