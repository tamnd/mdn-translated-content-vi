---
title: :is()
slug: Web/CSS/Reference/Selectors/:is
page-type: css-pseudo-class
browser-compat: css.selectors.is
sidebar: cssref
---

Hàm [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:is()`** nhận một danh sách bộ chọn làm đối số và chọn bất kỳ phần tử nào có thể được chọn bởi một trong các bộ chọn trong danh sách đó. Điều này hữu ích để viết các bộ chọn lớn theo dạng ngắn gọn hơn.

> [!NOTE]
> Ban đầu có tên là `:matches()` (và `:any()`), bộ chọn này đã được đổi tên thành `:is()` trong [CSSWG issue #3258](https://github.com/w3c/csswg-drafts/issues/3258).

{{InteractiveExample("CSS Demo: :is", "tabbed-shorter")}}

```css interactive-example
ol {
  list-style-type: upper-alpha;
  color: darkblue;
}

:is(ol, ul, menu:unsupported) :is(ol, ul) {
  color: green;
}

:is(ol, ul) :is(ol, ul) ol {
  list-style-type: lower-greek;
  color: chocolate;
}
```

```html interactive-example
<ol>
  <li>Saturn</li>
  <li>
    <ul>
      <li>Mimas</li>
      <li>Enceladus</li>
      <li>
        <ol>
          <li>Voyager</li>
          <li>Cassini</li>
        </ol>
      </li>
      <li>Tethys</li>
    </ul>
  </li>
  <li>Uranus</li>
  <li>
    <ol>
      <li>Titania</li>
      <li>Oberon</li>
    </ol>
  </li>
</ol>
```

## Cú pháp

```css-nolint
:is(<forgiving-selector-list>) {
  /* ... */
}
```

### Tham số

Lớp giả `:is()` yêu cầu một [danh sách bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#selector_list), tức là danh sách phân cách bằng dấu phẩy gồm một hoặc nhiều bộ chọn làm đối số. Danh sách không được chứa [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), nhưng mọi bộ chọn đơn giản, phức hợp và phức tạp khác đều được phép.

### Sự khác biệt giữa :is() và :where()

Sự khác biệt giữa hai lớp giả là `:is()` tính vào độ ưu tiên của toàn bộ bộ chọn (nó lấy độ ưu tiên của đối số cụ thể nhất), trong khi [`:where()`](/en-US/docs/Web/CSS/Reference/Selectors/:where) có giá trị độ ưu tiên là 0. Điều này được minh họa qua [ví dụ trên trang tham chiếu `:where()`](/en-US/docs/Web/CSS/Reference/Selectors/:where#examples).

### Phân tích cú pháp bộ chọn linh hoạt

Đặc tả định nghĩa `:is()` và `:where()` là chấp nhận [danh sách bộ chọn linh hoạt](https://drafts.csswg.org/selectors-4/#typedef-forgiving-selector-list).

Trong CSS, khi dùng danh sách bộ chọn, nếu bất kỳ bộ chọn nào không hợp lệ thì toàn bộ danh sách bị coi là không hợp lệ. Khi dùng `:is()` hoặc `:where()`, thay vì toàn bộ danh sách bị coi là không hợp lệ nếu một bộ chọn không phân tích được, bộ chọn sai hoặc không được hỗ trợ sẽ bị bỏ qua và những bộ chọn còn lại vẫn được sử dụng.

```css
:is(:valid, :unsupported) {
  /* … */
}
```

Vẫn phân tích đúng và khớp với `:valid` ngay cả trên các trình duyệt không hỗ trợ `:unsupported`, trong khi:

```css
:valid,
:unsupported {
  /* … */
}
```

Sẽ bị bỏ qua trên các trình duyệt không hỗ trợ `:unsupported` ngay cả khi chúng hỗ trợ `:valid`.

## Ví dụ

### Đơn giản hóa bộ chọn danh sách

Lớp giả `:is()` có thể đơn giản hóa đáng kể các bộ chọn CSS. Ví dụ, hãy xem đoạn CSS sau:

```css
/* 3-deep (or more) unordered lists use a square */
ol ol ul,
ol ul ul,
ol menu ul,
ol dir ul,
ol ol menu,
ol ul menu,
ol menu menu,
ol dir menu,
ol ol dir,
ol ul dir,
ol menu dir,
ol dir dir,
ul ol ul,
ul ul ul,
ul menu ul,
ul dir ul,
ul ol menu,
ul ul menu,
ul menu menu,
ul dir menu,
ul ol dir,
ul ul dir,
ul menu dir,
ul dir dir,
menu ol ul,
menu ul ul,
menu menu ul,
menu dir ul,
menu ol menu,
menu ul menu,
menu menu menu,
menu dir menu,
menu ol dir,
menu ul dir,
menu menu dir,
menu dir dir,
dir ol ul,
dir ul ul,
dir menu ul,
dir dir ul,
dir ol menu,
dir ul menu,
dir menu menu,
dir dir menu,
dir ol dir,
dir ul dir,
dir menu dir,
dir dir dir {
  list-style-type: square;
}
```

Bạn có thể thay thế bằng:

```css
/* 3-deep (or more) unordered lists use a square */
:is(ol, ul, menu, dir) :is(ol, ul, menu, dir) :is(ul, menu, dir) {
  list-style-type: square;
}
```

### Đơn giản hóa bộ chọn phần

Lớp giả `:is()` đặc biệt hữu ích khi làm việc với các [phần và tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) HTML. Vì {{HTMLElement("section")}}, {{HTMLElement("article")}}, {{HTMLElement("aside")}} và {{HTMLElement("nav")}} thường được lồng nhau, nếu không có `:is()`, việc tạo kiểu phù hợp cho chúng có thể phức tạp.

Ví dụ, không có `:is()`, việc tạo kiểu cho tất cả các phần tử {{HTMLElement("Heading_Elements", "h1")}} ở các độ sâu khác nhau có thể rất phức tạp:

```css
/* Level 0 */
h1 {
  font-size: 30px;
}

/* Level 1 */
section h1,
article h1,
aside h1,
nav h1 {
  font-size: 25px;
}

/* Level 2 */
section section h1,
section article h1,
section aside h1,
section nav h1,
article section h1,
article article h1,
article aside h1,
article nav h1,
aside section h1,
aside article h1,
aside aside h1,
aside nav h1,
nav section h1,
nav article h1,
nav aside h1,
nav nav h1 {
  font-size: 20px;
}

/* Level 3 */
/* don't even think about it! */
```

Sử dụng `:is()` sẽ dễ dàng hơn nhiều:

```css
/* Level 0 */
h1 {
  font-size: 30px;
}
/* Level 1 */
:is(section, article, aside, nav) h1 {
  font-size: 25px;
}
/* Level 2 */
:is(section, article, aside, nav) :is(section, article, aside, nav) h1 {
  font-size: 20px;
}
/* Level 3 */
:is(section, article, aside, nav)
  :is(section, article, aside, nav)
  :is(section, article, aside, nav)
  h1 {
  font-size: 15px;
}
```

### :is() không chọn phần tử giả

Lớp giả `:is()` không khớp với các phần tử giả. Do đó thay vì viết như sau:

```css example-bad
some-element:is(::before, ::after) {
  display: block;
}
```

hoặc:

```css example-bad
:is(some-element::before, some-element::after) {
  display: block;
}
```

hãy viết:

```css example-good
some-element::before,
some-element::after {
  display: block;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":where()")}} - Giống `:is()`, nhưng có [độ ưu tiên](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) bằng 0.
- [Danh sách bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list)
- [Web components](/en-US/docs/Web/API/Web_components)
