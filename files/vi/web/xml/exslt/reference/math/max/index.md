---
title: math:max()
slug: Web/XML/EXSLT/Reference/math/max
page-type: exslt-function
sidebar: xmlsidebar
---

`math:max()` trả về giá trị lớn nhất của một node-set.

Để tính giá trị lớn nhất của node-set, node set được sắp xếp theo thứ tự giảm dần như khi dùng [`xsl:sort()`](/en-US/docs/Web/XML/XSLT/Reference/Element/sort) với kiểu dữ liệu là `number`. Giá trị lớn nhất sau đó là nút đầu tiên trong danh sách đã sắp xếp, được chuyển thành số.

## Cú pháp

```plain
math:max(nodeSet)
```

### Tham số

- `nodeSet`
  - : Node-set có giá trị cao nhất sẽ được trả về.

### Giá trị trả về

Một mảnh cây kết quả biểu diễn giá trị số của nút có giá trị cao nhất dưới dạng chuỗi.

## Thông số kỹ thuật

[EXSLT - MATH:MAX](https://exslt.github.io/math/functions/max/index.html)
