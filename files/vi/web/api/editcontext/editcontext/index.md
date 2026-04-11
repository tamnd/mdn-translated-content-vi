---
title: "EditContext: EditContext() constructor"
short-title: EditContext()
slug: Web/API/EditContext/EditContext
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.EditContext.EditContext
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Hàm khởi tạo **`EditContext()`** trả về một đối tượng {{DOMxRef("EditContext")}} mới.

## Cú pháp

```js-nolint
new EditContext()
new EditContext(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `text`
      - : Một chuỗi để đặt văn bản ban đầu của `EditContext`.
    - `selectionStart`
      - : Một số để đặt điểm bắt đầu vùng chọn ban đầu của `EditContext`.
    - `selectionEnd`
      - : Một số để đặt điểm kết thúc vùng chọn ban đầu của `EditContext`.

## Ví dụ

### Khởi tạo đối tượng `EditContext`

Ví dụ sau tạo một đối tượng `EditContext` mới với văn bản ban đầu là "Hello world!" và vùng chọn ban đầu bao phủ toàn bộ văn bản.

```html
<div id="editor"></div>
```

```js
const initialText = "Hello world!";

const editContext = new EditContext({
  text: initialText,
  selectionStart: 0,
  selectionEnd: initialText.length,
});

const editorElement = document.getElementById("editor");
editorElement.editContext = editContext;

console.log(
  `EditContext object ready. Text: ${editContext.text}. Selection: ${editContext.selectionStart} - ${editContext.selectionEnd}.`,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
