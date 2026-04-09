---
title: set:difference()
slug: Web/XML/EXSLT/Reference/set/difference
page-type: exslt-function
sidebar: xmlsidebar
---

`set:difference()` trả về phần khác biệt giữa hai node-set. Nói cách khác, nó trả về một node-set mà các node của nó nằm trong một node-set nhưng không nằm trong node-set kia.

Phiên bản template của `set:difference` áp dụng template cho các node này ở chế độ `set:difference`, sao chép các node để trả về một result tree fragment gồm các node đó.

## Cú pháp

```plain
set:difference(nodeSet1, nodeSet2)
```

### Tham số

- `nodeSet1`
  - : Node-set mà từ đó sẽ trừ đi các node.
- `nodeSet2`
  - : Tập hợp các node cần trừ khỏi `nodeSet1`.

### Giá trị trả về

Một node-set chứa các node có trong `nodeSet1` nhưng không có trong `nodeSet2`.

## Thông số kỹ thuật

[EXSLT - SET:DIFFERENCE](https://exslt.github.io/set/functions/difference/index.html)
