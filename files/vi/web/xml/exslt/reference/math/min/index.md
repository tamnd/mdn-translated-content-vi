---
title: math:min()
slug: Web/XML/EXSLT/Reference/math/min
page-type: exslt-function
sidebar: xmlsidebar
---

`math:min()` trả về giá trị nhỏ nhất của một node-set.

Để tính giá trị nhỏ nhất của node-set, node set được sắp xếp theo thứ tự tăng dần như khi dùng [`xsl:sort()`](/en-US/docs/Web/XML/XSLT/Reference/Element/sort) với kiểu dữ liệu là `number`. Giá trị nhỏ nhất sau đó là nút đầu tiên trong danh sách đã sắp xếp, được chuyển thành số.

## Cú pháp

```plain
math:min(nodeSet)
```

### Tham số

- `nodeSet`
  - : Node-set có giá trị thấp nhất sẽ được trả về.

### Giá trị trả về

Một mảnh cây kết quả biểu diễn giá trị số của nút có giá trị thấp nhất dưới dạng chuỗi.

## Thông số kỹ thuật

[EXSLT - MATH:MIN](https://exslt.github.io/math/functions/min/index.html)
