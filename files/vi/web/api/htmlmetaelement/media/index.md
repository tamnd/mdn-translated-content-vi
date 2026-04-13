---
title: "HTMLMetaElement: thuộc tính media"
short-title: media
slug: Web/API/HTMLMetaElement/media
page-type: web-api-instance-property
browser-compat: api.HTMLMetaElement.media
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMetaElement.media`** cho phép chỉ định media cho siêu dữ liệu `theme-color`.

Thuộc tính `theme-color` cho phép đặt màu sắc của thanh công cụ hoặc giao diện người dùng của trình duyệt trong các trình duyệt và hệ điều hành hỗ trợ thuộc tính này.
Thuộc tính `media` cho phép đặt các màu theme khác nhau cho các giá trị `media` khác nhau.

## Giá trị

Một chuỗi.

## Ví dụ

### Đặt màu theme cho chế độ tối

Ví dụ sau tạo một phần tử `<meta>` mới với thuộc tính `name` được đặt thành [`theme-color`](/en-US/docs/Web/HTML/Reference/Elements/meta/name#meta_names_defined_in_the_html_specification).
Thuộc tính `content` được đặt thành `#3c790a`, thuộc tính `media` được đặt thành `prefers-color-scheme: dark`, và phần tử được thêm vào `<head>` của tài liệu.
Khi người dùng đã chỉ định chế độ tối trong hệ điều hành của họ, thuộc tính `media` có thể được sử dụng để đặt `theme-color` khác:

```js
const meta = document.createElement("meta");
meta.name = "theme-color";
meta.content = "#3c790a";
meta.media = "(prefers-color-scheme: dark)";
document.head.appendChild(meta);
```

### Đặt màu theme theo kích thước thiết bị

Hầu hết các thuộc tính meta chỉ có thể được sử dụng một lần. Tuy nhiên, `theme-color` có thể được sử dụng nhiều lần nếu cung cấp các giá trị `media` khác nhau.

Ví dụ này thêm hai phần tử meta với `theme-color`: một cho tất cả các thiết bị và một cho màn hình nhỏ.
Thứ tự khớp của truy vấn `media` quan trọng, vì vậy truy vấn cụ thể hơn nên được thêm sau trong tài liệu, như hiển thị bên dưới:

```js
// Thêm theme-color cho tất cả thiết bị
const meta1 = document.createElement("meta");
meta1.name = "theme-color";
meta1.content = "white";
document.head.appendChild(meta1);

// Thêm theme-color cho thiết bị nhỏ
const meta2 = document.createElement("meta");
meta2.name = "theme-color";
meta2.media = "(width <= 600px)";
meta2.content = "black";
document.head.appendChild(meta2);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("meta")}}
- [Các giá trị có thể cho media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
