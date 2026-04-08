---
title: writing-mode
slug: Web/CSS/Reference/Properties/writing-mode
page-type: css-property
browser-compat: css.properties.writing-mode
sidebar: cssref
---

Thuộc tính **`writing-mode`** của [CSS](/vi/docs/Web/CSS) xác định xem các dòng văn bản được trình bày theo chiều ngang hay chiều dọc, cũng như chiều hướng mà các khối tiến triển. Khi được đặt cho toàn bộ tài liệu, nó nên được đặt trên phần tử gốc (phần tử `html` cho các tài liệu HTML).

{{InteractiveExample("CSS Demo: writing-mode")}}

```css interactive-example-choice
writing-mode: horizontal-tb;
```

```css interactive-example-choice
writing-mode: vertical-lr;
```

```css interactive-example-choice
writing-mode: vertical-rl;
```

```css interactive-example-choice
writing-mode: sideways-rl;
```

```css interactive-example-choice
writing-mode: sideways-lr;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  padding: 0.75em;
  width: 80%;
  max-height: 300px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 10px;
}
```

Thuộc tính này xác định _chiều hướng luồng khối_, là chiều hướng mà các vùng chứa cấp khối được xếp chồng lên nhau, và chiều hướng mà nội dung cấp nội tuyến chảy trong một vùng chứa khối. Do đó, nó cũng xác định thứ tự của nội dung cấp khối.

## Cú pháp

```css
/* Giá trị từ khóa */
writing-mode: horizontal-tb;
writing-mode: vertical-rl;
writing-mode: vertical-lr;
writing-mode: sideways-rl;
writing-mode: sideways-lr;

/* Giá trị toàn cục */
writing-mode: inherit;
writing-mode: initial;
writing-mode: revert;
writing-mode: revert-layer;
writing-mode: unset;
```

Thuộc tính `writing-mode` được chỉ định là một trong các giá trị được liệt kê dưới đây. Chiều hướng luồng trong các chữ viết ngang cũng bị ảnh hưởng bởi [hướng của chữ viết đó](https://www.w3.org/International/questions/qa-scripts.en), từ trái sang phải (`ltr`, như tiếng Anh và hầu hết các ngôn ngữ khác) hoặc từ phải sang trái (`rtl`, như tiếng Do Thái hoặc tiếng Ả Rập).

### Giá trị

- `horizontal-tb`
  - : Đối với chữ viết `ltr`, nội dung chảy theo chiều ngang từ trái sang phải. Đối với chữ viết `rtl`, nội dung chảy theo chiều ngang từ phải sang trái. Dòng ngang tiếp theo được đặt bên dưới dòng trước đó.
- `vertical-rl`
  - : Đối với chữ viết `ltr`, nội dung chảy theo chiều dọc từ trên xuống dưới, và dòng dọc tiếp theo được đặt ở bên trái dòng trước đó. Đối với chữ viết `rtl`, nội dung chảy theo chiều dọc từ dưới lên trên, và dòng dọc tiếp theo được đặt ở bên trái dòng trước đó.
- `vertical-lr`
  - : Đối với chữ viết `ltr`, nội dung chảy theo chiều dọc từ trên xuống dưới, và dòng dọc tiếp theo được đặt ở bên phải dòng trước đó. Đối với chữ viết `rtl`, nội dung chảy theo chiều dọc từ dưới lên trên, và dòng dọc tiếp theo được đặt ở bên phải dòng trước đó.
- `sideways-rl`
  - : Đối với chữ viết `ltr`, nội dung chảy theo chiều dọc từ trên xuống dưới. Đối với chữ viết `rtl`, nội dung chảy theo chiều dọc từ dưới lên trên. Tất cả các ký tự, kể cả những ký tự trong chữ viết dọc, đều được xoay nghiêng về phía bên phải.
- `sideways-lr`
  - : Đối với chữ viết `ltr`, nội dung chảy theo chiều dọc từ dưới lên trên. Đối với chữ viết `rtl`, nội dung chảy theo chiều dọc từ trên xuống dưới. Tất cả các ký tự, kể cả những ký tự trong chữ viết dọc, đều được xoay nghiêng về phía bên trái.
- `lr`
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `horizontal-tb` thay thế.
- `lr-tb`
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `horizontal-tb` thay thế.
- `rl`
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `horizontal-tb` thay thế.
- `tb`
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `vertical-lr` thay thế.
- `tb-lr` {{Deprecated_Inline}}
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `vertical-lr` thay thế.
- `tb-rl`
  - : Không dùng nữa ngoại trừ các tài liệu SVG1. Đối với CSS, hãy sử dụng `vertical-rl` thay thế.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng nhiều chế độ viết

Ví dụ này minh họa tất cả các chế độ viết, hiển thị từng chế độ với văn bản bằng nhiều ngôn ngữ khác nhau.

#### HTML

HTML là một {{HTMLElement("table")}} với mỗi chế độ viết trong một hàng và một cột hiển thị văn bản bằng các chữ viết khác nhau theo chế độ viết đó.

```html
<table>
  <caption>
    Using multiple writing modes
  </caption>
  <thead>
    <tr>
      <th>Value</th>
      <th>Vertical script</th>
      <th>Horizontal (LTR) script</th>
      <th>Horizontal (RTL) script</th>
      <th>Mixed script</th>
    </tr>
  </thead>
  <tbody>
    <tr class="text1">
      <th>horizontal-tb</th>
      <td>我家没有电脑。</td>
      <td>Example text</td>
      <td>מלל ארוך לדוגמא</td>
      <td>1994年に至っては</td>
    </tr>
    <tr class="text2">
      <th>vertical-lr</th>
      <td>我家没有电脑。</td>
      <td>Example text</td>
      <td>מלל ארוך לדוגמא</td>
      <td>1994年に至っては</td>
    </tr>
    <tr class="text3">
      <th>vertical-rl</th>
      <td>我家没有电脑。</td>
      <td>Example text</td>
      <td>מלל ארוך לדוגמא</td>
      <td>1994年に至っては</td>
    </tr>
    <tr class="experimental text4">
      <th>sideways-lr</th>
      <td>我家没有电脑。</td>
      <td>Example text</td>
      <td>מלל ארוך לדוגמא</td>
      <td>1994年に至っては</td>
    </tr>
    <tr class="experimental text5">
      <th>sideways-rl</th>
      <td>我家没有电脑。</td>
      <td>Example text</td>
      <td>מלל ארוך לדוגמא</td>
      <td>1994年に至っては</td>
    </tr>
  </tbody>
</table>
<p class="notice">
  Your browser does not support the <code>sideways-lr</code> or
  <code>sideways-rl</code> values.
</p>
```

#### CSS

```css hidden
table {
  border-collapse: collapse;
}
td,
th {
  border: 2px black solid;
  padding: 4px;
}
th {
  background-color: lightgray;
}

.experimental {
  display: none;
}

.notice {
  display: table-row;
  font-weight: bold;
  text-align: center;
}

@supports (writing-mode: sideways-lr) {
  .experimental {
    display: table-row;
  }
  .notice {
    display: none;
  }
}
```

CSS điều chỉnh hướng của nội dung trông như sau:

```css
.text1 td {
  writing-mode: horizontal-tb;
}

.text2 td {
  writing-mode: vertical-lr;
}

.text3 td {
  writing-mode: vertical-rl;
}

.text4 td {
  writing-mode: sideways-lr;
}

.text5 td {
  writing-mode: sideways-rl;
}
```

#### Kết quả

{{EmbedLiveSample("Using_multiple_writing_modes", 400, 700)}}

### Sử dụng writing-mode với transform

Nếu trình duyệt của bạn không hỗ trợ `sideways-lr`, một cách giải quyết thay thế là sử dụng {{cssxref("transform")}} để đạt được hiệu ứng tương tự tùy thuộc vào hướng chữ viết. Hiệu ứng của `vertical-rl` giống với `sideways-lr`, vì vậy không cần biến đổi cho các chữ viết từ trái sang phải. Trong một số trường hợp, xoay văn bản 180 độ là đủ để đạt được hiệu ứng của `sideways-lr`, nhưng các ký tự phông chữ có thể không được thiết kế để xoay, vì vậy điều này có thể tạo ra vị trí hoặc kết xuất không mong muốn.

#### HTML

```html
<table>
  <caption>
    Using writing-mode with transforms
  </caption>
  <thead>
    <tr>
      <th>Vertical LR</th>
      <th>Vertical LR with transform</th>
      <th>Sideways LR</th>
      <th>Only rotate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <span class="vertical-lr">我家没有电脑。</span>
        <span class="vertical-lr">Example text</span>
      </td>
      <td>
        <span class="vertical-lr rotated">我家没有电脑。</span>
        <span class="vertical-lr rotated">Example text</span>
      </td>
      <td>
        <span class="sideways-lr">我家没有电脑。</span>
        <span class="sideways-lr">Example text</span>
      </td>
      <td>
        <span class="only-rotate">我家没有电脑。</span>
        <span class="only-rotate">Example text</span>
      </td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
.vertical-lr {
  writing-mode: vertical-lr;
}

.rotated {
  transform: rotate(180deg);
}

.sideways-lr {
  writing-mode: sideways-lr;
}

.only-rotate {
  inline-size: fit-content;
  transform: rotate(-90deg);
}
```

```css hidden
table {
  border-collapse: collapse;
}
td,
th {
  border: 2px black solid;
  padding: 4px;
}
th {
  background-color: lightgray;
}
span {
  display: inline-block;
  width: 1.5em;
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("Using_writing-mode_with_transforms", 400, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("direction")}}
- {{Cssxref("unicode-bidi")}}
- {{Cssxref("text-orientation")}}
- {{Cssxref("text-combine-upright")}}
- [Thuộc tính logic CSS](/vi/docs/Web/CSS/Guides/Logical_properties_and_values)
- Mô-đun [chế độ viết CSS](/vi/docs/Web/CSS/Guides/Writing_modes)
- Thuộc tính SVG {{SVGAttr("writing-mode")}}
- [Tạo điều khiển biểu mẫu dọc](/vi/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
- [Xử lý các hướng văn bản khác nhau](/vi/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
- [Tạo kiểu cho văn bản dọc (tiếng Trung, Nhật, Hàn và Mông Cổ)](https://www.w3.org/International/articles/vertical-text/) trên W3.org (2022)
