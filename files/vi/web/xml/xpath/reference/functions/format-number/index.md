---
title: format-number
slug: Web/XML/XPath/Reference/Functions/format-number
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `format-number` đánh giá một số và trả về một chuỗi biểu diễn số đó theo một định dạng cho trước.

## Cú pháp

```plain
format-number(number, pattern)
format-number(number, pattern, decimalFormat)
```

### Tham số

- `number`
  - : Số cần được định dạng.
- `pattern`
  - : Một chuỗi theo định dạng của lớp Java [DecimalFormat](https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html).
- `decimalFormat` (tùy chọn)
  - : Tên của phần tử [`xsl:decimal-format`](/en-US/docs/Web/XML/XSLT/Reference/Element/decimal-format) xác định định dạng số sẽ dùng. Nếu bỏ qua, sẽ dùng decimal-format mặc định.

### Giá trị trả về

Một chuỗi biểu diễn số theo định dạng mới.

## Mô tả

Hàm này là một bổ sung riêng của XSLT cho XPath. Nó không thuộc thư viện hàm cốt lõi của XPath.

## Đặc tả

[XSLT 1.0 12.3](https://www.w3.org/TR/xslt-10/#function-format-number)

## Hỗ trợ Gecko

Được hỗ trợ.
