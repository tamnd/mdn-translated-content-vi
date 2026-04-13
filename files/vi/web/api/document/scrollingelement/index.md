---
title: "Document: scrollingElement property"
short-title: scrollingElement
slug: Web/API/Document/scrollingElement
page-type: web-api-instance-property
browser-compat: api.Document.scrollingElement
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`scrollingElement`** của giao diện {{domxref("Document")}} trả về tham chiếu đến {{domxref("Element")}} cuộn tài liệu. Ở chế độ chuẩn, đây là phần tử gốc của tài liệu, {{domxref("document.documentElement")}}.

Khi ở chế độ quirks, thuộc tính `scrollingElement` trả về phần tử HTML `body` nếu nó tồn tại và _không_ [có khả năng cuộn](https://drafts.csswg.org/cssom-view/#potentially-scrollable), ngược lại trả về `null`. Điều này có vẻ đáng ngạc nhiên nhưng đúng theo cả đặc tả và trình duyệt.

## Giá trị

{{domxref("Element")}} cuộn tài liệu, thường là phần tử gốc (trừ khi không ở chế độ chuẩn).

## Ví dụ

```js
const scrollElm = document.scrollingElement;
scrollElm.scrollTop = 0;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
