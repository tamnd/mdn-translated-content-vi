---
title: "Range: phương thức selectNodeContents()"
short-title: selectNodeContents()
slug: Web/API/Range/selectNodeContents
page-type: web-api-instance-method
browser-compat: api.Range.selectNodeContents
---

{{APIRef("DOM")}}

Phương thức **`Range.selectNodeContents()`** đặt {{domxref("Range")}} để chứa nội dung của một {{domxref("Node")}}.

Nút cha `Node` của điểm bắt đầu và kết thúc của `Range` sẽ là nút tham chiếu. `startOffset` là `0`, còn `endOffset` là số nút con hoặc số ký tự có trong nút tham chiếu.

## Cú pháp

```js-nolint
selectNodeContents(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà nội dung của nó sẽ được chọn trong một {{domxref("Range")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();
const referenceNode = document.querySelector("div");
range.selectNodeContents(referenceNode);
```

### Live sample

Ví dụ này cho phép người dùng chọn và bỏ chọn một đoạn văn bằng các nút. {{domxref("Document.createRange()")}}, `Range.selectNodeContents()`, và {{domxref("Selection.addRange()")}} được dùng để chọn nội dung. {{domxref("Window.getSelection()")}} và {{domxref("Selection.removeAllRanges()")}} được dùng để bỏ chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
