---
title: math:highest()
slug: Web/XML/EXSLT/Reference/math/highest
page-type: exslt-function
sidebar: xmlsidebar
---

`math:highest()` trả về nút trong node-set đã chỉ định có giá trị cao nhất (trong đó giá trị cao nhất được tính bằng [`math:max()`](/en-US/docs/Web/XML/EXSLT/Reference/math/max)).

Một nút có giá trị tối đa này nếu việc chuyển giá trị chuỗi của nó sang số bằng với giá trị tối đa.

## Cú pháp

```plain
math:highest(nodeSet)
```

### Tham số

- `nodeSet`
  - : Node-set có giá trị cao nhất sẽ được trả về.

### Giá trị trả về

Một mảnh cây kết quả gồm các bản sao của những nút được trả về bởi [`math:max()`](/en-US/docs/Web/XML/EXSLT/Reference/math/max).

## Thông số kỹ thuật

[EXSLT - MATH:HIGHEST](https://exslt.github.io/math/functions/highest/index.html)
