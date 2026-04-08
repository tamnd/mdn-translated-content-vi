---
title: overscroll-behavior-block
slug: Web/CSS/Reference/Properties/overscroll-behavior-block
page-type: css-property
browser-compat: css.properties.overscroll-behavior-block
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overscroll-behavior-block`** xác định hành vi của trình duyệt khi ranh giới theo chiều khối của vùng cuộn được chạm đến.

Xem {{cssxref("overscroll-behavior")}} để biết giải thích đầy đủ.

## Cú pháp

```css
/* Giá trị từ khóa */
overscroll-behavior-block: auto; /* default */
overscroll-behavior-block: contain;
overscroll-behavior-block: none;

/* Giá trị toàn cục */
overscroll-behavior-block: inherit;
overscroll-behavior-block: initial;
overscroll-behavior-block: revert;
overscroll-behavior-block: revert-layer;
overscroll-behavior-block: unset;
```

Thuộc tính `overscroll-behavior-block` được chỉ định là một từ khóa được chọn từ danh sách giá trị bên dưới.

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

### Ngăn tràn cuộn theo chiều khối

Trong bản demo này chúng ta có hai hộp cấp khối, một nằm trong hộp kia. Hộp ngoài có {{cssxref("height")}} lớn được đặt để trang cuộn theo chiều dọc. Hộp trong có {{cssxref("width")}} (và `height`) nhỏ để nó nằm gọn trong viewport, nhưng nội dung của nó có `height` lớn nên nó cũng cuộn theo chiều dọc.

Theo mặc định, khi hộp trong được cuộn và ranh giới cuộn được chạm đến, toàn bộ trang sẽ bắt đầu cuộn, điều này có thể không mong muốn. Để tránh điều này xảy ra theo chiều khối, chúng ta đặt `overscroll-behavior-block: contain` trên hộp trong.

#### HTML

```html
<main>
  <div>
    <div>
      <p>
        <code>overscroll-behavior-block</code> has been used to make it so that
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
  height: 3000px;
  width: 500px;
  background-color: white;
  background-image: repeating-linear-gradient(
    to bottom,
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
  overscroll-behavior-block: contain;
}

div > div {
  height: 1500px;
  width: 100%;
  background-color: yellow;
  background-image: repeating-linear-gradient(
    to bottom,
    transparent 0px,
    transparent 19px,
    rgb(0 0 0 / 50%) 20px
  );
}

p {
  padding: 10px;
  background-color: rgb(255 0 0 / 50%);
  margin: 0;
  width: 340px;
  position: relative;
  top: 10px;
  left: 10px;
}
```

#### Kết quả

{{EmbedLiveSample('Preventing_block_overscrolling','100%', 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overscroll-behavior")}}
- {{cssxref("overscroll-behavior-x")}}
- {{cssxref("overscroll-behavior-y")}}
- {{cssxref("overscroll-behavior-inline")}}
- Mô-đun [CSS overscroll behavior](/vi/docs/Web/CSS/Guides/Overscroll_behavior)
