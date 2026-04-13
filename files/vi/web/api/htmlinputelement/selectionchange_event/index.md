---
title: "HTMLInputElement: sự kiện selectionchange"
short-title: selectionchange
slug: Web/API/HTMLInputElement/selectionchange_event
page-type: web-api-event
browser-compat: api.HTMLInputElement.selectionchange_event
---

{{APIRef("Selection API")}}

Sự kiện **`selectionchange`** của [Selection API](/en-US/docs/Web/API/Selection) được kích hoạt khi lựa chọn văn bản trong phần tử {{HTMLElement("input")}} thay đổi.
Điều này bao gồm cả thay đổi trong phạm vi ký tự được chọn, hoặc nếu con trỏ di chuyển.

Sự kiện này không thể hủy.

Sự kiện thường được xử lý bằng cách thêm trình lắng nghe sự kiện trên {{HTMLElement("input")}}, và trong hàm xử lý đọc các thuộc tính `selectionStart`, `selectionEnd` và `selectionDirection` của {{domxref("HTMLInputElement")}}.

Cũng có thể thêm trình lắng nghe trên trình xử lý sự kiện `onselectionchange`, và trong hàm xử lý sử dụng {{domxref("Document.getSelection()")}} để lấy {{domxref("Selection", "Selection")}}. Tuy nhiên, điều này không hữu ích lắm để nhận các thay đổi lựa chọn _văn bản_.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectionchange", (event) => { })

onselectionchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ dưới đây cho thấy cách lấy văn bản được chọn trong phần tử {{HTMLElement("input")}}.

### HTML

```html
<div>
  Nhập và chọn văn bản tại đây:<br /><input id="my-text" rows="2" cols="20" />
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
