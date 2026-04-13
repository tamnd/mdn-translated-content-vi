---
title: CSSPageRule
slug: Web/API/CSSPageRule
page-type: web-api-interface
browser-compat: api.CSSPageRule
---

{{APIRef("CSSOM")}}

**`CSSPageRule`** biểu thị một quy tắc CSS {{cssxref("@page")}} đơn lẻ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ các lớp tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

- {{domxref("CSSPageRule.selectorText")}}
  - : Biểu thị văn bản của bộ chọn trang liên kết với at-rule.
- {{domxref("CSSPageRule.style")}} {{ReadOnlyInline}}
  - : Trả về [khối khai báo](/en-US/docs/Web/API/CSS_Object_Model/CSS_Declaration_Block) liên kết với at-rule.

## Phương thức phiên bản

_Kế thừa phương thức từ các lớp tổ tiên {{domxref("CSSGroupingRule")}} và {{domxref("CSSRule")}}._

## Ví dụ

### Lọc quy tắc trang

Ví dụ này cho thấy cách bạn có thể tìm các đối tượng `CSSPageRule` cho các quy tắc {{cssxref("@page")}} được tải bởi tài liệu.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```css hidden
#log {
  height: 220px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### CSS

Bên dưới chúng ta định nghĩa các kiểu cho trang bằng quy tắc {{cssxref("@page")}}.

```css
@page {
  margin: 1cm;
}
```

#### JavaScript

Code lặp qua tất cả các sheet trong tài liệu, và qua tất cả `cssRules` trong mỗi sheet, ghi lại chỉ số sheet, số lượng quy tắc, và loại của mỗi đối tượng quy tắc. Sau đó chúng ta phát hiện các đối tượng `CSSPageRule` bằng loại của chúng.

```js
for (
  let sheetCount = 0;
  sheetCount < document.styleSheets.length;
  sheetCount++
) {
  const sheet = document.styleSheets[sheetCount].cssRules;
  log(`styleSheet: ${sheetCount}`);

  const myRules = document.styleSheets[sheetCount].cssRules;
  log(`rules: ${myRules.length}`);
  for (const rule of myRules) {
    log(`rule: ${rule}`);
    if (rule instanceof CSSPageRule) {
      // Do something with CSSPageRule
    }
  }
}
```

#### Kết quả

Kết quả được hiển thị bên dưới.

{{EmbedLiveSample("Filtering for page rules", "100%", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
