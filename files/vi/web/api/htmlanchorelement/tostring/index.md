---
title: "HTMLAnchorElement: phương thức toString()"
short-title: toString()
slug: Web/API/HTMLAnchorElement/toString
page-type: web-api-instance-method
browser-compat: api.HTMLAnchorElement.toString
---

{{ApiRef("URL API")}}

Phương thức {{Glossary("stringifier")}} **`HTMLAnchorElement.toString()`**
trả về một chuỗi chứa toàn bộ URL. Đây là phiên bản chỉ đọc của {{domxref("HTMLAnchorElement.href")}}.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa URL đầy đủ của phần tử.

## Ví dụ

### Gọi toString trên một phần tử neo

```js
// Một phần tử <a id="myAnchor" href="/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.toString(); // trả về 'https://developer.mozilla.org/en-US/docs/HTMLAnchorElement'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
