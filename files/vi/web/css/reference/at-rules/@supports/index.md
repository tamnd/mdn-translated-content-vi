---
title: "@supports"
slug: Web/CSS/Reference/At-rules/@supports
page-type: css-at-rule
browser-compat: css.at-rules.supports
sidebar: cssref
---

**`@supports`** là một [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) của [CSS](/en-US/docs/Web/CSS) cho phép bạn chỉ định các khai báo CSS phụ thuộc vào hỗ trợ của trình duyệt đối với các tính năng CSS.
Việc dùng quy tắc at này thường được gọi là _truy vấn tính năng_.
Quy tắc phải được đặt ở cấp độ cao nhất trong mã của bạn hoặc lồng bên trong bất kỳ quy tắc at nhóm điều kiện nào khác.

Trong JavaScript, `@supports` có thể được truy cập qua giao diện mô hình đối tượng CSS {{DOMxRef("CSSSupportsRule")}}.

{{InteractiveExample("CSS Demo: @supports", "tabbed-standard")}}

```css interactive-example
.flex-container > * {
  padding: 0.3em;
  list-style-type: none;
  text-shadow: 0 0 2px red;
  float: left;
}

@supports (display: flex) {
  .flex-container > * {
    text-shadow: 0 0 2px blue;
    float: none;
  }

  .flex-container {
    display: flex;
  }
}
```

```html interactive-example
<ul class="flex-container">
  <li><a href="#">Index</a></li>
  <li><a href="#">About me</a></li>
  <li><a href="#">Contact</a></li>
</ul>
```

## Cú pháp

```css
@supports (<supports-condition>) {
  /* If the condition is true, use the CSS in this block. */
}

@supports (<supports-condition>) and (<supports-condition>) {
  /* If both conditions are true, use the CSS in this block. */
}
```

Quy tắc at `@supports` bao gồm một khối câu lệnh với _điều kiện hỗ trợ_.
Các điều kiện có thể được kết hợp bằng kết hợp (`and`), phân ly (`or`), và/hoặc phủ định (`not`).
Thứ tự ưu tiên của các toán tử có thể được xác định bằng dấu ngoặc đơn.

Các điều kiện hỗ trợ có thể dùng cú pháp khai báo `<property>: <value>` hoặc cú pháp `<function()>`.
Các phần sau mô tả việc dùng từng loại điều kiện hỗ trợ.

### Cú pháp khai báo

Cú pháp khai báo kiểm tra xem trình duyệt có hỗ trợ khai báo `<property>: <value>` được chỉ định hay không.
Khai báo phải được bao trong dấu ngoặc đơn.
Ví dụ sau trả về true nếu trình duyệt hỗ trợ biểu thức `transform-origin: 5% 5%`:

```css
@supports (transform-origin: 5% 5%) {
}
```

### Cú pháp hàm

Cú pháp hàm kiểm tra xem trình duyệt có hỗ trợ các giá trị hoặc biểu thức trong hàm hay không.
Các hàm được hỗ trợ trong cú pháp hàm được mô tả trong các phần sau.

#### `selector()`

Hàm này đánh giá xem trình duyệt có hỗ trợ cú pháp bộ chọn được chỉ định hay không.
Ví dụ sau trả về true và áp dụng kiểu CSS nếu trình duyệt hỗ trợ [bộ kết hợp con (child combinator)](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator):

```css
@supports selector(h2 > p) {
}
```

#### `font-tech()`

Hàm này kiểm tra xem trình duyệt có hỗ trợ công nghệ font chữ được chỉ định để bố cục và hiển thị hay không.
Ví dụ sau trả về true và áp dụng kiểu CSS nếu trình duyệt hỗ trợ công nghệ font chữ `COLRv1`:

```css
@supports font-tech(color-COLRv1) {
}
```

Bảng dưới đây mô tả các công nghệ font chữ (`<font-tech>`), bao gồm công nghệ font chữ màu (`<color-font-tech>`), công nghệ tính năng font chữ (`<font-features-tech>`), và các công nghệ font chữ khác có sẵn có thể truy vấn bằng hàm `font-tech()`:

| Công nghệ                          | Hỗ trợ                                                                                        |
| :--------------------------------- | :-------------------------------------------------------------------------------------------- |
| **`<color-font-tech>`**            |                                                                                               |
| `color-colrv0`                     | Các ký tự đa màu qua bảng COLR phiên bản 0                                                    |
| `color-colrv1`                     | Các ký tự đa màu qua bảng COLR phiên bản 1                                                    |
| `color-svg`                        | Bảng đa màu SVG                                                                               |
| `color-sbix`                       | Bảng đồ họa bitmap tiêu chuẩn                                                                 |
| `color-cbdt`                       | Bảng dữ liệu bitmap màu                                                                       |
| **`<font-features-tech>`**         |                                                                                               |
| `features-opentype`                | Bảng `GSUB` và `GPOS` của OpenType                                                            |
| `features-aat`                     | Bảng `morx` và `kerx` của TrueType                                                            |
| `features-graphite`                | Tính năng Graphite, cụ thể là các bảng `Silf`, `Glat`, `Gloc`, `Feat`, và `Sill`              |
| **Các giá trị `<font-tech>` khác** |                                                                                               |
| `incremental-patch`                | Tải font chữ tăng dần bằng phương pháp patch subset                                           |
| `incremental-range`                | Tải font chữ tăng dần bằng phương pháp range request                                          |
| `incremental-auto`                 | Tải font chữ tăng dần bằng method negotiation                                                 |
| `variations`                       | Biến thể font chữ trong TrueType và OpenType để kiểm soát trục font, trọng lượng, ký tự, v.v. |
| `palettes`                         | Bảng màu font chữ thông qua `font-palette` để chọn một trong nhiều bảng màu trong font chữ    |

#### `font-format()`

Hàm này kiểm tra xem trình duyệt có hỗ trợ định dạng font chữ được chỉ định để bố cục và hiển thị hay không.
Ví dụ sau trả về true và áp dụng kiểu CSS nếu trình duyệt hỗ trợ định dạng font chữ `opentype`:

```css
@supports font-format(opentype) {
}
```

Bảng sau mô tả các định dạng có sẵn (các giá trị `<font-format>`) có thể truy vấn bằng hàm này:

| Định dạng           | Mô tả                           | Phần mở rộng tệp |
| :------------------ | :------------------------------ | :--------------- |
| `collection`        | OpenType Collection             | `.otc`, `.ttc`   |
| `embedded-opentype` | Embedded OpenType               | `.eot`           |
| `opentype`          | OpenType                        | `.ttf`, `.otf`   |
| `svg`               | SVG Font (không dùng nữa)       | `.svg`, `.svgz`  |
| `truetype`          | TrueType                        | `.ttf`           |
| `woff`              | WOFF 1.0 (Web Open Font Format) | `.woff`          |
| `woff2`             | WOFF 2.0 (Web Open Font Format) | `.woff2`         |

### Toán tử not

Toán tử `not` đứng trước một biểu thức dẫn đến phủ định của biểu thức.
Ví dụ sau trả về true nếu thuộc tính {{CSSxRef("transform-origin")}} của trình duyệt coi `10em 10em 10em` là **không hợp lệ**:

```css
@supports not (transform-origin: 10em 10em 10em) {
}
```

Như với bất kỳ toán tử nào, toán tử `not` có thể được áp dụng cho khai báo có độ phức tạp bất kỳ.
Các ví dụ sau đây đều hợp lệ:

```css
@supports not (not (transform-origin: 2px)) {
}
@supports (display: grid) and (not (display: inline-grid)) {
}
```

> [!NOTE]
> Không cần bao toán tử `not` giữa hai dấu ngoặc đơn ở cấp độ cao nhất.
> Để kết hợp nó với các toán tử khác, như `and` và `or`, dấu ngoặc đơn là bắt buộc.

### Toán tử and

Toán tử `and` tạo biểu thức mới từ kết hợp của hai biểu thức ngắn hơn. Nó chỉ trả về true nếu **cả hai** biểu thức ngắn hơn cũng đều true. Ví dụ sau trả về true khi và chỉ khi cả hai biểu thức ngắn hơn đều đồng thời true:

```css
@supports (display: table-cell) and (display: list-item) {
}
```

Nhiều kết hợp có thể được đặt cạnh nhau mà không cần thêm dấu ngoặc đơn. Hai ví dụ sau đây là tương đương nhau:

```css
@supports (display: table-cell) and (display: list-item) and (display: contents) {
}
@supports (display: table-cell) and
  ((display: list-item) and (display: contents)) {
}
```

### Toán tử or

Toán tử `or` tạo biểu thức mới từ phân ly của hai biểu thức ngắn hơn. Nó trả về true nếu **một hoặc cả hai** biểu thức ngắn hơn cũng true. Ví dụ sau trả về true nếu ít nhất một trong hai biểu thức ngắn hơn là true:

```css
@supports (transform-style: preserve) or (-moz-transform-style: preserve) {
}
```

Nhiều phân ly có thể được đặt cạnh nhau mà không cần thêm dấu ngoặc đơn. Hai ví dụ sau đây là tương đương nhau:

```css
@supports (transform-style: preserve) or (-moz-transform-style: preserve) or
  (-webkit-transform-style: preserve) {
}

@supports (transform-style: preserve-3d) or
  (
    (-moz-transform-style: preserve-3d) or
      (-webkit-transform-style: preserve-3d)
  ) {
}
```

> [!NOTE]
> Khi dùng cả toán tử `and` và `or`, dấu ngoặc đơn phải được dùng để xác định thứ tự áp dụng của chúng. Nếu không, điều kiện không hợp lệ và toàn bộ quy tắc bị bỏ qua.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Kiểm tra hỗ trợ cho thuộc tính CSS

```css
@supports (animation-name: test) {
  /* CSS được áp dụng khi hoạt ảnh được hỗ trợ mà không có tiền tố */
  @keyframes {
    /* Các quy tắc at khác có thể được lồng bên trong */
  }
}
```

### Kiểm tra hỗ trợ cho thuộc tính CSS nhất định hoặc phiên bản có tiền tố

```css
@supports (text-stroke: 10px) or (-webkit-text-stroke: 10px) {
  /* CSS được áp dụng khi text-stroke, có tiền tố hoặc không, được hỗ trợ */
}
```

### Kiểm tra không hỗ trợ cho thuộc tính CSS cụ thể

```css
@supports not ((text-align-last: justify) or (-moz-text-align-last: justify)) {
  /* CSS để cung cấp thay thế dự phòng cho text-align-last: justify */
}
```

### Kiểm tra hỗ trợ cho bộ chọn

Các quy tắc điều kiện CSS cung cấp khả năng kiểm tra hỗ trợ cho bộ chọn như {{cssxref(":has",":has()")}}.

```css
/* Quy tắc này sẽ không được áp dụng trong các trình duyệt không hỗ trợ :has() */
ul:has(> li li) {
  /* CSS được áp dụng khi lớp giả :has(…) được hỗ trợ */
}

@supports not selector(:has(a, b)) {
  /* Dự phòng khi :has() không được hỗ trợ */
  ul > li,
  ol > li {
    /* Phần trên được mở rộng cho các trình duyệt không hỗ trợ :has(…) */
  }
}

/* Lưu ý: Cho đến nay, không có trình duyệt nào hỗ trợ đối số `of` của :nth-child(…) */
@supports selector(:nth-child(1n of a, b)) {
  /* Quy tắc này cần phải nằm bên trong khối @supports, nếu không
     nó sẽ được áp dụng một phần trong các trình duyệt không hỗ trợ
     đối số `of` của :nth-child(…) */
  :is(:nth-child(1n of ul, ol) a, details > summary) {
    /* CSS được áp dụng khi cả bộ chọn :is(…) và
       đối số `of` của :nth-child(…) đều được hỗ trợ */
  }
}
```

### Kiểm tra hỗ trợ cho công nghệ font chữ

Ví dụ sau áp dụng font chữ màu [Bungee Spice](https://fonts.google.com/specimen/Bungee+Spice) nếu trình duyệt hỗ trợ công nghệ font chữ `COLRv1`:

```css
@supports font-tech(color-COLRv1) {
  body {
    font-family: "Bungee Spice", fantasy;
  }
}
```

Cũng có thể kiểm tra hỗ trợ cho công nghệ font chữ bằng cách dùng hàm `tech` bên trong quy tắc at {{CSSxRef("@font-face")}}.
Trong ví dụ sau, nếu trình duyệt không hỗ trợ công nghệ font chữ màu trong font [`bungee-spice.woff2`](https://fonts.google.com/specimen/Bungee+Spice), font [`bungee.woff2`](https://fonts.google.com/specimen/Bungee) thông thường sẽ được dùng thay thế.

```css
@font-face {
  font-family: "Bungee Spice";
  src:
    url("bungee-spice.woff2") tech(color-COLRv1) format("woff2"),
    url("bungee.woff2") format("woff2");
}
```

### Kiểm tra hỗ trợ cho định dạng font chữ

Ví dụ sau dùng phiên bản WOFF2 của font chữ nếu trình duyệt hỗ trợ định dạng font chữ này, nếu không nó dự phòng sang phiên bản WOFF đã được chỉ định trước đó:

```css
@font-face {
  font-family: "Open Sans WOFF";
  src: url("open-sans.woff") format("woff");
}

@font-face {
  font-family: "Open Sans WOFF2";
  src: url("open-sans.woff2") format("woff2");
}

body {
  font-family: "Open Sans WOFF", sans-serif;
}

@supports font-format(woff2) {
  body {
    font-family: "Open Sans WOFF2", sans-serif;
  }
}
```

Tuy nhiên, cách hiệu quả hơn để chỉ định nhiều định dạng font chữ là liệt kê chúng trong bộ mô tả `src` của một quy tắc at {{cssxref("@font-face")}} theo thứ tự từ định dạng ưu tiên nhất đến ít ưu tiên nhất:

```css
@font-face {
  font-family: "Open Sans";
  src:
    url("open-sans.woff2") format("woff2"),
    url("open-sans.woff") format("woff");
}

body {
  font-family: "Open Sans", sans-serif;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng truy vấn tính năng](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- [Các hàm quy tắc at CSS](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
- {{DOMxRef("CSSSupportsRule")}}
- Phương thức {{DOMxref("CSS.supports_static", "CSS.supports()")}}
