---
title: "HTMLInputElement: sự kiện select"
short-title: select
slug: Web/API/HTMLInputElement/select_event
page-type: web-api-event
browser-compat: api.HTMLInputElement.select_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`select`** kích hoạt khi một số văn bản đã được chọn.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("select", (event) => { })

onselect = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Ghi nhật ký lựa chọn

```html
<input value="Thử chọn một số văn bản trong phần tử này." />
<p id="log"></p>
```

```js
function logSelection(event) {
  const log = document.getElementById("log");
  const selection = event.target.value.substring(
    event.target.selectionStart,
    event.target.selectionEnd,
  );
  log.textContent = `Bạn đã chọn: ${selection}`;
}

const input = document.querySelector("input");
input.addEventListener("select", logSelection);
```

{{EmbedLiveSample("Selection_logger")}}

### Tương đương onselect

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `onselect`:

```js
input.onselect = logSelection;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
