---
title: "Document: sự kiện readystatechange"
short-title: readystatechange
slug: Web/API/Document/readystatechange_event
page-type: web-api-event
browser-compat: api.Document.readystatechange_event
---

{{APIRef("DOM")}}

Sự kiện **`readystatechange`** được kích hoạt khi thuộc tính {{domxref("Document.readyState", "readyState")}} của tài liệu đã thay đổi.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("readystatechange", (event) => { })

onreadystatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Ví dụ trực tiếp

#### HTML

```html
<div class="controls">
  <button id="reload" type="button">Tải lại</button>
</div>

<div class="event-log">
  <label for="eventLog">Nhật ký sự kiện:</label>
  <textarea
    readonly
    class="event-log-contents"
    rows="8"
    cols="30"
    id="eventLog"></textarea>
</div>
```

#### CSS

```css hidden
body {
  display: grid;
  grid-template-areas: "control log";
}

.controls {
  grid-area: control;
  display: flex;
  align-items: center;
  justify-content: center;
}

.event-log {
  grid-area: log;
}

.event-log-contents {
  resize: none;
}

label,
button {
  display: block;
}

#reload {
  height: 2rem;
}
```

#### JavaScript

```js
const log = document.querySelector(".event-log-contents");
const reload = document.querySelector("#reload");

reload.addEventListener("click", () => {
  log.textContent = "";
  setTimeout(() => {
    window.location.reload(true);
  }, 200);
});

window.addEventListener("load", (event) => {
  log.textContent = `${log.textContent}load\n`;
});

document.addEventListener("readystatechange", (event) => {
  log.textContent = `${log.textContent}readystate: ${document.readyState}\n`;
});

document.addEventListener("DOMContentLoaded", (event) => {
  log.textContent = `${log.textContent}DOMContentLoaded\n`;
});
```

#### Kết quả

{{ EmbedLiveSample('Live_example', '100%', '160px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event), [`load`](/en-US/docs/Web/API/Window/load_event), [`beforeunload`](/en-US/docs/Web/API/Window/beforeunload_event), [`unload`](/en-US/docs/Web/API/Window/unload_event)
