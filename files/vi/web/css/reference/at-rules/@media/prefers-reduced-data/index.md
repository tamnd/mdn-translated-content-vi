---
title: prefers-reduced-data
slug: Web/CSS/Reference/At-rules/@media/prefers-reduced-data
page-type: css-media-feature
status:
  - experimental
browser-compat: css.at-rules.media.prefers-reduced-data
sidebar: cssref
---

{{SeeCompatTable}}

> [!NOTE]
> Tính năng này không được hỗ trợ bởi bất kỳ tác nhân người dùng nào và các thông số kỹ thuật của nó có thể thay đổi.

Đặc trưng media CSS **`prefers-reduced-data`** được dùng để phát hiện xem người dùng có yêu cầu nội dung web tiêu thụ ít lưu lượng internet hơn hay không.

## Cú pháp

- `no-preference`
  - : Cho biết người dùng chưa bày tỏ sở thích với hệ thống. Giá trị từ khóa này được đánh giá là false trong ngữ cảnh boolean.
- `reduce`
  - : Cho biết người dùng đã bày tỏ sở thích muốn sử dụng nội dung thay thế nhẹ hơn.

## Tùy chọn người dùng

Hiện tại không có tác nhân người dùng nào triển khai tính năng này, mặc dù nhiều hệ điều hành có hỗ trợ các tùy chọn như vậy và nếu media query này được triển khai thì các tác nhân người dùng có thể sẽ dựa vào cài đặt được cung cấp bởi hệ điều hành.

## Ví dụ

> [!NOTE]
> Hiện tại không có trình duyệt nào triển khai tính năng này nên ví dụ sau đây sẽ không hoạt động.

Trong ví dụ này, tệp phông chữ `montserrat-regular.woff2` sẽ không được tải trước hay tải xuống nếu người dùng thích giảm dữ liệu, trong trường hợp này "[bộ phông hệ thống](https://css-tricks.com/snippets/css/system-font-stack/)" sẽ là phông dự phòng:

### HTML

```html
<head>
  <link
    rel="preload"
    href="fonts/montserrat-regular.woff2"
    as="font"
    media="(prefers-reduced-data: no-preference)"
    crossorigin />
  <link rel="stylesheet" href="style.css" />
</head>
```

### CSS

```css
@media (prefers-reduced-data: no-preference) {
  @font-face {
    font-family: "Montserrat";
    font-style: normal;
    font-weight: normal;
    font-display: swap;
    /* latin */
    src:
      local("Montserrat Regular"),
      local("Montserrat-Regular"),
      url("fonts/montserrat-regular.woff2") format("woff2");
    unicode-range:
      U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC,
      U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215,
      U+FEFF, U+FFFD;
  }
}

body {
  font-family:
    "Montserrat",
    -apple-system,
    BlinkMacSystemFont,
    "Segoe UI",
    "Roboto",
    "Helvetica",
    "Arial",
    sans-serif;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- HTTP header {{HTTPHeader("Save-Data")}}
