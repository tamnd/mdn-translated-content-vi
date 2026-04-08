---
title: scripting
slug: Web/CSS/Reference/At-rules/@media/scripting
page-type: css-media-feature
browser-compat: css.at-rules.media.scripting
sidebar: cssref
---

Đặc trưng media CSS **`scripting`** có thể được dùng để kiểm tra xem tính năng scripting (chẳng hạn như JavaScript) có khả dụng hay không.

> [!NOTE]
> Việc phát hiện được thực hiện bởi trình duyệt dựa trên cài đặt của người dùng. Một số tiện ích mở rộng trình duyệt có thể triển khai chặn script bằng các kỹ thuật khác nhau. Trong những trường hợp như vậy, đặc trưng media `scripting` có thể không hoạt động như mong đợi.

## Cú pháp

Đặc trưng `scripting` được chỉ định là một giá trị từ khóa chọn từ danh sách bên dưới.

- `none`
  - : Scripting hoàn toàn không khả dụng trên tài liệu hiện tại.
- `initial-only`
  - : Scripting được bật trong lần tải trang ban đầu, nhưng không phải sau đó.
- `enabled`
  - : Scripting được hỗ trợ và đang hoạt động trên tài liệu hiện tại.

## Ví dụ

### HTML

```html
<p class="script-none">You do not have scripting available. :-(</p>
<p class="script-initial-only">
  Your scripting is only enabled during the initial page load. Weird.
</p>
<p class="script-enabled">You have scripting enabled! :-)</p>
```

### CSS

```css
p {
  color: lightgray;
}

@media (scripting: none) {
  .script-none {
    color: red;
  }
}

@media (scripting: initial-only) {
  .script-initial-only {
    color: red;
  }
}

@media (scripting: enabled) {
  .script-enabled {
    color: red;
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

- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
- [Sử dụng media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
