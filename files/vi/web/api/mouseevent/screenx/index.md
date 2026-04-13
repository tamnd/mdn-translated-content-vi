---
title: "MouseEvent: screenX property"
short-title: screenX
slug: Web/API/MouseEvent/screenX
page-type: web-api-instance-property
browser-compat: api.MouseEvent.screenX
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`screenX`** của giao diện {{domxref("MouseEvent")}} cung cấp tọa độ ngang (độ lệch) của con trỏ chuột trong [tọa độ màn hình](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#screen).

> [!NOTE]
> Trong môi trường nhiều màn hình, các màn hình được căn chỉnh theo chiều ngang sẽ được coi là một thiết bị duy nhất và do đó phạm vi giá trị `screenX` sẽ tăng lên theo chiều rộng tổng hợp của màn hình.

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

### Định tuyến một sự kiện

Khi bạn bẫy các sự kiện trên cửa sổ, tài liệu hoặc các thành phần rộng rãi khác, bạn có thể lấy tọa độ của sự kiện đó (ví dụ: một cú nhấp chuột) và định tuyến sự kiện đó một cách chính xác, như ví dụ sau đây minh họa:

```js
function checkClickMap(e) {
  if (e.screenX < 50) doRedButton();
  if (50 <= e.screenX && e.screenX < 100) doYellowButton();
  if (e.screenX >= 100) doRedButton();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("MouseEvent") }}
- {{ domxref("MouseEvent.screenY","screenY") }}
- {{ domxref("MouseEvent.clientX","clientX") }} / {{ domxref("MouseEvent.clientY", "clientY") }}
- [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
