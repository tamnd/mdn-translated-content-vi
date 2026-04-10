---
title: "Range: phương thức comparePoint()"
short-title: comparePoint()
slug: Web/API/Range/comparePoint
page-type: web-api-instance-method
browser-compat: api.Range.comparePoint
---

{{APIRef("DOM")}}

Phương thức **`comparePoint()`** của giao diện {{domxref("Range")}} xác định liệu một điểm được chỉ định nằm trước, trong hay sau {{domxref("Range")}}. Điểm được xác định bởi một nút tham chiếu và một độ lệch trong nút đó.

## Cú pháp

```js-nolint
comparePoint(referenceNode, offset)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `offset` được tính theo.
- `offset`
  - : Một số nguyên lớn hơn hoặc bằng 0 mô tả vị trí bên trong `referenceNode` của điểm cần kiểm tra. Nếu `referenceNode` là {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDATASection")}}, thì `offset` là số ký tự tính từ đầu `referenceNode`. Với các kiểu `Node` khác, `offset` là số nút con tính từ đầu `referenceNode`.

### Giá trị trả về

Một số.

- `-1` nếu điểm được chỉ định bởi `referenceNode` và `offset` nằm trước đầu `Range` này.
- `0` nếu điểm được chỉ định bởi `referenceNode` và `offset` nằm trong `Range` này.
- `1` nếu điểm được chỉ định bởi `referenceNode` và `offset` nằm sau cuối `Range` này.

## Ví dụ

```js
const text = new Text("0123456789");

const thisRange = new Range();
thisRange.setStart(text, 1);
thisRange.setEnd(text, 6);

thisRange.comparePoint(text, 3); // 0
thisRange.comparePoint(text, 0); // -1
thisRange.comparePoint(text, 6); // 0
thisRange.comparePoint(text, 7); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
