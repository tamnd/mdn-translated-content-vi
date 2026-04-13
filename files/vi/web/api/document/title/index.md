---
title: "Document: thuộc tính title"
short-title: title
slug: Web/API/Document/title
page-type: web-api-instance-property
browser-compat: api.Document.title
---

{{APIRef("DOM")}}

Thuộc tính **`document.title`** lấy hoặc đặt tiêu đề hiện tại của tài liệu. Khi có mặt, nó mặc định là giá trị của phần tử [`<title>`](/en-US/docs/Web/HTML/Reference/Elements/title).

## Giá trị

Một chuỗi chứa tiêu đề của _tài liệu_. Nếu tiêu đề bị ghi đè bằng cách đặt `document.title`, nó chứa giá trị đó. Nếu không, nó chứa tiêu đề được chỉ định trong phần tử [`<title>`](/en-US/docs/Web/HTML/Reference/Elements/title).

```js
document.title = newTitle;
```

`newTitle` là tiêu đề mới của tài liệu. Phép gán ảnh hưởng đến giá trị trả về của `document.title`, tiêu đề hiển thị cho tài liệu (ví dụ: trên thanh tiêu đề của cửa sổ hoặc tab), và nó cũng ảnh hưởng đến DOM của tài liệu (ví dụ: nội dung của phần tử `<title>` trong tài liệu HTML).

## Ví dụ

Giả sử `<head>` của tài liệu trông như sau:

```html
<head>
  <meta charset="UTF-8" />
  <title>Hello World!</title>
</head>
```

```js
console.log(document.title); // "Hello World!"
document.title = "Goodbye World!"; // Tiêu đề trang đã thay đổi
console.log(document.title); // "Goodbye World!"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
