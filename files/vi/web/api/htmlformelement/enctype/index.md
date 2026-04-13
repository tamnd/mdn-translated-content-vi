---
title: "HTMLFormElement: thuộc tính enctype"
short-title: enctype
slug: Web/API/HTMLFormElement/enctype
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.enctype
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLFormElement.enctype`** là {{Glossary("MIME_type", "kiểu MIME")}} của nội dung được sử dụng để gửi biểu mẫu đến máy chủ. Các giá trị có thể là:

- `application/x-www-form-urlencoded`: Kiểu mặc định ban đầu.
- `multipart/form-data`: Kiểu cho phép phần tử {{HTMLElement("input")}} tải lên dữ liệu tệp.
- `text/plain`: Định dạng không rõ ràng, nội dung con người có thể đọc được nhưng máy tính không thể diễn giải một cách đáng tin cậy.

Giá trị này có thể bị ghi đè bởi thuộc tính [`formenctype`](/en-US/docs/Web/HTML/Reference/Elements/button#formenctype) trên phần tử {{HTMLElement("button")}} hoặc {{HTMLElement("input")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
form.enctype = "application/x-www-form-urlencoded";
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
