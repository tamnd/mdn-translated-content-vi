---
title: position
slug: Web/XML/XPath/Reference/Functions/position
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `position` trả về một số bằng với vị trí ngữ cảnh từ ngữ cảnh đánh giá biểu thức.

## Cú pháp

```plain
position()
```

### Giá trị trả về

Một số nguyên bằng với vị trí ngữ cảnh từ ngữ cảnh đánh giá biểu thức.

## Mô tả

- Lưu ý rằng vị trí của một nút trong ngữ cảnh không bắt đầu từ 0. Nút đầu tiên có vị trí là 1.

- Ngữ cảnh được xác định bởi phần còn lại của đường dẫn.

  ```xml
  <xsl:template match="//a[position() = 5]">
    <!-- mẫu này khớp với phần tử a thứ năm
            ở bất kỳ đâu trong tài liệu. -->
  </xsl:template>
  ```

  ```xml
  <xsl:template match="//div[@class='foo']/bar[position() = 1]">
    <!-- mẫu này khớp với phần tử bar đầu tiên là
        con của một phần tử div có thuộc tính class bằng "foo" -->
  </xsl:template>
  ```

## Đặc tả

[XPath 1.0 4.1](https://www.w3.org/TR/xpath-10/#function-position)

## Hỗ trợ Gecko

Được hỗ trợ.
