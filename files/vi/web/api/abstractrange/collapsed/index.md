---
title: "AbstractRange: thuộc tính collapsed"
short-title: collapsed
slug: Web/API/AbstractRange/collapsed
page-type: web-api-instance-property
browser-compat: api.AbstractRange.collapsed
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`collapsed`** của giao diện {{domxref("AbstractRange")}} trả về `true` nếu vị trí bắt đầu và kết thúc của phạm vi là giống nhau.

Một phạm vi thu gọn là phạm vi rỗng, không chứa nội dung nào, và biểu diễn một điểm duy nhất trong cây DOM. Để thu gọn một phạm vi, hãy xem phương thức {{domxref("Range.collapse()")}}.

## Giá trị

Một giá trị boolean có giá trị `true` nếu phạm vi đang _thu gọn_ (_collapsed_). Đây là phạm vi mà vị trí bắt đầu và kết thúc trùng nhau, tạo thành một phạm vi dài 0 ký tự.

## Ví dụ

```js
const range = document.createRange();
range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);

const isCollapsed = range.collapsed;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
