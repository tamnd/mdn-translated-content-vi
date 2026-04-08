---
title: prefers-contrast
slug: Web/CSS/Reference/At-rules/@media/prefers-contrast
page-type: css-media-feature
browser-compat: css.at-rules.media.prefers-contrast
sidebar: cssref
---

Đặc trưng media CSS **`prefers-contrast`** được dùng để phát hiện xem người dùng có yêu cầu nội dung web được trình bày với độ tương phản thấp hơn hay cao hơn hay không.

## Cú pháp

- `no-preference`
  - : Cho biết người dùng chưa bày tỏ sở thích với hệ thống. Giá trị từ khóa này được đánh giá là false trong ngữ cảnh Boolean.
- `more`
  - : Cho biết người dùng đã thông báo cho hệ thống rằng họ thích giao diện có mức độ tương phản cao hơn.
- `less`
  - : Cho biết người dùng đã thông báo cho hệ thống rằng họ thích giao diện có mức độ tương phản thấp hơn.
- `custom`
  - : Cho biết người dùng đã thông báo cho hệ thống sử dụng một bộ màu cụ thể, và độ tương phản được ngụ ý bởi các màu này không khớp với `more` hay `less`. Giá trị này sẽ khớp với bảng màu được chỉ định bởi người dùng của [`forced-colors: active`](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors).

## Tùy chọn người dùng

Nhiều hệ điều hành hỗ trợ các tùy chọn như vậy và các tác nhân người dùng có thể dựa vào cài đặt được cung cấp bởi hệ điều hành.

## Ví dụ

Ví dụ này bao gồm một hộp có {{cssxref("outline")}} kiểu nét đứt được đặt theo mặc định. Khi media query `prefers-contrast: more` khớp, đường viền được áp dụng sẽ có kiểu `solid` với độ tương phản cao hơn.

### HTML

```html
<div class="contrast">low contrast box</div>
```

### CSS

```css
.contrast {
  margin: 5px;
  width: 100px;
  height: 100px;
  outline: 2px dashed black;
}

@media (prefers-contrast: more) {
  .contrast {
    outline: 2px solid black;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Media query CSS [forced-colors](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors)
