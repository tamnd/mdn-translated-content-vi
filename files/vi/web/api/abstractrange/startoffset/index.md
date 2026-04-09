---
title: "AbstractRange: thuộc tính startOffset"
short-title: startOffset
slug: Web/API/AbstractRange/startOffset
page-type: web-api-instance-property
browser-compat: api.AbstractRange.startOffset
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`startOffset`** của giao diện {{domxref("AbstractRange")}} trả về độ lệch trong nút bắt đầu tại vị trí bắt đầu của phạm vi.

Để thay đổi vị trí bắt đầu, hãy dùng phương thức {{domxref("Range.setStart()")}} hoặc một phương thức tương tự.

## Giá trị

Một giá trị số nguyên cho biết số ký tự tính từ đầu {{domxref("Node")}} được chỉ ra bởi {{domxref("AbstractRange.startContainer", "startContainer")}} tới vị trí ranh giới nơi ký tự đầu tiên của phạm vi nằm.

Nếu `startContainer` là một {{domxref("Node")}} kiểu {{domxref("Text")}}, {{domxref("Comment")}}, hoặc {{domxref("CDATASection")}}, thì độ lệch là số ký tự từ đầu `startContainer` tới điểm ranh giới của phạm vi. Với các kiểu {{domxref("Node")}} khác, `startOffset` là số nút con nằm giữa phần đầu của `startContainer` và điểm ranh giới của phạm vi.

## Ví dụ

```js
const range = document.createRange();
range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);

const startRangeOffset = range.startOffset;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
