---
title: "CSSFontFeatureValuesRule: thuộc tính fontFamily"
short-title: fontFamily
slug: Web/API/CSSFontFeatureValuesRule/fontFamily
page-type: web-api-instance-property
browser-compat: api.CSSFontFeatureValuesRule.fontFamily
---

{{ APIRef("CSSOM") }}

Thuộc tính **`fontFamily`** của giao diện {{domxref("CSSFontFeatureValuesRule")}} đại diện cho tên của họ font mà quy tắc này áp dụng.

## Giá trị

Một chuỗi.

## Ví dụ

### Đọc họ font

Trong ví dụ này, chúng ta khai báo hai {{cssxref("@font-feature-values")}}: một cho họ font _Font One_ và một cho _Font Two_. Sau đó chúng ta sử dụng CSSOM để đọc các họ font này và hiển thị vào log.

```html
<pre id="log"></pre>
```

#### CSS

```css
/* At-rule for "nice-style" in Font One */
@font-feature-values Font One {
  @styleset {
    nice-style: 12;
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
  font-variant-alternates: styleset(nice-style);
}
```

#### JavaScript

```js
const log = document.getElementById("log");
const rules = document.getElementById("css-output").sheet.cssRules;

const fontOne = rules[0]; // A CSSFontFeatureValuesRule
log.textContent = `The 1st '@font-feature-values' family: "${fontOne.fontFamily}".\n`;

const fontTwo = rules[1]; // Another CSSFontFeatureValuesRule
log.textContent += `The 2nd '@font-feature-values' family: "${fontTwo.fontFamily}".`;
```

{{EmbedLiveSample("read_font_family", "100%", "75px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
