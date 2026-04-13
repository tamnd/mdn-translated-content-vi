---
title: "InputEvent: thuộc tính inputType"
short-title: inputType
slug: Web/API/InputEvent/inputType
page-type: web-api-instance-property
browser-compat: api.InputEvent.inputType
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`inputType`** của giao diện {{domxref("InputEvent")}} trả về loại thay đổi được thực hiện đối với nội dung có thể chỉnh sửa. Các thay đổi có thể bao gồm, ví dụ, chèn, xóa và định dạng văn bản.

## Giá trị

Một chuỗi chứa loại đầu vào đã được thực hiện. Có nhiều giá trị có thể, chẳng hạn như `insertText`, `deleteContentBackward`, `insertFromPaste`, và `formatBold`. Để biết danh sách đầy đủ các loại đầu vào có sẵn, xem [phần Thuộc tính của đặc tả Input Events Level 2](https://w3c.github.io/input-events/#interface-InputEvent-Attributes).

## Ví dụ

Ví dụ này ghi nhật ký `inputType` cho [sự kiện đầu vào](/en-US/docs/Web/API/Element/input_event) trên một {{htmlElement("div")}} có thể chỉnh sửa.

### HTML

```html
<p id="log">Input type:</p>
<div contenteditable="true" class="sample-text">
  <p>
    Some sample text. Try inserting line breaks, or deleting text in different
    ways, or pasting different content in.
  </p>
  <hr />
  <ul>
    <li>A sample</li>
    <li>bulleted</li>
    <li>list.</li>
  </ul>
  <p>Another paragraph.</p>
</div>
```

### CSS

```css
.sample-text {
  margin: 20px;
  padding: 20px;
  border: 2px dashed red;
}
```

### JavaScript

```js
const log = document.getElementById("log");
const editable = document.querySelector("div[contenteditable]");
editable.addEventListener("input", logInputType);

function logInputType(event) {
  log.textContent = `Input type: ${event.inputType}`;
}
```

### Kết quả

Hãy thử chỉnh sửa văn bản bên trong `<div>` và xem điều gì xảy ra.

{{EmbedLiveSample("Examples", '100%', 500)}}

> [!NOTE]
> Xem thêm [bộ kiểm tra InputEvent của Masayuki Nakano](https://d-toybox.com/studio/lib/input_event_viewer.html) để có ví dụ chi tiết hơn.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
