---
title: overflow-inline
slug: Web/CSS/Reference/At-rules/@media/overflow-inline
page-type: css-media-feature
browser-compat: css.at-rules.media.overflow-inline
sidebar: cssref
---

Đặc trưng media CSS **`overflow-inline`** có thể được dùng để kiểm tra cách thiết bị đầu ra xử lý nội dung tràn ra ngoài [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) ban đầu theo trục nội tuyến (inline axis).

> [!NOTE]
> Thuộc tính `overflow-inline` không xác định việc tràn có xảy ra hay không; thay vào đó, nó cho biết cách thiết bị xử lý sự tràn đó. Thông thường, trên màn hình trong hầu hết các trình duyệt, hành vi sẽ là "scroll" (cuộn): khi nội dung vượt quá không gian ngang có sẵn, thiết bị cho phép bạn cuộn để truy cập nội dung bị tràn.

## Cú pháp

Đặc trưng `overflow-inline` được chỉ định là một giá trị từ khóa chọn từ danh sách bên dưới.

- `none`
  - : Nội dung tràn ra ngoài trục nội tuyến sẽ không được hiển thị.
- `scroll`
  - : Nội dung tràn ra ngoài trục nội tuyến có thể xem được bằng cách cuộn đến đó.

## Ví dụ

### HTML

```html
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac turpis
  eleifend, fringilla velit ac, aliquam tellus. Vestibulum ante ipsum primis in
  faucibus orci luctus et ultrices posuere cubilia Curae; Nunc velit erat,
  tempus id rutrum sed, dapibus ut urna. Integer vehicula nibh a justo imperdiet
  rutrum. Nam faucibus pretium orci imperdiet sollicitudin. Nunc id facilisis
  dui. Proin elementum et massa et feugiat. Integer rutrum ullamcorper eleifend.
  Proin sit amet tincidunt risus. Sed nec augue congue eros accumsan tincidunt
  sed eget ex.
</p>
```

### CSS

```css
p {
  white-space: nowrap;
}

@media (overflow-inline: scroll) {
  p {
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
