---
title: "EditContext: compositionstart event"
short-title: compositionstart
slug: Web/API/EditContext/compositionstart_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.EditContext.compositionstart_event
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Sự kiện `compositionstart` của giao diện {{domxref("EditContext")}} được kích hoạt khi bắt đầu soạn thảo bằng cửa sổ {{glossary("Input Method Editor")}} (IME).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("compositionstart", (event) => { })

oncompositionstart = (event) => { }
```

## Ví dụ

### Dùng `compositionstart` để thay đổi viền của vùng có thể chỉnh sửa

Trong ví dụ sau, viền của vùng có thể chỉnh sửa được đặt thành màu đỏ khi sự kiện `compositionstart` được kích hoạt, và trở lại màu đen khi sự kiện `compositionend` được kích hoạt. Lưu ý rằng các callback trong ví dụ này chỉ được gọi khi dùng cửa sổ IME hoặc các giao diện người dùng chỉnh sửa khác của nền tảng để soạn thảo văn bản.

```css
#text-editor {
  border: 1px solid black;
}
#text-editor.is-composing {
  border-color: red;
}
```

```html
<div id="text-editor"></div>
```

```js
const editorElement = document.getElementById("text-editor");
const editContext = new EditContext();
editorElement.editContext = editContext;

editContext.addEventListener("compositionstart", (event) => {
  editorElement.classList.add("is-composing");
});

editContext.addEventListener("compositionend", (event) => {
  editorElement.classList.remove("is-composing");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
