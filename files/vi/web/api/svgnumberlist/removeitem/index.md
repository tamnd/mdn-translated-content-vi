---
title: "SVGNumberList: removeItem() method"
short-title: removeItem()
slug: Web/API/SVGNumberList/removeItem
page-type: web-api-instance-method
browser-compat: api.SVGNumberList.removeItem
---

{{APIRef("SVG")}}

Phương thức **`removeItem()`** của giao diện {{domxref("SVGNumberList")}} xóa phần tử hiện có tại chỉ mục đã cho khỏi danh sách.

## Cú pháp

```js-nolint
removeItem(index)
```

### Tham số

- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần xóa.

### Giá trị trả về

{{domxref("SVGNumber")}} đã được xóa khỏi danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGNumberList")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra khi chỉ mục nằm ngoài phạm vi của danh sách.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
