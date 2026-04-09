---
title: set:leading()
slug: Web/XML/EXSLT/Reference/set/leading
page-type: exslt-function
sidebar: xmlsidebar
---

`set:leading()` trả về các node trong một node-set đứng trước node đầu tiên trong node-set còn lại.

## Cú pháp

```js-nolint
set:leading(nodeSet1, nodeSet2)
```

### Tham số

- `nodeSet1`
  - : Node-set dùng để tìm các node đứng trước node đầu tiên trong node-set thứ hai.
- `nodeSet2`
  - : Node-set dùng để so sánh.

### Giá trị trả về

Một node-set chứa các node từ `nodeSet1` có giá trị đứng trước node đầu tiên trong `nodeSet2`.

> [!NOTE]
> Nếu node đầu tiên trong `nodeSet2` không nằm trong `nodeSet1`, một tập rỗng sẽ được trả về. Nếu `nodeSet2` rỗng, thì kết quả là `nodeSet1`.

## Thông số kỹ thuật

[EXSLT - SET:LEADING](https://exslt.github.io/set/functions/leading/index.html)
