---
title: CSSLayerStatementRule
slug: Web/API/CSSLayerStatementRule
page-type: web-api-interface
browser-compat: api.CSSLayerStatementRule
---

{{APIRef("CSSOM")}}

**`CSSLayerStatementRule`** đại diện cho quy tắc câu lệnh {{cssxref("@layer")}}. Không giống {{domxref("CSSLayerBlockRule")}}, nó không chứa các quy tắc khác mà chỉ định nghĩa một hoặc nhiều lớp bằng cách cung cấp tên của chúng.

Quy tắc này cho phép khai báo rõ ràng thứ tự lớp theo cách rõ ràng ở đầu tệp CSS: thứ tự lớp được xác định bởi thứ tự xuất hiện đầu tiên của mỗi tên lớp. Khai báo chúng bằng câu lệnh cho phép người đọc hiểu thứ tự lớp. Nó cũng cho phép các lớp nội tuyến và được nhập xen kẽ nhau, điều này không thể thực hiện khi sử dụng cú pháp `CSSLayerBlockRule`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa thuộc tính từ giao diện cha, {{DOMxRef("CSSRule")}}._

- {{DOMxRef("CSSLayerStatementRule.nameList")}} {{ReadOnlyInline}}
  - : Một mảng chuỗi, đại diện cho tên của mỗi lớp cascade theo quy tắc.

## Ví dụ

### HTML

```html
<p></p>
```

### CSS

```css
@layer layerName, layerName2;
```

### JavaScript

```js
const item = document.getElementsByTagName("p")[0];
const rules = document.getElementById("css-output").sheet.cssRules;

const layer = rules[0]; // A CSSLayerStatementRule

item.textContent = `The CSS @layer statement declares the following layers: ${layer.nameList.join(
  ", ",
)}.`;
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@layer")}}
- [Câu lệnh at-rule `@layer` cho các lớp được đặt tên](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers#the_layer_statement_at-rule_for_named_layers)
- {{DOMxRef("CSSLayerBlockRule")}}
