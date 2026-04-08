---
title: prefers-reduced-transparency
slug: Web/CSS/Reference/At-rules/@media/prefers-reduced-transparency
page-type: css-media-feature
status:
  - experimental
browser-compat: css.at-rules.media.prefers-reduced-transparency
sidebar: cssref
---

{{SeeCompatTable}}

Đặc trưng media CSS **`prefers-reduced-transparency`** được dùng để phát hiện xem người dùng có bật cài đặt trên thiết bị của họ để giảm các hiệu ứng lớp trong suốt hoặc bán trong suốt hay không. Bật cài đặt như vậy có thể giúp cải thiện độ tương phản và khả năng đọc cho một số người dùng.

## Cú pháp

- `no-preference`
  - : Cho biết người dùng chưa bày tỏ sở thích trên thiết bị. Giá trị từ khóa này được đánh giá là false trong ngữ cảnh boolean.
- `reduce`
  - : Cho biết người dùng đã bật cài đặt trên thiết bị của họ để giảm thiểu lượng hiệu ứng lớp trong suốt hoặc bán trong suốt.

## Tùy chọn người dùng

Nhiều hệ điều hành cung cấp tùy chọn giảm độ trong suốt và các tác nhân người dùng có thể dựa vào các cài đặt hệ thống này.
Chúng cũng có thể dựa vào các tín hiệu ít rõ ràng hơn trên các nền tảng không cung cấp cài đặt cụ thể.

- Trong Windows 10/11: Cài đặt > Cá nhân hóa > Màu sắc > Hiệu ứng trong suốt.
- Trong macOS: Cài đặt hệ thống > Trợ năng > Hiển thị > Giảm độ trong suốt.
- Trong iOS: Cài đặt > Trợ năng > Hiển thị & Cỡ chữ > Giảm độ trong suốt.

## Ví dụ

Ví dụ này có một hộp bán trong suốt theo mặc định. Nếu cài đặt giảm độ trong suốt được bật trong tùy chọn trợ năng trên thiết bị của bạn, hộp bán trong suốt sẽ trở nên đục hơn.

### HTML

```html
<div class="translucent">translucent box</div>
```

### CSS

```css
.translucent {
  opacity: 0.4;
}

@media (prefers-reduced-transparency) {
  .translucent {
    opacity: 0.8;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Media query CSS [prefers-reduced-motion](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion)
- [Sử dụng media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
