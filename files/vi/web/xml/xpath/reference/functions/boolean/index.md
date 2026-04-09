---
title: boolean
slug: Web/XML/XPath/Reference/Functions/boolean
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `boolean` đánh giá một biểu thức và trả về true hoặc false.

## Cú pháp

```js-nolint
boolean( expression )
```

### Tham số

- `expression`
  - : Biểu thức cần được đánh giá. Biểu thức có thể tham chiếu đến số và node-set cũng như các giá trị boolean.

### Giá trị trả về

Giá trị Boolean `true` hoặc `false` sau khi đánh giá `expression`.

## Mô tả

- Một số được đánh giá là false nếu nó là số 0 dương hoặc âm, hoặc `NaN`. Ngược lại, nó được đánh giá là true.
- Một node-set được đánh giá là true nếu nó không rỗng.
- Một chuỗi được đánh giá là false nếu nó là chuỗi rỗng. Ngược lại, nó được đánh giá là true.
- Một đối tượng có kiểu khác bốn kiểu cơ bản sẽ được chuyển đổi thành boolean theo cách phụ thuộc vào kiểu đó.

## Đặc tả

[XPath 1.0 4.3](https://www.w3.org/TR/xpath-10/#function-boolean)

## Hỗ trợ Gecko

Được hỗ trợ.
