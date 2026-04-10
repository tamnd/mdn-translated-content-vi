---
title: "Range: phương thức setStart()"
short-title: setStart()
slug: Web/API/Range/setStart
page-type: web-api-instance-method
browser-compat: api.Range.setStart
---

{{APIRef("DOM")}}

Phương thức **`Range.setStart()`** đặt vị trí bắt đầu của một {{domxref("Range")}}.

Nếu `startNode` là {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDataSection")}}, thì `startOffset` là số ký tự tính từ đầu `startNode`. Với các kiểu `Node` khác, `startOffset` là số nút con tính từ đầu `startNode`.

Việc đặt điểm bắt đầu thấp hơn điểm kết thúc trong cây tài liệu sẽ tạo ra một range bị thu gọn, với cả điểm bắt đầu và kết thúc đều được đặt về vị trí bắt đầu đã chỉ định.

## Cú pháp

```js-nolint
setStart(startNode, startOffset)
```

### Tham số

- `startNode`
  - : {{domxref("Node")}} nơi {{domxref("Range")}} nên bắt đầu.
- `startOffset`
  - : Một số nguyên lớn hơn hoặc bằng 0 biểu thị độ lệch của điểm bắt đầu {{domxref("Range")}} tính từ đầu `startNode`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Làm nổi bật một phần của phần tử

Ví dụ này dùng các phương thức `Range.setStart()` và {{domxref("Range.setEnd()")}} để thêm một phần địa chỉ vào range. Range được chọn sau đó được làm nổi bật bằng {{domxref("Range.surroundContents()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
