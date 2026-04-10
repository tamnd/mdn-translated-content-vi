---
title: "Selection: phương thức deleteFromDocument()"
short-title: deleteFromDocument()
slug: Web/API/Selection/deleteFromDocument
page-type: web-api-instance-method
browser-compat: api.Selection.deleteFromDocument
---

{{ ApiRef("DOM") }}

Phương thức **`deleteFromDocument()`** của giao diện {{domxref("Selection")}} gọi phương thức {{domxref("Range.deleteContents()")}} trên {{domxref("Range")}} đang được chọn.

## Cú pháp

```js-nolint
deleteFromDocument()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho phép bạn xóa văn bản và/hoặc nút đã chọn bằng cách bấm vào một nút. Khi bấm nút, phương thức {{domxref("Window.getSelection()")}} lấy nội dung đã chọn, và phương thức `deleteFromDocument()` sẽ xóa nó.

### HTML

```html
<p>Try highlighting some of the elements in these paragraphs.</p>
<p>
  Once you do, you can remove the selected content by clicking the button below.
</p>
<h2>All of the selected text/nodes will be removed.</h2>
<button>Delete selected text</button>
```

### JavaScript

```js
let button = document.querySelector("button");
button.addEventListener("click", deleteSelection);

function deleteSelection() {
  let selection = window.getSelection();
  selection.deleteFromDocument();
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện định nghĩa phương thức này
