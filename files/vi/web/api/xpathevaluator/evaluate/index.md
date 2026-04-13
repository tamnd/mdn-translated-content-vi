---
title: "XPathEvaluator: evaluate() method"
short-title: evaluate()
slug: Web/API/XPathEvaluator/evaluate
page-type: web-api-instance-method
browser-compat: api.XPathEvaluator.evaluate
---

{{APIRef("DOM")}}

Phương thức `evaluate()` của giao diện {{domxref("XPathEvaluator")}} thực thi một biểu thức XPath trên nút hoặc tài liệu đã cho và trả về một {{domxref("XPathResult")}}.

## Cú pháp

```js-nolint
evaluate(expression, contextNode)
evaluate(expression, contextNode, resolver)
evaluate(expression, contextNode, resolver, type)
evaluate(expression, contextNode, resolver, type, result)
```

### Tham số

- `expression`
  - : Chuỗi biểu diễn biểu thức XPath cần được phân tích và đánh giá.
- `contextNode`
  - : Một {{domxref("Node")}} biểu diễn ngữ cảnh để sử dụng khi đánh giá biểu thức.
- `resolver` {{optional_inline}}
  - : Một {{domxref("Node")}}, `null`, hoặc bất kỳ đối tượng nào triển khai phương thức {{domxref("Node/lookupNamespaceURI", "lookupNamespaceURI")}}. Cho phép dịch tất cả các tiền tố, bao gồm cả tiền tố không gian tên `xml`, trong biểu thức XPath sang các URI không gian tên thích hợp.
- `type` {{optional_inline}}
  - : Chỉ định loại kết quả được trả về bởi việc đánh giá biểu thức. Phải là một trong {{domxref("XPathResult", "XPathResult", "Constants")}}.
- `result` {{optional_inline}}
  - : Cho phép chỉ định một đối tượng kết quả có thể được tái sử dụng và trả về bởi phương thức này. Nếu được chỉ định là `null` hoặc triển khai không tái sử dụng kết quả đã chỉ định, một đối tượng kết quả mới sẽ được trả về.

### Giá trị trả về

Một đối tượng {{domxref("XPathResult")}} biểu diễn kết quả của việc đánh giá biểu thức XPath.

### Ngoại lệ

#### INVALID_EXPRESSION_ERR

Nếu biểu thức không hợp lệ theo các quy tắc của {{domxref("XPathEvaluator")}}, một {{domxref("DOMException")}} loại `INVALID_EXPRESSION_ERR` sẽ được ném ra.

#### TYPE_ERR

Trong trường hợp kết quả không thể được chuyển đổi sang loại đã chỉ định, một {{domxref("DOMException")}} loại `TYPE_ERR` sẽ được ném ra.

#### NAMESPACE_ERR

Nếu biểu thức chứa các tiền tố không gian tên không thể được giải quyết bởi `XPathNSResolver` được chỉ định, một {{domxref("DOMException")}} loại `NAMESPACE_ERROR` sẽ được ném ra.

#### WRONG_DOCUMENT_ERR

Nếu nút ngữ cảnh được cung cấp thuộc một tài liệu không được hỗ trợ bởi {{domxref("XPathEvaluator")}}, một {{domxref("DOMException")}} loại `WRONG_DOCUMENT_ERR` sẽ được ném ra.

#### NOT_SUPPORTED_ERR

Nếu nút ngữ cảnh được cung cấp không phải là loại được phép làm nút ngữ cảnh XPath hoặc loại yêu cầu không được {{domxref("XPathEvaluator")}} cho phép, một {{domxref("DOMException")}} loại `NOT_SUPPORTED_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng phương thức `evaluate()`.

### HTML

```html
<div>XPath example</div>
<div>Number of &lt;div&gt;s: <output></output></div>
```

### JavaScript

```js
const evaluator = new XPathEvaluator();
const result = evaluator.evaluate(
  "//div",
  document,
  null,
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
