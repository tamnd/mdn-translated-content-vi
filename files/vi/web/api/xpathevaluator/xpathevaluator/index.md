---
title: "XPathEvaluator: XPathEvaluator() constructor"
short-title: XPathEvaluator()
slug: Web/API/XPathEvaluator/XPathEvaluator
page-type: web-api-constructor
browser-compat: api.XPathEvaluator.XPathEvaluator
---

{{APIRef("DOM")}}

Hàm khởi tạo **`XPathEvaluator()`** tạo một {{domxref("XPathEvaluator")}} mới.

## Cú pháp

```js-nolint
new XPathEvaluator()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("XPathEvaluator")}} mới.

## Ví dụ

### Đếm số phần tử `<div>`

Ví dụ sau đây cho thấy cách sử dụng giao diện `XPathEvaluator`.

#### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt; elements: <output></output></div>
```

#### JavaScript

```js
const xpath = "//div";
const evaluator = new XPathEvaluator();
const expression = evaluator.createExpression(xpath);
const result = expression.evaluate(
  document,
  XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,
);
document.querySelector("output").textContent = result.snapshotLength;
```

#### Kết quả

{{EmbedLiveSample("count_the_number_of_div_elements", "100%", "50")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
