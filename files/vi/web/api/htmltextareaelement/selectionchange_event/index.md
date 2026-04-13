---
title: "HTMLTextAreaElement: selectionchange event"
short-title: selectionchange
slug: Web/API/HTMLTextAreaElement/selectionchange_event
page-type: web-api-event
browser-compat: api.HTMLTextAreaElement.selectionchange_event
---

{{APIRef("Selection API")}}

Sự kiện **`selectionchange`** của [Selection API](/en-US/docs/Web/API/Selection) được kích hoạt khi vùng chọn văn bản bên trong phần tử {{HTMLElement("textarea")}} thay đổi.
Điều này bao gồm cả thay đổi trong phạm vi ký tự được chọn, hoặc khi con trỏ nhập di chuyển.

Sự kiện này không thể hủy.

Sự kiện thường được xử lý bằng cách thêm trình lắng nghe sự kiện lên {{HTMLElement("textarea")}}, và trong hàm xử lý đọc các thuộc tính `selectionStart`, `selectionEnd` và `selectionDirection` của {{domxref("HTMLTextAreaElement")}}.

Cũng có thể thêm trình lắng nghe lên trình xử lý sự kiện toàn cục `onselectionchange`, và trong hàm xử lý dùng {{domxref("Document.getSelection()")}} để lấy {{domxref("Selection", "Selection")}}. Tuy nhiên cách này không thật sự hữu ích để lấy thay đổi của vùng chọn _văn bản_.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectionchange", (event) => { })

onselectionchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ dưới đây cho thấy cách lấy văn bản được chọn trong phần tử {{HTMLElement("textarea")}}.

### HTML

```html
<div>
  Enter and select text here:<br /><textarea
    id="my-text"
    rows="2"
    cols="20"></textarea>
</div>
<div>selectionStart: <span id="start"></span></div>
<div>selectionEnd: <span id="end"></span></div>
<div>selectionDirection: <span id="direction"></span></div>
```

### JavaScript

```js
const myInput = document.getElementById("my-text");

myInput.addEventListener("selectionchange", () => {
  document.getElementById("start").textContent = myInput.selectionStart;
  document.getElementById("end").textContent = myInput.selectionEnd;
  document.getElementById("direction").textContent = myInput.selectionDirection;
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
