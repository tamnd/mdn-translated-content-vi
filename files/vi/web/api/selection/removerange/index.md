---
title: "Selection: phương thức removeRange()"
short-title: removeRange()
slug: Web/API/Selection/removeRange
page-type: web-api-instance-method
browser-compat: api.Selection.removeRange
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.removeRange()`** xóa một range khỏi vùng chọn.

## Cú pháp

```js-nolint
removeRange(range)
```

### Tham số

- `range`
  - : Một range object sẽ bị xóa khỏi vùng chọn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
/* Theo lập trình, có thể chọn nhiều hơn một range.
 * Đoạn này sẽ xóa mọi range trừ range đầu tiên. */
const s = window.getSelection();
if (s.rangeCount > 1) {
  for (let i = 1; i < s.rangeCount; i++) {
    s.removeRange(s.getRangeAt(i));
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
