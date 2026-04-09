---
title: not
slug: Web/XML/XPath/Reference/Functions/not
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `not` đánh giá một biểu thức boolean và trả về giá trị ngược lại.

## Cú pháp

```plain
not( expression )
```

### Tham số

- `expression`
  - : Biểu thức được đánh giá đúng như khi được truyền làm đối số cho hàm [boolean()](/en-US/docs/Web/XML/XPath/Reference/Functions/boolean).

### Giá trị trả về

True nếu biểu thức đánh giá là false; false nếu biểu thức đánh giá là true.

## Mô tả

- Hàm này nên hoạt động tương tự như hàm [boolean()](/en-US/docs/Web/XML/XPath/Reference/Functions/boolean) ngoại trừ việc nó trả về giá trị ngược lại.
- Bạn có thể kiểm tra xem một phần tử có không có một thuộc tính nào đó hay không.

  ```xml
  <xsl:for-each match="//a[not(@name and @name = 'badname')]">
    <!-- lặp qua mọi phần tử <a> trong tài liệu, phần tử
          hoặc là không có thuộc tính 'name' nào cả, hoặc có,
          nhưng giá trị của nó không phải "badname". -->
  </xsl:template>
  ```

## Đặc tả

[XPath 1.0 4.3](https://www.w3.org/TR/xpath-10/#function-not)

## Hỗ trợ Gecko

Được hỗ trợ.
