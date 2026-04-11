---
title: "MouseEvent: movementY property"
short-title: movementY
slug: Web/API/MouseEvent/movementY
page-type: web-api-instance-property
browser-compat: api.MouseEvent.movementY
---

{{APIRef("Pointer Lock API")}}

Thuộc tính **`movementY`** chỉ đọc của giao diện {{domxref("MouseEvent")}} cung cấp sự khác biệt về tọa độ Y của chuột (hoặc con trỏ) giữa sự kiện di chuyển đã cho và sự kiện di chuyển trước đó cùng loại.

Nói cách khác, giá trị của thuộc tính được tính như sau: `currentEvent.movementY = currentEvent.screenY - previousEvent.screenY`.
Giá trị bằng 0 cho tất cả các sự kiện ngoài {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/pointermove_event", "pointermove")}} và {{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}.

> [!WARNING]
> Trình duyệt [sử dụng các đơn vị khác nhau cho `movementY` và `screenY`](https://github.com/w3c/pointerlock/issues/42) so với thông số kỹ thuật xác định.
> Tùy thuộc vào trình duyệt và hệ điều hành, đơn vị `movementY` có thể là pixel vật lý, pixel logic hoặc pixel CSS.
> Bạn có thể muốn tránh các thuộc tính chuyển động và thay vào đó tính toán delta giữa các giá trị máy khách hiện tại ({{domxref("MouseEvent.screenX", "screenX")}}, {{domxref("MouseEvent.screenY", "screenY")}}) và các giá trị máy khách trước đó.

## Giá trị

Một con số.
Luôn bằng 0 trên bất kỳ {{domxref("MouseEvent")}} nào ngoài `mousemove` và bất kỳ {{domxref("PointerEvent")}} nào ngoài `pointermove` hoặc `pointerrawupdate`.

## Ví dụ

### Ghi lại chuyển động của chuột cho các sự kiện `mousemove`

Ví dụ này ghi lại lượng di chuyển của chuột bằng {{domxref("MouseEvent.movementX", "movementX")}} và `movementY`.

#### HTML

```html
<p id="log">Move your mouse around inside this element.</p>
```

#### JavaScript

```js
const log = document.getElementById("log");

function logMovement(event) {
  log.innerText = `movement: ${event.movementX}, ${event.movementY}\n${log.innerText}`;
}

document.addEventListener("mousemove", logMovement);
```

#### Kết quả

{{EmbedLiveSample("Log mouse movement for `mousemove` events")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent.movementX")}}
- {{domxref("MouseEvent")}}
- [Khóa con trỏ](/en-US/docs/Web/API/Pointer_Lock_API)
