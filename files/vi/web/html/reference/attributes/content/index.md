---
title: "HTML attribute: content"
short-title: content
slug: Web/HTML/Reference/Attributes/content
page-type: html-attribute
browser-compat: html.elements.meta.content
sidebar: htmlsidebar
---

Thuộc tính **`content`** chỉ định giá trị của tên metadata được xác định bởi thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của `<meta>`.
Nó nhận một chuỗi làm giá trị, và cú pháp mong đợi thay đổi tùy thuộc vào giá trị `name` được sử dụng.

## Giá trị

Các loại giá trị mà thuộc tính `content` chấp nhận phụ thuộc vào giá trị `name`.
Để biết chi tiết về các định dạng và kiểu cụ thể, xem trang [thuộc tính `name` của `<meta>`](/en-US/docs/Web/HTML/Reference/Elements/meta/name).

## Ví dụ

### Đặt mô tả meta cho tài liệu

Thẻ `<meta>` sau đây sử dụng `name=description` để đặt "mô tả meta" cho tài liệu.
Thuộc tính `content` cung cấp giá trị cho metadata:

```html
<meta
  name="description"
  content="The HTML reference describes all elements and attributes of HTML, including global attributes that apply to all elements." />
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của `<meta>`
