---
title: "CSSGroupingRule: insertRule() method"
short-title: insertRule()
slug: Web/API/CSSGroupingRule/insertRule
page-type: web-api-instance-method
browser-compat: api.CSSGroupingRule.insertRule
---

{{ APIRef("CSSOM") }}

Phương thức **`insertRule()`** của giao diện
{{domxref("CSSGroupingRule")}} thêm quy tắc CSS mới vào danh sách các quy tắc CSS.

## Cú pháp

```js-nolint
insertRule(rule)
insertRule(rule, index)
```

### Tham số

- `rule`
  - : Một chuỗi
- `index` {{optional_inline}}
  - : Chỉ mục tùy chọn để chèn quy tắc; mặc định là 0.

### Giá trị trả về

Chỉ mục của quy tắc mới.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu _index_ lớn hơn số lượng quy tắc CSS con.
- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Được ném ra nếu `rule` không thể được chèn vào chỉ mục được chỉ định do một số ràng buộc CSS.
- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Được ném ra nếu `rule` là câu lệnh hợp lệ nhưng không phải là [câu lệnh lồng nhau](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#nested_statements).

## Ví dụ

```js
let myRules = document.styleSheets[0].cssRules;
myRules[0].insertRule(
  "html {background-color: blue;}",
  0,
); /* inserts a rule for the HTML element at position 0 */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
