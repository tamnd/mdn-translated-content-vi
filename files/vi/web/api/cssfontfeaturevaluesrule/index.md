---
title: CSSFontFeatureValuesRule
slug: Web/API/CSSFontFeatureValuesRule
page-type: web-api-interface
browser-compat: api.CSSFontFeatureValuesRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSFontFeatureValuesRule`** đại diện cho một [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@font-feature-values")}}. Các giá trị của thuộc tính phiên bản có thể được truy cập bằng giao diện [`CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap).

`@font-feature-values` cho phép các nhà phát triển liên kết, cho một font face nhất định, một tên dễ đọc với chỉ mục số kiểm soát một [tính năng font OpenType](/en-US/docs/Web/CSS/Guides/Fonts/OpenType_fonts) cụ thể. Đối với các tính năng chọn glyph thay thế (stylistic, styleset, character-variant, swash, ornament hoặc annotation), thuộc tính {{cssxref("font-variant-alternates")}} sau đó có thể tham chiếu tên dễ đọc để áp dụng tính năng liên quan. Điều này rất tiện lợi vì cho phép sử dụng cùng một tên để đại diện cho một tập hợp các glyph thay thế trên nhiều font khác nhau.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSFontFeatureValuesRule.annotation")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng chú thích thay thế của font.
- {{domxref("CSSFontFeatureValuesRule.characterVariant")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng các lựa chọn kiểu thay thế cho các ký tự của font.
- {{domxref("CSSFontFeatureValuesRule.fontFamily")}}
  - : Một chuỗi xác định họ font mà quy tắc này áp dụng.
- {{domxref("CSSFontFeatureValuesRule.ornaments")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng các trang trí thay thế của font.
- {{domxref("CSSFontFeatureValuesRule.styleset")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng các bộ kiểu thay thế của font.
- {{domxref("CSSFontFeatureValuesRule.stylistic")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng các glyph thay thế của font.
- {{domxref("CSSFontFeatureValuesRule.swash")}} {{experimental_inline}}
  - : Định nghĩa và giá trị do người dùng xác định, áp dụng các swash thay thế của font.

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

### Đọc họ font

Trong ví dụ này, chúng ta khai báo hai {{cssxref("@font-feature-values")}}: một cho họ font _Font One_ và một cho _Font Two_. Trong cả hai khai báo, chúng ta định nghĩa rằng tên "nice-style" có thể được dùng để đại diện cho các glyph thay thế của styleset cho cả hai font, chỉ định chỉ mục cho glyph thay thế đó trong mỗi họ font. Các glyph thay thế sau đó được áp dụng cho bất kỳ class `.nice-look` nào, sử dụng {{cssxref("font-variant-alternates")}} và truyền tên cho hàm [`styleset()`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-alternates#styleset).

Sau đó chúng ta sử dụng CSSOM để đọc các khai báo này dưới dạng các phiên bản `CSSFontFeatureValuesRule`, hiển thị chúng vào log.

#### CSS

```css
/* At-rule for "nice-style" in Font One */
@font-feature-values Font One {
  @styleset {
    nice-style: 12; /* name used to represent the alternate set of glyphs at index 12 */
  }
}

/* At-rule for "nice-style" in Font Two */
@font-feature-values Font Two {
  @styleset {
    nice-style: 4;
  }
}

/* Apply the at-rules with a single declaration */
.nice-look {
  font-variant-alternates: styleset(
    nice-style
  ); /* name selects different index for same alternate in different fonts */
}
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 40px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const rules = document.getElementById("css-output").sheet.cssRules;

const fontOne = rules[0]; // A CSSFontFeatureValuesRule
log(`The 1st '@font-feature-values' family: "${fontOne.fontFamily}".`);

const fontTwo = rules[1]; // Another CSSFontFeatureValuesRule
log(`The 2nd '@font-feature-values' family: "${fontTwo.fontFamily}"`);
```

{{EmbedLiveSample("read_font_family", "100%", "100px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-feature-values")}}
