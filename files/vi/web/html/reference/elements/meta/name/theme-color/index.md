---
title: <meta name="theme-color">
short-title: theme-color
slug: Web/HTML/Reference/Elements/meta/name/theme-color
page-type: html-attribute-value
browser-compat: html.elements.meta.name.theme-color
sidebar: htmlsidebar
---

Giá trị **`theme-color`** cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử {{htmlelement("meta")}} chỉ ra một màu được đề xuất mà các user agent nên sử dụng để tùy chỉnh hiển thị trang hoặc giao diện người dùng xung quanh.
Nếu được chỉ định, bạn xác định màu chủ đề bằng cách sử dụng thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) trong phần tử `<meta>` dưới dạng giá trị CSS {{cssxref("&lt;color&gt;")}}.

Ví dụ, để chỉ ra rằng một tài liệu nên sử dụng `cornflowerblue` làm màu chủ đề, hãy đặt `<meta>` như sau:

```html
<meta name="theme-color" content="cornflowerblue" />
```

Để đặt phương tiện mà siêu dữ liệu màu chủ đề áp dụng, hãy thêm thuộc tính [`media`](/en-US/docs/Web/HTML/Reference/Elements/meta#media) với một danh sách media query hợp lệ (xem [ví dụ media query với theme-color](#using_a_media_query_with_theme-color)).

## Ghi chú sử dụng

Một phần tử `<meta name="theme-color">` có các thuộc tính bổ sung sau:

- [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content)
  - : Một phần tử `<meta>` với `name=theme-color` phải có thuộc tính `content` xác định màu chủ đề.
    Giá trị của thuộc tính `content` như sau:
    - Giá trị {{cssxref("&lt;color&gt;")}}
      - : Một giá trị màu hợp lệ, chẳng hạn như thập lục phân, RGB, màu được đặt tên, v.v.
- `media` {{optional_inline}}
  - : Bất kỳ loại phương tiện hoặc truy vấn hợp lệ nào.
    Nếu được cung cấp, các tùy chọn cho màu chủ đề của tài liệu được xác định trong thuộc tính `content` được đề xuất với trình duyệt khi media query khớp.

## Ví dụ

### Đặt giá trị màu

Xem xét đoạn code sau sử dụng `<meta>` để đặt màu chủ đề:

```html
<meta name="theme-color" content="#4285f4" />
```

Hình ảnh sau cho thấy hiệu ứng của cài đặt này trong Chrome trên thiết bị di động Android:

![Hình ảnh cho thấy hiệu ứng của việc sử dụng theme-color](theme-color.png)

_Nguồn ảnh: từ [Icons & Browser Colors](https://web.dev/articles/icons-and-browser-colors), được tạo và chia sẻ bởi Google và được sử dụng theo các điều khoản được mô tả trong [Creative Commons 4.0 Attribution License](https://creativecommons.org/licenses/by/4.0/)._

### Sử dụng media query với `theme-color`

Bạn có thể cung cấp loại phương tiện hoặc truy vấn bên trong thuộc tính [`media`](/en-US/docs/Web/HTML/Reference/Elements/meta#media).
`theme-color` sau đó sẽ chỉ được đặt nếu điều kiện phương tiện là đúng.
Ví dụ:

```html
<meta
  name="theme-color"
  content="cornflowerblue"
  media="(prefers-color-scheme: light)" />
<meta
  name="theme-color"
  content="dimgray"
  media="(prefers-color-scheme: dark)" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giá trị [`color-scheme`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/color-scheme) của thuộc tính `name` trong `<meta>`
- Thuộc tính CSS {{cssxref("color-scheme")}}
- Media query {{cssxref("@media/prefers-color-scheme")}}
