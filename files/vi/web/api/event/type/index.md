---
title: "Event: thuộc tính type"
short-title: type
slug: Web/API/Event/type
page-type: web-api-instance-property
browser-compat: api.Event.type
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("Event")}} trả về một chuỗi chứa loại của sự kiện. Nó được đặt khi sự kiện được khởi tạo và là tên thường dùng để chỉ sự kiện cụ thể đó, chẳng hạn
`click`, `load`, hoặc `error`.

## Giá trị

Một chuỗi chứa loại của {{domxref("Event")}}.

## Ví dụ

Ví dụ này ghi lại loại sự kiện mỗi khi bạn nhấn một phím trên bàn phím hoặc nhấp nút chuột.

### HTML

```html
<p>Nhấn bất kỳ phím nào hoặc nhấp chuột để lấy loại sự kiện.</p>
<p id="log"></p>
```

### JavaScript

```js
function getEventType(event) {
  const log = document.getElementById("log");
  log.innerText = `${event.type}\n${log.innerText}`;
}

// Sự kiện bàn phím
document.addEventListener("keydown", getEventType); // đầu tiên
document.addEventListener("keypress", getEventType); // thứ hai
document.addEventListener("keyup", getEventType); // thứ ba

// Sự kiện chuột
document.addEventListener("mousedown", getEventType); // đầu tiên
document.addEventListener("mouseup", getEventType); // thứ hai
document.addEventListener("click", getEventType); // thứ ba
```

### Kết quả

{{EmbedLiveSample('Example')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("EventTarget.addEventListener()") }}
- {{ domxref("EventTarget.removeEventListener()") }}
