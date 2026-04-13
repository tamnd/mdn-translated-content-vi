---
title: "Range: phương thức isPointInRange()"
short-title: isPointInRange()
slug: Web/API/Range/isPointInRange
page-type: web-api-instance-method
browser-compat: api.Range.isPointInRange
---

{{APIRef("DOM")}}

Phương thức **`isPointInRange()`** của giao diện {{domxref("Range")}} xác định liệu một điểm đã chỉ định có nằm trong {{domxref("Range")}} hay không. Điểm được xác định bởi một nút tham chiếu và một độ lệch trong nút đó. Phương thức này tương đương với việc gọi {{domxref("Range.comparePoint()")}} và kiểm tra xem kết quả có bằng `0` hay không.

## Cú pháp

```js-nolint
isPointInRange(referenceNode, offset)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `offset` được tính theo.
- `offset`
  - : Một số nguyên lớn hơn hoặc bằng 0 mô tả vị trí bên trong `referenceNode` của điểm cần kiểm tra. Nếu `referenceNode` là {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDATASection")}}, thì `offset` là số ký tự tính từ đầu `referenceNode`. Với các kiểu `Node` khác, `offset` là số nút con tính từ đầu `referenceNode`.

### Giá trị trả về

Một boolean.

## Ví dụ

```js
const text = new Text("0123456789");

const thisRange = new Range();
thisRange.setStart(text, 1);
thisRange.setEnd(text, 6);

thisRange.isPointInRange(text, 3); // true
thisRange.isPointInRange(text, 0); // false
thisRange.isPointInRange(text, 6); // true
thisRange.isPointInRange(text, 7); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
