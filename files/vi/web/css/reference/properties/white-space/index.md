---
title: white-space
slug: Web/CSS/Reference/Properties/white-space
page-type: css-property
browser-compat: css.properties.white-space
sidebar: cssref
---

Thuộc tính **`white-space`** của [CSS](/vi/docs/Web/CSS) thiết lập cách xử lý {{Glossary("whitespace", "khoảng trắng")}} bên trong một phần tử.

{{InteractiveExample("CSS Demo: white-space")}}

```css interactive-example-choice
white-space: normal;
```

```css interactive-example-choice
white-space: pre;
```

```css interactive-example-choice
white-space: pre-wrap;
```

```css interactive-example-choice
white-space: pre-line;
```

```css interactive-example-choice
white-space: wrap;
```

```css interactive-example-choice
white-space: collapse;
```

```css interactive-example-choice
white-space: preserve nowrap;
```

<!-- cSpell:ignore stept -->

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
    <p>
      But ere she from the church-door stepped She smiled and told us why: 'It
      was a wicked woman's curse,' Quoth she, 'and what care I?' She smiled, and
      smiled, and passed it off Ere from the door she stept—
    </p>
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 16rem;
}

#example-element p {
  border: 1px solid #c5c5c5;
  padding: 0.75rem;
  text-align: left;
}
```

Thuộc tính này chỉ định hai điều:

- Khoảng trắng có bị [thu gọn](/vi/docs/Web/CSS/Guides/Text/Whitespace#collapsing_and_transformation) hay không và như thế nào.
- Các dòng có được xuống dòng hay không và như thế nào.

> [!NOTE]
> Để ngắt từ _bên trong chính nó_, hãy dùng {{CSSxRef("overflow-wrap")}}, {{CSSxRef("word-break")}}, hoặc {{CSSxRef("hyphens")}} thay thế.

## Thuộc tính cấu thành

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("white-space-collapse")}}
- {{cssxref("text-wrap-mode")}}

> [!NOTE]
> Đặc tả định nghĩa thêm một thuộc tính cấu thành thứ ba: `white-space-trim`, thuộc tính này chưa được triển khai trong bất kỳ trình duyệt nào.

## Cú pháp

```css
/* Giá trị từ khóa đơn */
white-space: normal;
white-space: pre;
white-space: pre-wrap;
white-space: pre-line;

/* Giá trị viết tắt white-space-collapse và text-wrap-mode */
white-space: nowrap;
white-space: wrap;
white-space: break-spaces;
white-space: collapse;
white-space: preserve nowrap;

/* Giá trị toàn cục */
white-space: inherit;
white-space: initial;
white-space: revert;
white-space: revert-layer;
white-space: unset;
```

### Giá trị

Các giá trị của thuộc tính `white-space` có thể được chỉ định là một hoặc hai từ khóa đại diện cho các giá trị của thuộc tính {{CSSxRef("white-space-collapse")}} và {{cssxref("text-wrap-mode")}}, hoặc các từ khóa đặc biệt sau:

- `normal`
  - : Các chuỗi khoảng trắng được [thu gọn](/vi/docs/Web/CSS/Guides/Text/Whitespace#collapsing_and_transformation). Ký tự xuống dòng trong nguồn được xử lý giống như các khoảng trắng khác. Các dòng được ngắt khi cần thiết để lấp đầy hộp dòng. Tương đương với `collapse wrap`.
- `pre`
  - : Các chuỗi khoảng trắng được bảo toàn. Các dòng chỉ bị ngắt tại ký tự xuống dòng trong nguồn và tại các phần tử {{HTMLElement("br")}}. Tương đương với `preserve nowrap`.
- `pre-wrap`
  - : Các chuỗi khoảng trắng được bảo toàn. Các dòng bị ngắt tại ký tự xuống dòng, tại {{HTMLElement("br")}}, và khi cần thiết để lấp đầy hộp dòng. Tương đương với `preserve wrap`.
- `pre-line`
  - : Các chuỗi khoảng trắng được [thu gọn](/vi/docs/Web/CSS/Guides/Text/Whitespace#collapsing_and_transformation). Các dòng bị ngắt tại ký tự xuống dòng, tại {{HTMLElement("br")}}, và khi cần thiết để lấp đầy hộp dòng. Tương đương với `preserve-breaks wrap`.

> [!NOTE]
> Thuộc tính `white-space` với tư cách là viết tắt là tính năng tương đối mới (xem [khả năng tương thích trình duyệt](#browser_compatibility)). Ban đầu, nó có sáu giá trị từ khóa; hiện tại, giá trị `nowrap` được hiểu là giá trị cho {{cssxref("text-wrap-mode")}}, trong khi `break-spaces` được hiểu là giá trị cho {{cssxref("white-space-collapse")}}. Bốn từ khóa trên vẫn dành riêng cho `white-space`, nhưng chúng có các thuộc tính viết dài tương đương. Sự thay đổi để `white-space` trở thành viết tắt mở rộng các giá trị chấp nhận được sang nhiều từ khóa và tổ hợp hơn, chẳng hạn như `wrap` và `collapse`.

Bảng sau đây tóm tắt hành vi của bốn giá trị từ khóa `white-space` này:

<table class="standard-table">
  <thead>
    <tr>
      <th></th>
      <th>Dòng mới</th>
      <th>Khoảng trắng và tab</th>
      <th>Xuống dòng văn bản</th>
      <th>Khoảng trắng cuối dòng</th>
      <th>Dấu phân cách khoảng trắng cuối dòng khác</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th><code>normal</code></th>
      <td>Thu gọn</td>
      <td>Thu gọn</td>
      <td>Xuống dòng</td>
      <td>Xóa</td>
      <td>Treo</td>
    </tr>
    <tr>
      <th><code>pre</code></th>
      <td>Bảo toàn</td>
      <td>Bảo toàn</td>
      <td>Không xuống dòng</td>
      <td>Bảo toàn</td>
      <td>Không xuống dòng</td>
    </tr>
    <tr>
      <th><code>pre-wrap</code></th>
      <td>Bảo toàn</td>
      <td>Bảo toàn</td>
      <td>Xuống dòng</td>
      <td>Treo</td>
      <td>Treo</td>
    </tr>
    <tr>
      <th><code>pre-line</code></th>
      <td>Bảo toàn</td>
      <td>Thu gọn</td>
      <td>Xuống dòng</td>
      <td>Xóa</td>
      <td>Treo</td>
    </tr>
  </tbody>
</table>

Tab mặc định là 8 khoảng trắng và có thể được cấu hình bằng thuộc tính {{cssxref("tab-size")}}. Trong trường hợp các giá trị `normal`, `nowrap`, và `pre-line`, mỗi tab được chuyển đổi thành ký tự khoảng trắng (U+0020).

> [!NOTE]
> Có sự phân biệt giữa **khoảng trắng** và **dấu phân cách khoảng trắng khác**. Chúng được định nghĩa như sau:
>
> - khoảng trắng
>   - : Dấu cách (U+0020), tab (U+0009) và ngắt đoạn (chẳng hạn như xuống dòng).
> - dấu phân cách khoảng trắng khác
>   - : Tất cả các dấu phân cách khoảng trắng khác được định nghĩa trong Unicode, ngoài những dấu đã được định nghĩa là khoảng trắng.
>
> Khi khoảng trắng được cho là _treo_, điều này có thể ảnh hưởng đến kích thước của hộp khi đo cho kích thước nội tại.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Ví dụ cơ bản

```css
code {
  white-space: pre;
}
```

### Ngắt dòng bên trong phần tử \<pre>

```css
pre {
  white-space: pre-wrap;
}
```

### Thực tế

```html hidden
<div id="css-code" class="box">
  p { white-space:
  <select>
    <option>normal</option>
    <option>nowrap</option>
    <option>pre</option>
    <option>pre-wrap</option>
    <option>pre-line</option>
    <option>break-spaces</option>
  </select>
  }
</div>
<div id="results" class="box">
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  </p>
</div>
```

```css hidden
.box {
  width: 350px;
  padding: 16px;
}

#css-code {
  background-color: gainsboro;
  font-size: 16px;
  font-family: monospace;
}

#css-code select {
  font-family: inherit;
  width: 100px;
}

#results {
  background-color: rgb(230 230 230);
  overflow-x: scroll;
  white-space: normal;
  font-size: 14px;
}
```

```js hidden
const select = document.querySelector("#css-code select");
const results = document.querySelector("#results p");
select.addEventListener("change", (e) => {
  results.style.setProperty("white-space", e.target.value);
});
```

{{EmbedLiveSample("In_action", "100%", 450)}}

### Kiểm soát xuống dòng trong bảng

#### HTML

```html
<table>
  <tbody>
    <tr>
      <td></td>
      <td>Nội dung rất dài bị tách</td>
      <td class="nw">Nội dung rất dài không bị tách</td>
    </tr>
    <tr>
      <td class="nw">white-space:</td>
      <td>normal</td>
      <td>nowrap</td>
    </tr>
  </tbody>
</table>
```

#### CSS

```css
table {
  border-collapse: collapse;
  border: solid black 1px;
  width: 250px;
  height: 150px;
}
td {
  border: solid 1px black;
  text-align: center;
}
.nw {
  white-space: nowrap;
}
```

#### Kết quả

{{EmbedLiveSample('Controlling line wrapping in tables', "100%", "100%")}}

### Nhiều dòng trong phần tử SVG text

Thuộc tính CSS `white-space` có thể được dùng để tạo nhiều dòng trong phần tử {{SVGElement("text")}}, vốn không tự xuống dòng theo mặc định.

#### HTML

Văn bản bên trong phần tử `<text>` cần được chia thành nhiều dòng để các dòng mới được nhận diện. Sau dòng đầu tiên, phần còn lại cần được xóa khoảng trắng đầu dòng.

```html-nolint
<svg viewBox="0 0 320 150">
  <text y="20" x="10">Here is an English paragraph
that is broken into multiple lines
in the source code so that it can
be more easily read and edited
in a text editor.
  </text>
</svg>
```

#### CSS

```css
text {
  white-space: break-spaces;
}
```

#### Kết quả

{{EmbedLiveSample("multiple_lines_in_svg_text_element", "100%", 350)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính xác định cách từ ngắt _bên trong chính nó_: {{CSSxRef("overflow-wrap")}}, {{CSSxRef("word-break")}}, {{CSSxRef("hyphens")}}
- {{cssxref("tab-size")}}
- [Xử lý khoảng trắng trong CSS](/vi/docs/Web/CSS/Guides/Text/Whitespace)
