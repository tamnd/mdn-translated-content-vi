---
title: "HTMLTextAreaElement: rows property"
short-title: rows
slug: Web/API/HTMLTextAreaElement/rows
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.rows
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`rows`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} là một số nguyên dương đại diện cho số dòng văn bản hiển thị của điều khiển văn bản. Nó phản ánh thuộc tính [`rows`](/en-US/docs/Web/HTML/Reference/Elements/textarea#rows) của phần tử `<textarea>`.

## Giá trị

Một số nguyên dương. Mặc định là `2`.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
const textLines = textArea.rows;
textArea.rows = textLines + 2;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.cols")}}
- {{DOMXref("HTMLTextAreaElement.wrap")}}
- Thuộc tính CSS {{cssxref("resize")}}
