---
title: math:lowest()
slug: Web/XML/EXSLT/Reference/math/lowest
page-type: exslt-function
sidebar: xmlsidebar
---

`math:lowest()` trả về nút trong node-set đã chỉ định có giá trị thấp nhất (trong đó giá trị thấp nhất được tính bằng [`math:min()`](/en-US/docs/Web/XML/EXSLT/Reference/math/min)).

Một nút có giá trị tối thiểu này nếu việc chuyển giá trị chuỗi của nó sang số bằng với giá trị tối thiểu.

## Cú pháp

```plain
math:lowest(nodeSet)
```

### Tham số

- `nodeSet`
  - : Node-set có giá trị thấp nhất sẽ được trả về.

### Giá trị trả về

Một mảnh cây kết quả gồm các bản sao của những nút được trả về bởi [`math:min()`](/en-US/docs/Web/XML/EXSLT/Reference/math/min).

## Thông số kỹ thuật

[EXSLT - MATH:LOWEST](https://exslt.github.io/math/functions/lowest/index.html)
