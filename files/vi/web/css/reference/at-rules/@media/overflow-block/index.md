---
title: overflow-block
slug: Web/CSS/Reference/At-rules/@media/overflow-block
page-type: css-media-feature
browser-compat: css.at-rules.media.overflow-block
sidebar: cssref
---

Tính năng media **`overflow-block`** trong [CSS](/vi/docs/Web/CSS) có thể được dùng để kiểm tra cách thiết bị đầu ra xử lý nội dung tràn ra ngoài [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) ban đầu theo trục khối.

> [!NOTE]
> Thuộc tính `overflow-block` không xác định xem có tràn hay không; mà nó cho biết cách thiết bị xử lý sự tràn đó. Thông thường, trên màn hình trong hầu hết các trình duyệt, hành vi sẽ là "scroll": khi nội dung vượt quá không gian dọc có sẵn, thiết bị cho phép bạn cuộn để truy cập nội dung bị tràn.

## Cú pháp

Tính năng `overflow-block` được xác định bởi một trong các giá trị từ khóa dưới đây.

- `none`
  - : Nội dung tràn ra trục khối sẽ không được hiển thị.
- `scroll`
  - : Nội dung tràn ra trục khối có thể xem được bằng cách cuộn đến đó.
- `optional-paged`
  - : Nội dung tràn ra trục khối có thể xem được bằng cách cuộn, nhưng ngắt trang có thể được kích hoạt thủ công (chẳng hạn qua {{cssxref("break-inside")}}, v.v.) để làm cho nội dung tiếp theo hiển thị trên trang tiếp theo.
- `paged`
  - : Nội dung được chia thành các trang rời; nội dung tràn một trang theo trục khối sẽ được hiển thị trên trang tiếp theo.

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
@media (overflow-block: scroll) {
  p {
    color: red;
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
