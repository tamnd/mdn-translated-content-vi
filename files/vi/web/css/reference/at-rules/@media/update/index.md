---
title: update
slug: Web/CSS/Reference/At-rules/@media/update
page-type: css-media-feature
browser-compat: css.at-rules.media.update
sidebar: cssref
---

Đặc trưng media CSS **`update`** có thể được dùng để kiểm tra tần suất (nếu có) mà thiết bị đầu ra có khả năng thay đổi giao diện của nội dung sau khi đã kết xuất.

## Cú pháp

- `none`
  - : Sau khi đã kết xuất, bố cục không thể được cập nhật thêm. Ví dụ: tài liệu được in ra giấy.
- `slow`
  - : Bố cục có thể thay đổi động theo các quy tắc thông thường của CSS, nhưng thiết bị đầu ra không thể kết xuất hoặc hiển thị các thay đổi đủ nhanh để chúng được cảm nhận như hoạt ảnh mượt mà. Ví dụ: máy đọc sách điện tử hoặc các thiết bị có hiệu suất rất thấp.
- `fast`
  - : Bố cục có thể thay đổi động theo các quy tắc thông thường của CSS, và thiết bị đầu ra không bị giới hạn bất thường về tốc độ, vì vậy có thể sử dụng các hiệu ứng cập nhật thường xuyên như [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations). Ví dụ: màn hình máy tính.

## Ví dụ

### HTML

```html
<p>
  If this text animates for you, your browser supports `update` and you are
  using a fast-updating device.
</p>
```

### CSS

```css
@keyframes jiggle {
  from {
    transform: translateY(0);
  }

  to {
    transform: translateY(25px);
  }
}

@media (update: fast) {
  p {
    animation: 1s jiggle linear alternate infinite;
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

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
