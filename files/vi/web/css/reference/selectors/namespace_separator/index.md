---
title: Namespace separator
slug: Web/CSS/Reference/Selectors/Namespace_separator
page-type: css-selector
browser-compat: css.selectors.namespace
sidebar: cssref
---

**Dấu phân tách không gian tên** (`|`) tách bộ chọn khỏi không gian tên, xác định {{glossary("namespace")}}, hoặc sự vắng mặt của nó, cho một bộ chọn kiểu.

```css
/* Links in the namespace named myNameSpace */
myNameSpace|a {
  font-weight: bold;
}
/* paragraphs in any namespace (including no namespace) */
*|p {
  color: darkblue;
}
/* heading level 2 not in a namespace */
|h2 {
  margin-bottom: 0;
}
```

[Bộ chọn kiểu](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) và [bộ chọn toàn thể](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) cho phép một thành phần không gian tên tùy chọn. Khi một không gian tên đã được khai báo trước thông qua {{CSSXref("@namespace")}}, các bộ chọn này có thể được gán không gian tên bằng cách thêm tên không gian tên vào trước bộ chọn, được tách bởi dấu phân tách không gian tên (`|`). Điều này hữu ích khi làm việc với các tài liệu chứa nhiều không gian tên như HTML có SVG hoặc MathML nội tuyến, hoặc XML kết hợp nhiều từ vựng.

- `ns|h1` - khớp các phần tử `<h1>` trong không gian tên `ns`
- `*|h1` - khớp tất cả các phần tử `<h1>`
- `|h1` - khớp tất cả các phần tử `<h1>` nằm ngoài bất kỳ không gian tên được khai báo hoặc ngầm định nào

## Cú pháp

```css
namespace|element { style properties }
```

## Ví dụ

Theo mặc định, tất cả các phần tử trong một phần tử HTML hoặc SVG đều có không gian tên vì không gian tên `http://www.w3.org/1999/xhtml` và `http://www.w3.org/2000/svg` được ngầm định. Phương thức {{domxref("document.createElementNS")}}, với chuỗi rỗng cho tham số không gian tên, có thể được dùng để tạo các phần tử không có không gian tên.

### Ví dụ không gian tên được đặt tên

Trong ví dụ này, tất cả các phần tử đều nằm trong một không gian tên.

#### HTML

Không có không gian tên nào được khai báo tường minh trong HTML hoặc trong SVG.

```html
<p>This paragraph <a href="#">has a link</a>.</p>

<svg width="400" viewBox="0 0 400 20">
  <a href="#">
    <text x="0" y="15">Link created in SVG</text>
  </a>
</svg>
```

#### CSS

CSS khai báo hai không gian tên, sau đó gán kiểu cho các liên kết toàn cục (`a`), các liên kết không có không gian tên (`|a`), các liên kết trong bất kỳ không gian tên hoặc không có không gian tên (`*|a`), và sau đó là hai không gian tên được đặt tên khác nhau (`svgNamespace|a` và `htmlNameSpace|a`).

```css
@namespace svgNamespace url("http://www.w3.org/2000/svg");
@namespace htmlNameSpace url("http://www.w3.org/1999/xhtml");
/* All `<a>`s in the default namespace, in this case, all `<a>`s */
a {
  font-size: 1.4rem;
}
/* no namespace */
|a {
  text-decoration: wavy overline lime;
  font-weight: bold;
}
/* all namespaces (including no namespace) */
*|a {
  color: red;
  fill: red;
  font-style: italic;
}
/* only the svgNamespace namespace, which is <svg> content */
svgNamespace|a {
  color: green;
  fill: green;
}
/* The htmlNameSpace namespace, which is the HTML document */
htmlNameSpace|a {
  text-decoration-line: line-through;
}
```

#### Kết quả

{{EmbedLiveSample("Named_namespace_example", "100%", 100)}}

Bộ chọn `|a`, một liên kết không có trong không gian tên, không khớp bất kỳ liên kết nào. Trong HTML, `http://www.w3.org/1999/xhtml` được ngầm định, nghĩa là tất cả HTML đều trong một không gian tên, dù không có không gian tên nào được khai báo tường minh. Trong SVG, dù không được đặt tường minh, không gian tên `http://www.w3.org/2000/svg` cũng được ngầm định. Điều này có nghĩa là tất cả nội dung đều nằm trong ít nhất một không gian tên.

### Không gian tên mặc định và không có không gian tên

Trong ví dụ này, chúng ta sử dụng JavaScript để tạo một phần tử không có không gian tên và thêm vào tài liệu. Chúng ta đặt không gian tên SVG là không gian tên mặc định bằng cách định nghĩa không gian tên không tên với `@namespace`.

> [!NOTE]
> Nếu một không gian tên mặc định, hoặc không tên, được định nghĩa, các bộ chọn toàn thể và kiểu chỉ áp dụng cho các phần tử trong không gian tên đó.

#### HTML

Không có không gian tên nào được khai báo tường minh trong HTML hoặc trong SVG.

```html
<p><a href="#">A link</a> in the implied HTML namespace.</p>

<svg width="400" viewBox="0 0 400 20">
  <a href="#">
    <text x="0" y="15">Link created in SVG namespace</text>
  </a>
</svg>
```

#### JavaScript

Với JavaScript, với {{DOMXRef("document.createElementNS")}}, chúng ta tạo một liên kết neo không có không gian tên, sau đó thêm liên kết vào.

```js
// create 'no namespace' anchor
const a = document.createElementNS("", "a");
a.href = "#";
a.appendChild(document.createTextNode("Link created without a namespace"));

document.body.appendChild(a);
```

#### CSS

Chúng ta khai báo một không gian tên với {{cssxref("@namespace")}}. Bằng cách bỏ tên cho không gian tên, khai báo `@namespace` tạo ra một không gian tên mặc định.

```css
/* By omitting a name, this sets SVG as the default namespace */
@namespace url("http://www.w3.org/2000/svg");

/* `<a>` in the default (set to SVG) namespace */
a {
  font-size: 1.4rem;
}

/* `<svg>` and `<p>` in the default (set to SVG) namespace */
svg,
p {
  border: 5px solid gold;
}

/* links outside of any namespace */
|a {
  text-decoration: wavy underline purple;
  font-weight: bold;
}

/* links with any namespace or no namespace */
*|a {
  font-style: italic;
  color: magenta;
  fill: magenta;
}
```

#### Kết quả

{{EmbedLiveSample("Default_namespace_and_no_namespace", "100%", 100)}}

Bộ chọn không có dấu phân tách không gian tên, `a`, chỉ khớp các phần tử `<a>` SVG, vì SVG được đặt làm không gian tên mặc định.

Bộ chọn không có không gian tên, `|a`, khớp phần tử `<a>` được định nghĩa bằng JavaScript và thêm vào, vì nút đó là nút duy nhất không có không gian tên mặc định.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@namespace")}}
- Phương thức [`Document.createElementNS()`](/en-US/docs/Web/API/Document/createElementNS)
- Thuộc tính [`Element.namespaceURI`](/en-US/docs/Web/API/Element/namespaceURI)
- [Bộ chọn kiểu CSS](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors)
- [Bộ chọn toàn thể CSS](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors)
- [Mô-đun bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
