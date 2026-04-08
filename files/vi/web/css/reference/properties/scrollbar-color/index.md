---
title: scrollbar-color
slug: Web/CSS/Reference/Properties/scrollbar-color
page-type: css-property
browser-compat: css.properties.scrollbar-color
sidebar: cssref
---

Thuộc tính **`scrollbar-color`** [CSS](/en-US/docs/Web/CSS) đặt màu của track và thumb của thanh cuộn.

**Track** là phần nền của thanh cuộn, thường cố định bất kể vị trí cuộn.

**Thumb** là phần di chuyển của thanh cuộn, thường nổi trên track.

Khi giá trị `scrollbar-color` được đặt trên phần tử gốc của tài liệu, các giá trị sẽ được áp dụng cho thanh cuộn của viewport.

## Cú pháp

```css
/* Giá trị từ khóa */
scrollbar-color: auto;

/* Giá trị <color> */
scrollbar-color: rebeccapurple green; /* Hai màu hợp lệ.
Màu đầu tiên áp dụng cho thumb của thanh cuộn, màu thứ hai cho track. */

/* Giá trị toàn cục */
scrollbar-color: inherit;
scrollbar-color: initial;
scrollbar-color: revert;
scrollbar-color: revert-layer;
scrollbar-color: unset;
```

### Giá trị

- `<scrollbar-color>`
  - : Định nghĩa màu của thanh cuộn.

    <table class="standard-table">
      <tbody>
        <tr>
          <td><code>auto</code></td>
          <td>
            Hiển thị nền tảng mặc định cho phần track của thanh cuộn, khi không có
            thuộc tính màu thanh cuộn nào khác liên quan.
          </td>
        </tr>
        <tr>
          <td><code>&#x3C;color> &#x3C;color></code></td>
          <td>
            Áp dụng màu đầu tiên cho thumb của thanh cuộn, màu thứ hai cho
            track của thanh cuộn.
          </td>
        </tr>
      </tbody>
    </table>

> [!NOTE]
> [`@media (forced-colors: active)`](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors) đặt `scrollbar-color` thành `auto`.

## Khả năng tiếp cận

Khi sử dụng thuộc tính `scrollbar-color` với các giá trị màu cụ thể, tác giả nên đảm bảo các màu được chỉ định có đủ độ tương phản giữa chúng. Đối với các giá trị từ khóa, UA nên đảm bảo các màu họ sử dụng có đủ độ tương phản. Xem [Techniques for WCAG 2.0: G183: Using a contrast ratio of 3:1](https://www.w3.org/TR/WCAG20-TECHS/G183.html).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Tô màu thanh cuộn tràn

#### CSS

```css
.scroller {
  width: 300px;
  height: 100px;
  overflow-y: scroll;
  scrollbar-color: #000077 #bada55;
}
```

#### HTML

```html
<div class="scroller">
  Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
  daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
  corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts
  fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber
  earthnut pea peanut soko zucchini.
</div>
```

#### Kết quả

{{EmbedLiveSample("Coloring_overflow_scrollbars")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scrollbars styling](/en-US/docs/Web/CSS/Guides/Scrollbars_styling)
- {{CSSxRef("overflow")}}
- {{CSSxRef("scrollbar-gutter")}}
- {{CSSxRef("scrollbar-width")}}
