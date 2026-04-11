---
title: "EditContext: compositionend event"
short-title: compositionend
slug: Web/API/EditContext/compositionend_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.EditContext.compositionend_event
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Sự kiện `compositionend` của giao diện {{domxref("EditContext")}} được kích hoạt khi kết thúc soạn thảo bằng cửa sổ {{glossary("Input Method Editor")}} (IME).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("compositionend", (event) => { })

oncompositionend = (event) => { }
```

## Ví dụ

### Dùng `compositionend` để thay đổi viền của vùng có thể chỉnh sửa

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
