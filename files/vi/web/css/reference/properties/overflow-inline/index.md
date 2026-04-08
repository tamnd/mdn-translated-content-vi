---
title: overflow-inline
slug: Web/CSS/Reference/Properties/overflow-inline
page-type: css-property
browser-compat: css.properties.overflow-inline
sidebar: cssref
---

Thuộc tính CSS **`overflow-inline`** thiết lập nội dung hiển thị khi nội dung tràn qua các cạnh đầu và cuối theo chiều ngang (inline) của một hộp. Đây có thể là không hiển thị, một thanh cuộn, hoặc nội dung tràn.

> [!NOTE]
> Thuộc tính `overflow-inline` ánh xạ tới {{Cssxref("overflow-y")}} hoặc {{Cssxref("overflow-x")}} tùy thuộc vào chế độ viết của tài liệu.

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-inline: visible;
overflow-inline: hidden;
overflow-inline: clip;
overflow-inline: scroll;
overflow-inline: auto;

/* Giá trị toàn cục */
overflow-inline: inherit;
overflow-inline: initial;
overflow-inline: revert;
overflow-inline: revert-layer;
overflow-inline: unset;
```

Thuộc tính `overflow-inline` được chỉ định bằng một giá trị từ khóa {{CSSXref("overflow_value", "&lt;overflow&gt;")}} duy nhất.

### Giá trị

- `visible`
  - : Nội dung không bị cắt xén và có thể được hiển thị ra ngoài các cạnh đầu và cuối theo chiều ngang của hộp đệm.
- `hidden`
  - : Nội dung bị cắt xén nếu cần để vừa với kích thước chiều ngang trong hộp đệm. Không có thanh cuộn nào được cung cấp.
- `clip`
  - : Nội dung tràn bị cắt tại cạnh cắt tràn của phần tử, được xác định bằng thuộc tính {{CSSXref("overflow-clip-margin")}}.
- `scroll`
  - : Nội dung bị cắt xén nếu cần để vừa trong hộp đệm theo chiều ngang. Trình duyệt hiển thị thanh cuộn dù có hay không có nội dung bị cắt xén thực sự. (Điều này ngăn thanh cuộn xuất hiện hoặc biến mất khi nội dung thay đổi.) Máy in vẫn có thể in nội dung tràn.
- `auto`
  - : Phụ thuộc vào tác nhân người dùng. Nếu nội dung vừa trong hộp đệm, nó trông giống `visible`, nhưng vẫn thiết lập một ngữ cảnh định dạng khối mới. Trình duyệt máy tính để bàn cung cấp thanh cuộn nếu nội dung bị tràn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập hành vi tràn theo chiều ngang

#### HTML

```html
<ul>
  <li>
    <code>overflow-inline: hidden</code> (ẩn văn bản ngoài hộp)
    <div id="div1">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-inline: scroll</code> (luôn thêm thanh cuộn)
    <div id="div2">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-inline: visible</code> (hiển thị văn bản ngoài hộp nếu cần)
    <div id="div3">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-inline: auto</code> (tương đương với <code>scroll</code>
    trong hầu hết các trình duyệt)
    <div id="div4">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>

  <li>
    <code>overflow-inline: clip</code> (ẩn văn bản ngoài hộp vượt qua cạnh cắt
    tràn)
    <code>clip</code>
    <div id="div5">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
</ul>
```

#### CSS

```css
div {
  border: 1px solid black;
  width: 250px;
  margin-bottom: 12px;
}

#div1 {
  overflow-inline: hidden;
}
#div2 {
  overflow-inline: scroll;
}
#div3 {
  overflow-inline: visible;
}
#div4 {
  overflow-inline: auto;
}
#div5 {
  overflow-inline: clip;
  overflow-clip-margin: 2em;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_inline_overflow_behavior", "100%", "270")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("clip")}}, {{cssxref("display")}}, {{cssxref("overflow")}}, {{cssxref("overflow-block")}}, {{cssxref("overflow-clip-margin")}}, {{cssxref("overflow-x")}}, {{cssxref("overflow-y")}}, {{cssxref("text-overflow")}}, {{cssxref("white-space")}}
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [CSS logical properties](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
- [Learn: Overflowing content](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)
