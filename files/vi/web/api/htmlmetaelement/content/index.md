---
title: "HTMLMetaElement: thuộc tính content"
short-title: content
slug: Web/API/HTMLMetaElement/content
page-type: web-api-instance-property
browser-compat: api.HTMLMetaElement.content
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMetaElement.content`** lấy hoặc đặt thuộc tính `content` của các pragma directive và dữ liệu {{htmlelement("meta")}} được đặt tên kết hợp với {{domxref("HTMLMetaElement.name")}} hoặc {{domxref("HTMLMetaElement.httpEquiv")}}.
Để biết thêm thông tin, xem thuộc tính [content](/en-US/docs/Web/HTML/Reference/Elements/meta#content).

## Giá trị

Một chuỗi.

## Ví dụ

### Đọc nội dung của phần tử meta

Ví dụ sau truy vấn một phần tử `<meta>` chứa thuộc tính `name` với giá trị `keywords`.
Giá trị `content` được ghi vào bảng điều khiển để hiển thị [từ khóa](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification) của tài liệu:

```js
// given <meta name="keywords" content="documentation, HTML, web">
const meta = document.querySelector("meta[name='keywords']");
console.log(meta.content);
// "documentation, HTML, web"
```

### Tạo phần tử meta với content

Ví dụ sau tạo một phần tử `<meta>` mới với thuộc tính `name` được đặt thành [`description`](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification).
Thuộc tính `content` đặt mô tả của tài liệu và được thêm vào `<head>` của tài liệu:

```js
const meta = document.createElement("meta");
meta.name = "description";
meta.content =
  "The <meta> element can be used to provide document metadata in terms of name-value pairs, with the name attribute giving the metadata name, and the content attribute giving the value.";
document.head.appendChild(meta);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("meta")}}
- {{domxref("HTMLMetaElement.name")}}
- {{domxref("HTMLMetaElement.httpEquiv")}}
- [Học: Siêu dữ liệu trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#metadata_the_meta_element)
