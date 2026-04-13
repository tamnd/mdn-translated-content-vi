---
title: "HTMLMetaElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLMetaElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLMetaElement.name
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMetaElement.name`** được sử dụng kết hợp với {{domxref("HTMLMetaElement.content")}} để định nghĩa các cặp tên-giá trị cho siêu dữ liệu của một tài liệu.
Thuộc tính `name` định nghĩa tên siêu dữ liệu và thuộc tính `content` định nghĩa giá trị.

## Giá trị

Một chuỗi.

## Ví dụ

### Đọc tên siêu dữ liệu của phần tử meta

Ví dụ sau truy vấn phần tử `<meta>` đầu tiên trong tài liệu.
Giá trị `name` được ghi vào bảng điều khiển, cho thấy [từ khóa](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification) đã được chỉ định cho tài liệu:

```js
// given <meta name="keywords" content="documentation, HTML, web technologies">
const meta = document.querySelector("meta");
console.log(meta.name);
// "keywords"
```

### Tạo phần tử meta với siêu dữ liệu `author`

Ví dụ sau tạo một phần tử `<meta>` mới với thuộc tính `name` được đặt thành [`author`](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification).
Thuộc tính `content` đặt tác giả của tài liệu và phần tử được thêm vào `<head>` của tài liệu:

```js
let meta = document.createElement("meta");
meta.name = "author";
meta.content = "Franz Kafka";
document.head.appendChild(meta);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("meta")}}
- [Các giá trị có thể cho thuộc tính name](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification)
