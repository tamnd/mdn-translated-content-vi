---
title: "AbstractRange: thuộc tính endOffset"
short-title: endOffset
slug: Web/API/AbstractRange/endOffset
page-type: web-api-instance-property
browser-compat: api.AbstractRange.endOffset
---

{{APIRef("DOM")}}

Thuộc tính **`endOffset`** của giao diện {{domxref("AbstractRange")}} trả về độ lệch trong nút kết thúc tại vị trí kết thúc của phạm vi.

Để thay đổi vị trí kết thúc, hãy dùng phương thức {{domxref("Range.setEnd()")}} hoặc một phương thức tương tự.

## Giá trị

Một giá trị số nguyên cho biết số ký tự tính từ đầu {{domxref("Node")}} được chỉ ra bởi {{domxref("AbstractRange.endContainer", "endContainer")}} tới vị trí ranh giới nơi ký tự cuối cùng của phạm vi nằm.

Nếu `endContainer` là một {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDATASection")}}, thì độ lệch là số ký tự từ đầu `endContainer` tới điểm ranh giới của phạm vi. Với các kiểu {{domxref("Node")}} khác, `endOffset` là số nút con nằm giữa phần đầu của `endContainer` và điểm ranh giới của phạm vi.

## Ví dụ

```js
const range = document.createRange();
range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);

const endRangeOffset = range.endOffset;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
