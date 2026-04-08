---
title: overscroll-behavior-inline
slug: Web/CSS/Reference/Properties/overscroll-behavior-inline
page-type: css-property
browser-compat: css.properties.overscroll-behavior-inline
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overscroll-behavior-inline`** xác định hành vi của trình duyệt khi ranh giới theo chiều nội tuyến của vùng cuộn được chạm đến.

Xem {{cssxref("overscroll-behavior")}} để biết giải thích đầy đủ.

## Cú pháp

```css
/* Giá trị từ khóa */
overscroll-behavior-inline: auto; /* default */
overscroll-behavior-inline: contain;
overscroll-behavior-inline: none;

/* Giá trị toàn cục */
overscroll-behavior-inline: inherit;
overscroll-behavior-inline: initial;
overscroll-behavior-inline: revert;
overscroll-behavior-inline: revert-layer;
overscroll-behavior-inline: unset;
```

Thuộc tính `overscroll-behavior-inline` được chỉ định là một từ khóa được chọn từ danh sách giá trị bên dưới.

### Giá trị

- `auto`
  - : Hành vi tràn cuộn mặc định xảy ra như bình thường.
- `contain`
  - : Hành vi tràn cuộn mặc định (ví dụ: hiệu ứng "nảy") được quan sát bên trong phần tử nơi giá trị này được đặt. Tuy nhiên, không có {{Glossary("Scroll_chaining", "chuỗi cuộn")}} nào xảy ra trên các vùng cuộn lân cận; các phần tử bên dưới sẽ không cuộn. Giá trị `contain` vô hiệu hóa điều hướng trình duyệt gốc, bao gồm cử chỉ kéo để làm mới theo chiều dọc và điều hướng vuốt theo chiều ngang.
- `none`
  - : Không có chuỗi cuộn nào xảy ra đến các vùng cuộn lân cận, và hành vi tràn cuộn mặc định bị ngăn chặn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ngăn tràn cuộn theo chiều nội tuyến

Trong bản demo này chúng ta có hai hộp cấp khối, một nằm trong hộp kia. Hộp ngoài có {{cssxref("width")}} lớn được đặt để trang cuộn theo chiều ngang. Hộp trong có chiều rộng nhỏ (và {{cssxref("height")}}) để nó nằm gọn trong viewport, nhưng nội dung của nó có chiều rộng lớn nên nó cũng cuộn theo chiều ngang.

Theo mặc định, khi hộp trong được cuộn và ranh giới cuộn được chạm đến, toàn bộ trang sẽ bắt đầu cuộn, điều này có thể không mong muốn. Để tránh điều này xảy ra theo chiều nội tuyến, chúng ta đặt `overscroll-behavior-inline: contain` trên hộp trong.

#### HTML

```html
<main>
  <div>
    <div>
      <p>
        <code>overscroll-behavior-inline</code> has been used to make it so that
        when the scroll boundaries of the yellow inner box are reached, the
        whole page does not begin to scroll.
      </p>
    </div>
  </div>
</main>
```

#### CSS

```css
main {
  height: 400px;
  width: 3000px;
  background-color: white;
  background-image: repeating-linear-gradient(
    to right,
    transparent 0px,
    transparent 19px,
    rgb(0 0 0 / 50%) 20px
  );
}

main > div {
  height: 300px;
  width: 400px;
  overflow: auto;
  position: relative;
  top: 50px;
  left: 50px;
  overscroll-behavior-inline: contain;
}

div > div {
  height: 100%;
  width: 1500px;
  background-color: yellow;
  background-image: repeating-linear-gradient(
    to right,
    transparent 0px,
    transparent 19px,
    rgb(0 0 0 / 50%) 20px
  );
}

p {
  padding: 10px;
  background-color: rgb(255 0 0 / 50%);
  margin: 0;
  width: 360px;
  position: relative;
  top: 10px;
  left: 10px;
}
```

#### Kết quả

{{EmbedLiveSample('Preventing_inline_overscrolling','100%', 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overscroll-behavior")}}
- {{cssxref("overscroll-behavior-x")}}
- {{cssxref("overscroll-behavior-y")}}
- {{cssxref("overscroll-behavior-block")}}
- Mô-đun [CSS overscroll behavior](/vi/docs/Web/CSS/Guides/Overscroll_behavior)
