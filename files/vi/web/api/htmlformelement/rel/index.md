---
title: "HTMLFormElement: thuộc tính rel"
short-title: rel
slug: Web/API/HTMLFormElement/rel
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.rel
---

{{APIRef("HTML DOM")}}

Thuộc tính **`rel`** của giao diện {{domxref("HTMLFormElement")}} phản ánh thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel). Nó là một chuỗi chứa các loại liên kết mà phần tử HTML {{HTMLElement("form")}} tạo ra, dưới dạng danh sách các giá trị liệt kê được phân tách bằng khoảng trắng.

Để truy xuất giá trị dưới dạng mảng các token, hãy sử dụng {{domxref("HTMLFormElement.relList")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const form = document.querySelector("form");
console.log(form.rel);

form.rel = "noopener noreferrer";
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFormElement.relList")}}
- {{domxref("HTMLLinkElement.rel")}}
- {{domxref("HTMLAnchorElement.rel")}}
