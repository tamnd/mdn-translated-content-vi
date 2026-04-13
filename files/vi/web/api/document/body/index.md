---
title: "Document: thuộc tính body"
short-title: body
slug: Web/API/Document/body
page-type: web-api-instance-property
browser-compat: api.Document.body
---

{{APIRef("DOM")}}

Thuộc tính **`Document.body`** đại diện cho nút {{HTMLElement("body")}} hoặc {{HTMLElement("frameset")}} của tài liệu hiện tại, hoặc `null` nếu không có phần tử nào như vậy tồn tại.

## Giá trị

Một trong các giá trị sau:

- {{domxref("HTMLBodyElement")}}
- {{domxref("HTMLFrameSetElement")}}
- `null`

## Ví dụ

```js
// Given this HTML: <body id="oldBodyElement"></body>
alert(document.body.id); // "oldBodyElement"

const newBodyElement = document.createElement("body");

newBodyElement.id = "newBodyElement";
document.body = newBodyElement;
alert(document.body.id); // "newBodyElement"
```

## Ghi chú

`document.body` là phần tử chứa nội dung của tài liệu.
Trong các tài liệu có nội dung `<body>`, trả về phần tử `<body>`, và trong các tài liệu frameset, trả về phần tử `<frameset>` ngoài cùng.

Mặc dù thuộc tính `body` có thể thiết lập được, nhưng việc thiết lập một body mới cho một tài liệu sẽ xóa tất cả các phần tử con hiện tại của phần tử `<body>` hiện có.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.head")}}
