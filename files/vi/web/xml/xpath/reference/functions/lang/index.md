---
title: lang
slug: Web/XML/XPath/Reference/Functions/lang
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `lang` xác định liệu nút ngữ cảnh có khớp với ngôn ngữ cho trước hay không và trả về boolean true hoặc false.

## Cú pháp

```plain
lang(string )
```

### Tham số

- `string`
  - : Mã ngôn ngữ hoặc mã bản địa hóa (ngôn ngữ và quốc gia) cần khớp.

### Giá trị trả về

`true` nếu nút ngữ cảnh khớp với ngôn ngữ đã cho. Ngược lại, `false`.

## Mô tả

- Ngôn ngữ của một nút được xác định bởi thuộc tính `xml:lang`. Nếu nút hiện tại không có thuộc tính `xml:lang`, thì giá trị của thuộc tính `xml:lang` của tổ tiên gần nhất có thuộc tính `xml:lang` sẽ xác định ngôn ngữ của nút hiện tại. Nếu không thể xác định ngôn ngữ (không có tổ tiên nào có thuộc tính `xml:lang`), hàm này sẽ trả về false.

- Nếu chuỗi `string` đã cho không chỉ định mã quốc gia, hàm này sẽ khớp các nút của ngôn ngữ đó với bất kỳ mã quốc gia nào. Chiều ngược lại thì không đúng.

Với đoạn XML sau:

```xml
<p xml:lang="en">I went up a floor.</p>
<p xml:lang="en-GB">I took the lift.</p>
<p xml:lang="en-US">I rode the elevator.</p>
```

Và phần này của một mẫu XSL:

```xml
<xsl:value-of select="count(//p[lang('en')])" />
<xsl:value-of select="count(//p[lang('en-GB')])" />
<xsl:value-of select="count(//p[lang('en-US')])" />
<xsl:value-of select="count(//p[lang('de')])" />
```

Kết quả đầu ra có thể là:

```plain
3
1
1
0
```

## Đặc tả

[XPath 1.0 4.3](https://www.w3.org/TR/xpath-10/#function-lang)

## Hỗ trợ Gecko

Được hỗ trợ.
