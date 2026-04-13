---
title: "Range: phương thức setEnd()"
short-title: setEnd()
slug: Web/API/Range/setEnd
page-type: web-api-instance-method
browser-compat: api.Range.setEnd
---

{{APIRef("DOM")}}

Phương thức **`Range.setEnd()`** đặt vị trí kết thúc của một {{domxref("Range")}} tại độ lệch đã cho bên trong nút được chỉ định. Việc đặt điểm kết thúc cao hơn điểm bắt đầu trong cây tài liệu sẽ tạo ra một range bị thu gọn, với cả điểm bắt đầu và kết thúc đều được đặt về vị trí kết thúc đã chỉ định.

## Cú pháp

```js-nolint
setEnd(endNode, endOffset)
```

### Tham số

- `endNode`
  - : {{domxref("Node")}} bên trong đó {{domxref("Range")}} nên kết thúc.
- `endOffset`
  - : Một số nguyên lớn hơn hoặc bằng 0 biểu thị độ lệch của điểm kết thúc `Range` tính từ đầu `endNode`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidNodeTypeError` {{domxref("DOMException")}}
  - : Nút được chỉ định bởi `endNode` là nút doctype; các điểm cuối của range không thể nằm bên trong nút doctype.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Giá trị của `endOffset` lớn hơn hoặc bằng độ dài của nút, hoặc nhỏ hơn 0.

## Ghi chú sử dụng

Nếu `endNode` là {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDataSection")}}, thì `endOffset` là số ký tự tính từ đầu `endNode`. Với các kiểu `Node` khác, `endOffset` là số nút con tính từ đầu `endNode`.

## Ví dụ

```js
const range = document.createRange();
const endNode = document.getElementsByTagName("p").item(3);
const endOffset = endNode.childNodes.length;
range.setEnd(endNode, endOffset);
```

> [!NOTE]
> `setEnd()` thường được dùng cùng với {{domxref("Range.setStart", "setStart()")}} để cấu hình đầy đủ một range.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
