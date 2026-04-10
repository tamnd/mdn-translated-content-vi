---
title: "HTMLAnchorElement: thuộc tính pathname"
short-title: pathname
slug: Web/API/HTMLAnchorElement/pathname
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.pathname
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`HTMLAnchorElement.pathname`** là một chuỗi bắt đầu bằng `'/'` theo sau là đường dẫn của URL, không bao gồm chuỗi truy vấn hoặc phân đoạn (hoặc chuỗi rỗng nếu không có đường dẫn).

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Một phần tử <a id="myAnchor" href="/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.pathname; // trả về '/en-US/docs/HTMLAnchorElement'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
