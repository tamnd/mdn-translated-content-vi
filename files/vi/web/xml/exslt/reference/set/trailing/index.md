---
title: set:trailing()
slug: Web/XML/EXSLT/Reference/set/trailing
page-type: exslt-function
sidebar: xmlsidebar
---

`set:trailing()` trả về các node trong một node-set đứng sau node đầu tiên trong node-set còn lại.

## Cú pháp

```plain
set:trailing(nodeSet1, nodeSet2)
```

### Tham số

- `nodeSet1`
  - : Node-set dùng để tìm các node đứng sau node đầu tiên trong node-set thứ hai.
- `nodeSet2`
  - : Node-set dùng để so sánh.

### Giá trị trả về

Một node-set chứa các node từ `nodeSet1` có giá trị đứng sau node đầu tiên trong `nodeSet2`.

> [!NOTE]
> Nếu node đầu tiên trong `nodeSet2` không nằm trong `nodeSet1`, một tập rỗng sẽ được trả về. Nếu `nodeSet2` rỗng, thì kết quả là `nodeSet1`.

## Thông số kỹ thuật

[EXSLT - SET:TRAILING](https://exslt.github.io/set/functions/trailing/index.html)
