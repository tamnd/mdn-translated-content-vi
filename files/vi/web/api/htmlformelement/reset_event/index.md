---
title: "HTMLFormElement: sự kiện reset"
short-title: reset
slug: Web/API/HTMLFormElement/reset_event
page-type: web-api-event
browser-compat: api.HTMLFormElement.reset_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`reset`** được kích hoạt khi một {{HTMLElement("form")}} được đặt lại.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("reset", (event) => { })

onreset = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này sử dụng {{domxref("EventTarget.addEventListener()")}} để lắng nghe sự kiện reset của biểu mẫu, và ghi lại {{domxref("Event.timeStamp")}} hiện tại mỗi khi điều đó xảy ra.

### HTML

```html
<form id="form">
  <label>Trường kiểm tra: <input type="text" /></label>
  <br /><br />
  <button type="reset">Đặt lại biểu mẫu</button>
</form>
<p id="log"></p>
```

### JavaScript

```js
const form = document.getElementById("form");
const log = document.getElementById("log");

function logReset(event) {
  log.textContent = `Biểu mẫu đã được đặt lại! Timestamp: ${event.timeStamp}`;
}

form.addEventListener("reset", logReset);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("form")}}
