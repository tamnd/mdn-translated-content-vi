---
title: "HTMLTextAreaElement: select event"
short-title: select
slug: Web/API/HTMLTextAreaElement/select_event
page-type: web-api-event
browser-compat: api.HTMLTextAreaElement.select_event
---

{{APIRef("Selection API")}}

Sự kiện **`select`** được kích hoạt khi một phần văn bản đã được chọn.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("select", (event) => { })

onselect = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Trình ghi lại vùng chọn

```html
<textarea>Try selecting some text in this element.</textarea>
<p id="log"></p>
```

```js
function logSelection(event) {
  const log = document.getElementById("log");
  const selection = event.target.value.substring(
    event.target.selectionStart,
    event.target.selectionEnd,
  );
  log.textContent = `You selected: ${selection}`;
}

const textarea = document.querySelector("textarea");
textarea.addEventListener("select", logSelection);
```

{{EmbedLiveSample("Selection_logger")}}

### Tương đương onselect

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `onselect`:

```js
textarea.onselect = logSelection;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.select()")}}
