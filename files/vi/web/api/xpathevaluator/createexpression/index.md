---
title: "XPathEvaluator: createExpression() method"
short-title: createExpression()
slug: Web/API/XPathEvaluator/createExpression
page-type: web-api-instance-method
browser-compat: api.XPathEvaluator.createExpression
---

{{APIRef("DOM")}}

Phương thức này biên dịch một {{domxref("XPathExpression")}} có thể được sử dụng để đánh giá (lặp lại) biểu thức {{Glossary("XPath")}}.

## Cú pháp

```js-nolint
createExpression(expression)
createExpression(expression, resolver)
```

### Tham số

- `expression`
  - : Chuỗi biểu diễn biểu thức XPath cần được tạo.
- `resolver` {{optional_inline}}
  - : Một {{domxref("Node")}}, `null`, hoặc bất kỳ đối tượng nào triển khai phương thức {{domxref("Node/lookupNamespaceURI", "lookupNamespaceURI")}}. Cho phép dịch tất cả các tiền tố, bao gồm cả tiền tố không gian tên `xml`, trong biểu thức XPath sang các URI không gian tên thích hợp.

### Giá trị trả về

Một {{domxref("XPathExpression")}} biểu diễn dạng đã biên dịch của biểu thức XPath.

### Ngoại lệ

#### INVALID_EXPRESSION_ERR

Nếu biểu thức không hợp lệ theo các quy tắc của `XPathEvaluator`, một {{domxref("DOMException")}} loại `INVALID_EXPRESSION_ERR` sẽ được ném ra.

#### NAMESPACE_ERR

Nếu biểu thức chứa các tiền tố không gian tên không thể được giải quyết bởi `XPathNSResolver` được chỉ định, một {{domxref("DOMException")}} loại `NAMESPACE_ERROR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng phương thức `evaluate()`.

### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt;s: <output></output></div>
```

### JavaScript

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

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Document.createExpression()")}}
- {{DOMxRef("XPathExpression")}}
