---
title: CSSImportRule
slug: Web/API/CSSImportRule
page-type: web-api-interface
browser-compat: api.CSSImportRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSImportRule`** đại diện cho [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSImportRule.href")}} {{ReadOnlyInline}}
  - : Trả về URL được chỉ định bởi quy tắc {{cssxref("@import")}}.
- {{domxref("CSSImportRule.layerName")}} {{ReadOnlyInline}}
  - : Trả về tên của [tầng cascade](/vi/docs/Web/CSS/Reference/At-rules/@layer) được khai báo trong quy tắc {{cssxref("@import")}}, chuỗi rỗng nếu tầng là ẩn danh, hoặc `null` nếu quy tắc không khai báo bất kỳ tầng nào.
- {{domxref("CSSImportRule.media")}}
  - : Trả về giá trị của thuộc tính `media` của bảng kiểu liên kết.
- {{domxref("CSSImportRule.styleSheet")}} {{ReadOnlyInline}}
  - : Trả về bảng kiểu liên kết.
- {{domxref("CSSImportRule.supportsText")}} {{ReadOnlyInline}}
  - : Trả về điều kiện supports được chỉ định bởi quy tắc {{cssxref("@import")}}.

## Phương thức instance

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

Tài liệu bao gồm một bảng kiểu duy nhất chứa một quy tắc {{cssxref("@import")}} duy nhất. Do đó, mục đầu tiên trong danh sách các quy tắc CSS sẽ là một `CSSImportRule`.

```css
@import "style.css" screen;
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0]); // Một đối tượng instance CSSImportRule
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
