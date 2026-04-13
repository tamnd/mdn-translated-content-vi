---
title: "SVGLengthList: removeItem() method"
short-title: removeItem()
slug: Web/API/SVGLengthList/removeItem
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.removeItem
---

{{APIRef("SVG")}}

Phương thức **`removeItem()`** của giao diện {{domxref("SVGLengthList")}} xóa một phần tử hiện có tại chỉ mục đã cho khỏi danh sách.

## Cú pháp

```js-nolint
removeItem(index)
```

### Tham số

- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần xóa.

### Giá trị trả về

{{domxref("SVGLength")}} đã bị xóa khỏi danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi danh sách là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra khi chỉ mục nằm ngoài phạm vi của danh sách.

## Ví dụ

Xem {{domxref("SVGLengthList")}} để xem ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
