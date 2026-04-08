---
title: Attribute selectors
slug: Web/CSS/Reference/Selectors/Attribute_selectors
page-type: css-selector
browser-compat: css.selectors.attribute
sidebar: cssref
---

**Bộ chọn thuộc tính** CSS khớp các phần tử dựa trên việc phần tử đó có một thuộc tính nhất định được đặt tường minh, với các tùy chọn để xác định giá trị thuộc tính hoặc khớp chuỗi con giá trị thuộc tính.

## Cú pháp

```css
/* <a> elements with a title attribute */
a[title] {
  color: purple;
}

/* <a> elements with an href matching "https://example.org" */
a[href="https://example.org"] {
  color: green;
}

/* <a> elements with an href containing "example" */
a[href*="example"] {
  font-size: 2em;
}

/* <a> elements with an href ending ".org", case-insensitive */
a[href$=".org" i] {
  font-style: italic;
}

/* <a> elements whose class attribute contains the word "logo" */
a[class~="logo"] {
  padding: 2px;
}
```

- `[attr]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_.
- `[attr=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó chính xác là _value_.
- `[attr~=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó là danh sách các từ cách nhau bằng khoảng trắng, trong đó một từ chính xác là _value_.
- `[attr|=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó có thể chính xác là _value_ hoặc có thể bắt đầu bằng _value_ theo sau ngay lập tức bởi một dấu gạch ngang, `-` (U+002D). Thường được dùng để khớp mã ngôn ngữ con.
- `[attr^=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó có tiền tố (đứng trước) là _value_.
- `[attr$=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó có hậu tố (đứng sau) là _value_.
- `[attr*=value]`
  - : Đại diện cho các phần tử có tên thuộc tính là _attr_ mà giá trị của nó chứa ít nhất một lần xuất hiện của _value_ trong chuỗi.
- `[attr operator value i]`
  - : Thêm `i` (hoặc `I`) trước dấu ngoặc đóng khiến giá trị được so sánh không phân biệt chữ hoa/thường (đối với các ký tự trong phạm vi {{Glossary("ASCII")}}).
- `[attr operator value s]`
  - : Thêm `s` (hoặc `S`) trước dấu ngoặc đóng khiến giá trị được so sánh phân biệt chữ hoa/thường (đối với các ký tự trong phạm vi {{Glossary("ASCII")}}).

### Giá trị

- `<attr>`
  - : Một {{cssxref("ident")}}, tức là tên thuộc tính không có dấu nháy. Đây có thể là bất kỳ thuộc tính hợp lệ theo ngôn ngữ cụ thể (SVG, HTML, XML, v.v.), một [thuộc tính `data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*), hoặc một thuộc tính do tác giả tạo.
- `<value>`
  - : Một {{cssxref("ident")}} hoặc {{cssxref("string")}}, đại diện cho giá trị thuộc tính. Giá trị phải được đặt trong dấu nháy nếu nó chứa khoảng trắng hoặc ký tự đặc biệt.
- `s` hoặc `i`
  - : Cờ phân biệt hoặc không phân biệt chữ hoa/thường. Nếu được đưa vào trước dấu ngoặc đóng (`]`), làm cho giá trị phân biệt hoặc không phân biệt chữ hoa/thường, bất kể ngôn ngữ đánh dấu.

## Mô tả

Độ nhạy phân biệt chữ hoa/thường của tên và giá trị thuộc tính phụ thuộc vào ngôn ngữ tài liệu. Trong HTML, tên thuộc tính không phân biệt chữ hoa/thường, cũng như các giá trị {{glossary("enumerated")}} được định nghĩa trong đặc tả. [Các giá trị thuộc tính HTML không phân biệt chữ hoa/thường](https://html.spec.whatwg.org/multipage/semantics-other.html#case-sensitivity-of-selectors) được liệt kê trong đặc tả HTML. Đối với những thuộc tính này, giá trị thuộc tính trong bộ chọn không phân biệt chữ hoa/thường, bất kể giá trị có hợp lệ hay thuộc tính cho phần tử mà nó được đặt có hợp lệ hay không.

Nếu giá trị thuộc tính phân biệt chữ hoa/thường, như các thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class), [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), và [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*), thì việc khớp giá trị trong bộ chọn thuộc tính cũng phân biệt chữ hoa/thường. Các thuộc tính được định nghĩa bên ngoài đặc tả HTML, như các thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) và [`aria-*`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes), cũng phân biệt chữ hoa/thường. Bộ chọn thuộc tính phân biệt chữ hoa/thường có thể được làm cho không phân biệt chữ hoa/thường bằng cách thêm bộ điều chỉnh không phân biệt chữ hoa/thường (`i`).

## Ví dụ

### Liên kết

#### CSS

```css
a {
  color: blue;
}

/* Internal links, beginning with "#" */
a[href^="#"] {
  background-color: gold;
}

/* Links with "example" anywhere in the URL */
a[href*="example"] {
  background-color: silver;
}

/* Links with "insensitive" anywhere in the URL,
   regardless of capitalization */
a[href*="insensitive" i] {
  color: cyan;
}

/* Links with "cAsE" anywhere in the URL,
with matching capitalization */
a[href*="cAsE" s] {
  color: pink;
}

/* Links that end in ".org" */
a[href$=".org"] {
  color: red;
}

/* Links that start with "https://" and end in ".org" */
a[href^="https://"][href$=".org"] {
  color: green;
}
```

#### HTML

```html
<ul>
  <li><a href="#internal">Internal link</a></li>
  <li><a href="http://example.com">Example link</a></li>
  <li><a href="#InSensitive">Insensitive internal link</a></li>
  <li><a href="http://example.org">Example org link</a></li>
  <li><a href="https://example.org">Example https org link</a></li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Links")}}

### Ngôn ngữ

#### CSS

```css
/* All divs with a `lang` attribute are bold. */
div[lang] {
  font-weight: bold;
}

/* All divs without a `lang` attribute are italicized. */
div:not([lang]) {
  font-style: italic;
}

/* All divs in US English are blue. */
div[lang~="en-us"] {
  color: blue;
}

/* All divs in Portuguese are green. */
div[lang="pt"] {
  color: green;
}

/* All divs in Chinese are red, whether
   simplified (zh-Hans-CN) or traditional (zh-Hant-TW). */
div[lang|="zh"] {
  color: red;
}

/* All divs with a Traditional Chinese
   `data-lang` are purple. */
/* Note: You could also use hyphenated attributes
   without double quotes */
div[data-lang="zh-Hant-TW"] {
  color: purple;
}
```

#### HTML

```html
<div lang="en-us en-gb en-au en-nz">Hello World!</div>
<div lang="pt">Olá Mundo!</div>
<div lang="zh-Hans-CN">世界您好！</div>
<div lang="zh-Hant-TW">世界您好！</div>
<div data-lang="zh-Hant-TW">世界您好！</div>
```

#### Kết quả

{{EmbedLiveSample("Languages")}}

### Danh sách có thứ tự HTML

Đặc tả HTML yêu cầu thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được khớp không phân biệt chữ hoa/thường vì nó chủ yếu được dùng trong phần tử {{HTMLElement("input")}}.
Lưu ý rằng nếu bộ điều chỉnh không được tác nhân người dùng hỗ trợ, thì bộ chọn sẽ không khớp.

#### CSS

```css
/* Case-sensitivity depends on document language */
ol[type="a"]:first-child {
  list-style-type: lower-alpha;
  background: red;
}

ol[type="i" s] {
  list-style-type: lower-alpha;
  background: lime;
}

ol[type="I" s] {
  list-style-type: upper-alpha;
  background: grey;
}

ol[type="a" i] {
  list-style-type: upper-alpha;
  background: green;
}
```

#### HTML

```html
<ol type="A">
  <li>
    Red background for case-insensitive matching (default for the type selector)
  </li>
</ol>
<ol type="i">
  <li>Lime background if `s` modifier is supported (case-sensitive match)</li>
</ol>
<ol type="I">
  <li>Grey background if `s` modifier is supported (case-sensitive match)</li>
</ol>
<ol type="A">
  <li>
    Green background if `i` modifier is supported (case-insensitive match)
  </li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("HTML_ordered_lists")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("attr")}}
- Chọn một phần tử đơn: {{DOMxRef("Document.querySelector()")}}, {{DOMxRef("DocumentFragment.querySelector()")}}, hoặc {{DOMxRef("Element.querySelector()")}}
- Chọn tất cả phần tử khớp: {{DOMxRef("Document.querySelectorAll()")}}, {{DOMxRef("DocumentFragment.querySelectorAll()")}}, hoặc {{DOMxRef("Element.querySelectorAll()")}}
- [Giá trị bộ chọn thuộc tính không phân biệt chữ hoa/thường](https://html.spec.whatwg.org/multipage/semantics-other.html#case-sensitivity-of-selectors) trên WHATWG
