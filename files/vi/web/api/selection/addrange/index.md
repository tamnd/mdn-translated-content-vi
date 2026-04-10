---
title: "Selection: phương thức addRange()"
short-title: addRange()
slug: Web/API/Selection/addRange
page-type: web-api-instance-method
browser-compat: api.Selection.addRange
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.addRange()`** thêm một {{domxref("Range")}} vào một {{domxref("Selection")}}.

## Cú pháp

```js-nolint
addRange(range)
```

### Tham số

- `range`
  - : Một đối tượng {{ domxref("Range") }} sẽ được thêm vào {{domxref("Selection")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Lưu ý rằng chỉ Firefox hỗ trợ nhiều selection range. Trong ví dụ này, các trình duyệt khác sẽ không thêm range mới vào vùng chọn nếu nó đã chứa một range.

### HTML

```html
<p>
  I <strong>insist</strong> that you <strong>try</strong> selecting the
  <strong>strong words</strong>.
</p>
<button>Select strong words</button>
```

### JavaScript

```js
let button = document.querySelector("button");

button.addEventListener("click", () => {
  const selection = window.getSelection();
  const strongElems = document.getElementsByTagName("strong");

  if (selection.rangeCount > 0) {
    selection.removeAllRanges();
  }

  for (const node of strongElems) {
    const range = document.createRange();
    range.selectNode(node);
    selection.addRange(range);
  }
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà phương thức này thuộc về
