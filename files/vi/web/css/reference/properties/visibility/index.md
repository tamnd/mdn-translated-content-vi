---
title: visibility
slug: Web/CSS/Reference/Properties/visibility
page-type: css-property
browser-compat: css.properties.visibility
sidebar: cssref
---

Thuộc tính **`visibility`** của [CSS](/vi/docs/Web/CSS) hiển thị hoặc ẩn một phần tử mà không thay đổi bố cục của tài liệu. Thuộc tính này cũng có thể ẩn các hàng hoặc cột trong bảng {{HTMLElement("table")}}.

{{InteractiveExample("CSS Demo: visibility")}}

```css interactive-example-choice
visibility: visible;
```

```css interactive-example-choice
visibility: hidden;
```

```css interactive-example-choice
visibility: collapse;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">Hide me</div>
    <div>Item 2</div>
    <div>Item 3</div>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  padding: 0.75em;
  width: 80%;
  max-height: 300px;
  display: flex;
}

.example-container > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 10px;
  flex: 1;
}

#example-element {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
}
```

Để vừa ẩn một phần tử _vừa loại bỏ nó khỏi bố cục tài liệu_, hãy đặt thuộc tính {{cssxref("display")}} thành `none` thay vì dùng `visibility`.

## Cú pháp

```css
/* Giá trị từ khóa */
visibility: visible;
visibility: hidden;
visibility: collapse;

/* Giá trị toàn cục */
visibility: inherit;
visibility: initial;
visibility: revert;
visibility: revert-layer;
visibility: unset;
```

Thuộc tính `visibility` được chỉ định là một trong các giá trị từ khóa liệt kê dưới đây.

### Giá trị

- `visible`
  - : Hộp phần tử hiển thị.
- `hidden`
  - : Hộp phần tử không hiển thị (không được vẽ), nhưng vẫn ảnh hưởng đến bố cục như bình thường. Các phần tử con của phần tử này sẽ hiển thị nếu chúng có `visibility` được đặt thành `visible`. Phần tử không thể nhận tiêu điểm (chẳng hạn khi điều hướng qua [chỉ mục tab](/vi/docs/Web/HTML/Reference/Global_attributes/tabindex)).
- `collapse`
  - : Từ khóa `collapse` có hiệu ứng khác nhau tùy theo phần tử:
    - Đối với các hàng, cột, nhóm cột và nhóm hàng trong bảng {{HTMLElement("table")}}, hàng hoặc cột bị ẩn và không gian chúng chiếm bị xóa (như thể `{{Cssxref("display")}}: none` được áp dụng cho cột/hàng của bảng). Tuy nhiên, kích thước của các hàng và cột khác vẫn được tính như thể các ô trong hàng hoặc cột đã thu gọn vẫn hiện diện. Giá trị này cho phép xóa nhanh hàng hoặc cột khỏi bảng mà không cần tính toán lại chiều rộng và chiều cao cho toàn bộ bảng.
    - Các phần tử flex đã thu gọn và chú thích ruby bị ẩn, không gian chúng chiếm bị xóa.
    - Đối với các phần tử khác, `collapse` được xử lý giống như `hidden`.

## Khả năng tiếp cận

Sử dụng giá trị `hidden` của `visibility` trên một phần tử sẽ xóa nó khỏi [cây tiếp cận](/vi/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis). Điều này khiến phần tử và tất cả phần tử con của nó không còn được công nghệ đọc màn hình thông báo.

## Nội suy

Khi hoạt ảnh, các giá trị visibility được nội suy giữa _visible_ và _not-visible_. Do đó, một trong các giá trị đầu hoặc cuối phải là `visible` nếu không thì không có {{Glossary("interpolation")}} nào xảy ra. Giá trị được nội suy theo bước rời rạc, trong đó các giá trị của hàm easing từ `0` đến `1` ánh xạ tới `visible` và các giá trị khác của hàm easing (chỉ xảy ra ở đầu/cuối quá trình chuyển đổi hoặc do hàm `cubic-bezier()` với giá trị y nằm ngoài \[0, 1]) ánh xạ tới điểm cuối gần nhất.

## Ghi chú

- Hỗ trợ cho `visibility: collapse` bị thiếu hoặc không chính xác một phần trong một số trình duyệt hiện đại. Nó có thể không được xử lý đúng như `visibility: hidden` trên các phần tử ngoài hàng và cột bảng.
- Khi áp dụng cho hàng bảng, nếu bảng chứa các ô (phần tử {{htmlelement("td")}} và {{htmlelement("th")}}) kéo dài cả hàng hiển thị và hàng đã thu gọn, ô có thể hiển thị theo những cách không mong muốn. Nếu ô kéo dài được định nghĩa trong hàng đã thu gọn, trình duyệt sẽ không hiển thị ô đó, như thể các ô trong các hàng tiếp theo có `visibility: collapse` được áp dụng. Khi ô được định nghĩa trong hàng hiển thị và kéo dài qua hàng đã thu gọn, nội dung ô không được phân luồng lại, nhưng cách trình bày của chính ô đó khác nhau tùy trình duyệt. Hầu hết trình duyệt giảm kích thước khối của ô theo kích thước khối của hàng ẩn. Điều này có nghĩa là nội dung có thể lớn hơn ô theo chiều kích thước khối. Tùy trình duyệt, nội dung tràn có thể bị cắt, như thể `overflow: hidden` được đặt, trong khi nội dung chảy vào hàng tiếp theo trong các trình duyệt khác như thể `overflow: visible` được đặt. Trong các trình duyệt khác, ô được hiển thị như thể hàng không bị thu gọn, với tất cả các ô khác trong hàng ẩn như thể `visibility: collapse` được đặt riêng lẻ trên từng ô thay vì hàng.
- `visibility: collapse` có thể thay đổi bố cục của bảng nếu bảng có các bảng lồng nhau bên trong các ô đã thu gọn, trừ khi `visibility: visible` được chỉ định rõ ràng trên các bảng lồng nhau.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p class="visible">Đoạn đầu tiên hiển thị.</p>
<p class="not-visible">Đoạn thứ hai KHÔNG hiển thị.</p>
<p class="visible">
  Đoạn thứ ba hiển thị. Lưu ý rằng đoạn thứ hai vẫn chiếm không gian.
</p>
```

#### CSS

```css
.visible {
  visibility: visible;
}

.not-visible {
  visibility: hidden;
}
```

{{EmbedLiveSample('Basic_example')}}

### Ví dụ bảng

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td>1.1</td>
      <td class="collapse">1.2</td>
      <td>1.3</td>
    </tr>
    <tr class="collapse">
      <td>2.1</td>
      <td>2.2</td>
      <td>2.3</td>
    </tr>
    <tr>
      <td>3.1</td>
      <td>3.2</td>
      <td>3.3</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
.collapse {
  visibility: collapse;
}

table {
  border: 1px solid red;
}

td {
  border: 1px solid gray;
}
```

{{EmbedLiveSample('Table_example')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("display")}}
- Thuộc tính SVG {{SVGAttr("visibility")}}
