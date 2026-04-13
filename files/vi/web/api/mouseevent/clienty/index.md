---
title: "MouseEvent: clientY property"
short-title: clientY
slug: Web/API/MouseEvent/clientY
page-type: web-api-instance-property
browser-compat: api.MouseEvent.clientY
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`clientY`** của giao diện {{domxref("MouseEvent")}} cung cấp tọa độ dọc trong {{glossary("viewport")}} của ứng dụng nơi sự kiện xảy ra (ngược lại với tọa độ trong trang).

Ví dụ: nhấp vào cạnh trên của khung nhìn sẽ luôn dẫn đến sự kiện chuột có giá trị `clientY` là `0`, bất kể trang có được cuộn theo chiều dọc hay không.

## Giá trị

Giá trị dấu phẩy động `double` tính bằng pixel.

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
- {{domxref("MouseEvent.clientX","clientX")}}
- {{domxref("MouseEvent.screenX","screenX")}} / {{domxref("MouseEvent.screenY","screenY")}}
- [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
