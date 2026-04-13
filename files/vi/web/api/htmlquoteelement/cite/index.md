---
title: "HTMLQuoteElement: thuộc tính cite"
short-title: cite
slug: Web/API/HTMLQuoteElement/cite
page-type: web-api-instance-property
browser-compat: api.HTMLQuoteElement.cite
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`cite`** của giao diện {{domxref("HTMLQuoteElement")}} cho biết URL của nguồn trích dẫn. Nó phản ánh thuộc tính [`cite`](/en-US/docs/Web/HTML/Reference/Elements/q#cite) của phần tử {{HTMLElement("q")}}.

## Giá trị

Một chuỗi đại diện cho một URL.

## Ví dụ

```js
const quote = document.querySelector("q");
console.log(`Nguồn gốc: ${quote.cite}`); // giá trị hiện tại
quote.cite = "https://example.com/quotes"; // cập nhật giá trị
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLQuoteElement")}}
- {{domxref("HTMLModElement.cite")}}
