---
title: column-width
slug: Web/CSS/Reference/Properties/column-width
page-type: css-property
browser-compat: css.properties.column-width
sidebar: cssref
---

Thuộc tính **`column-width`** [CSS](/en-US/docs/Web/CSS) đặt chiều rộng cột lý tưởng trong bố cục nhiều cột. Container sẽ có nhiều cột nhất có thể mà không có cột nào có chiều rộng nhỏ hơn giá trị `column-width`. Nếu chiều rộng của container nhỏ hơn giá trị được chỉ định, chiều rộng của cột duy nhất sẽ nhỏ hơn chiều rộng cột đã khai báo.

Thuộc tính này có thể giúp bạn tạo thiết kế responsive phù hợp với nhiều kích thước màn hình. Đặc biệt khi có thuộc tính {{cssxref("column-count")}} (có ưu tiên cao hơn), bạn phải chỉ định tất cả các giá trị độ dài liên quan để đạt được chiều rộng cột chính xác. Trong văn bản ngang, đây là {{cssxref('width')}}, `column-width`, {{cssxref('column-gap')}}, và {{cssxref('column-rule-width')}}.

Thuộc tính viết tắt {{cssxref("columns")}} có thể được sử dụng để đặt các giá trị thuộc tính `column-width`, {{cssxref("column-count")}} và {{cssxref("column-height")}} trong một khai báo duy nhất.

{{InteractiveExample("CSS Demo: column-width")}}

```css interactive-example-choice
column-width: auto;
```

```css interactive-example-choice
column-width: 6rem;
```

```css interactive-example-choice
column-width: 120px;
```

```css interactive-example-choice
column-width: 18ch;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
#example-element {
  width: 100%;
  columns: auto;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
column-width: auto;

/* Giá trị <length> */
column-width: 60px;
column-width: 15.5em;
column-width: 3.3vw;

/* Giá trị toàn cục */
column-width: inherit;
column-width: initial;
column-width: revert;
column-width: revert-layer;
column-width: unset;
```

Thuộc tính `column-width` được chỉ định là một trong các giá trị liệt kê bên dưới.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Chỉ ra chiều rộng cột tối ưu. Chiều rộng cột thực tế có thể khác với giá trị được chỉ định: nó có thể rộng hơn khi cần thiết để lấp đầy không gian có sẵn, và hẹp hơn khi không gian có sẵn quá nhỏ. Giá trị phải hoàn toàn dương hoặc khai báo không hợp lệ. Giá trị phần trăm cũng không hợp lệ.
- `auto`
  - : Chiều rộng của cột được xác định bởi các thuộc tính CSS khác, chẳng hạn như {{cssxref("column-count")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt chiều rộng cột theo pixel

#### HTML

```html
<p class="content-box">
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
  nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi
  enim ad minim veniam, quis nostrud exercitation ullamcorper suscipit lobortis
  nisl ut aliquip ex ea commodo consequat.
</p>
```

#### CSS

```css
.content-box {
  column-width: 100px;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_column_width_in_pixels', 'auto', 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("column-count")}}
- {{cssxref("column-height")}}
- Thuộc tính viết tắt {{cssxref("columns")}}
- [Học: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- [Khái niệm cơ bản về Multicol](/en-US/docs/Web/CSS/Guides/Multicol_layout/Basic_concepts)
