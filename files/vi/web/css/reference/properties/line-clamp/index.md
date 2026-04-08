---
title: line-clamp
slug: Web/CSS/Reference/Properties/line-clamp
page-type: css-property
browser-compat: css.properties.line-clamp
sidebar: cssref
---

Thuộc tính **`line-clamp`** trong [CSS](/vi/docs/Web/CSS) cho phép giới hạn nội dung của một {{Glossary("block")}} theo số dòng được chỉ định.

> [!NOTE]
> Để hỗ trợ kế thừa, thuộc tính có tiền tố nhà sản xuất `-webkit-line-clamp` chỉ hoạt động kết hợp với thuộc tính {{cssxref("display")}} được đặt thành `-webkit-box` hoặc `-webkit-inline-box` và thuộc tính {{cssxref("box-orient", "-webkit-box-orient")}} được đặt thành `vertical`. Mặc dù các thuộc tính có tiền tố này đã bị ngừng sử dụng, sự phụ thuộc lẫn nhau của ba thuộc tính này là một hành vi được chỉ định đầy đủ và sẽ tiếp tục được hỗ trợ.

Trong hầu hết các trường hợp, bạn cũng sẽ muốn đặt {{cssxref("overflow")}} thành `hidden`, nếu không nội dung sẽ không bị cắt nhưng dấu ba chấm vẫn được hiển thị sau số dòng được chỉ định.

Khi áp dụng cho các phần tử neo, việc cắt bớt có thể xảy ra ở giữa văn bản, không nhất thiết phải ở cuối.

## Cú pháp

```css
/* Giá trị từ khóa */
line-clamp: none;

/* Giá trị <integer> */
line-clamp: 3;
line-clamp: 10;

/* Giá trị toàn cục */
line-clamp: inherit;
line-clamp: initial;
line-clamp: revert;
line-clamp: revert-layer;
line-clamp: unset;
```

### Giá trị

- `none`
  - : Giá trị này chỉ định rằng nội dung sẽ không bị kẹp.
- {{cssxref("integer")}}
  - : Giá trị này chỉ định số dòng sau đó nội dung sẽ bị kẹp. Phải lớn hơn 0.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Cắt bớt đoạn văn

#### HTML

```html
<p>
  In this example the <code>-webkit-line-clamp</code> property is set to
  <code>3</code>, which means the text is clamped after three lines. An ellipsis
  will be shown at the point where the text is clamped.
</p>
```

#### CSS

```css
p {
  width: 300px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
```

#### Kết quả

{{EmbedLiveSample("Truncating_a_paragraph", "100%", "130")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Line Clampin' (Truncating Multiple Line Text)](https://css-tricks.com/line-clampin/)
