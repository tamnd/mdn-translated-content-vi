---
title: "EditContext: attachedElements() method"
short-title: attachedElements()
slug: Web/API/EditContext/attachedElements
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.attachedElements
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`attachedElements()`** của giao diện {{domxref("EditContext")}} trả về một {{jsxref("Array")}} chỉ chứa một phần tử. Phần tử đó là phần tử được liên kết với đối tượng `EditContext`.

## Cú pháp

```js-nolint
attachedElements()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} chứa một đối tượng {{domxref("HTMLElement")}}.

Chỉ có thể có một phần tử được liên kết với một thực thể `EditContext`, do đó mảng trả về sẽ luôn chứa một phần tử. Nếu API được mở rộng trong tương lai để hỗ trợ nhiều phần tử được liên kết, giá trị trả về sẽ là một mảng chứa nhiều phần tử.

## Ví dụ

### Lấy phần tử được liên kết với thực thể `EditContext`

Ví dụ này cho thấy cách dùng phương thức `attachedElements` để lấy phần tử được liên kết với một thực thể `EditContext`.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const canvas = document.getElementById("editor-canvas");
const editContext = new EditContext();
canvas.editContext = editContext;

const attachedElements = editContext.attachedElements();
console.log(attachedElements[0] === canvas); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
