---
title: <xsl:sort>
slug: Web/XML/XSLT/Reference/Element/sort
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:sort>` xác định một khóa sắp xếp cho các nút được chọn bởi `<xsl:apply-templates>` hoặc `<xsl:for-each>` và quyết định thứ tự mà chúng được xử lý.

## Syntax

```xml
<xsl:sort
  select=EXPRESSION
  order="ascending" | "descending"
  case-order="upper-first" | "lower-first"
  lang=XML:LANG-CODE
  data-type="text" | "number" />
```

### Required Attributes

Không có.

### Optional Attributes

- `select`
  - : Dùng một biểu thức XPath để xác định các nút sẽ được sắp xếp.
- `order`
  - : Chỉ định các nút nên được xử lý theo thứ tự `ascending` hay `descending`. Mặc định là `ascending`.
- `case-order`
  - : Cho biết chữ hoa hay chữ thường sẽ được xếp trước. Các giá trị cho phép là `upper-first` và `lower-first`.
- `lang`
  - : Chỉ định ngôn ngữ nào sẽ được dùng cho việc sắp xếp.
- `data-type`
  - : Xác định các mục sẽ được sắp xếp theo thứ tự chữ cái hay số. Các giá trị cho phép là `text` và `number`, trong đó `text` là mặc định.

### Type

Subinstruction, luôn xuất hiện như một phần tử con của \<xsl:for-each>, nơi nó phải xuất hiện trước phần template chính hoặc của \<xsl:apply-templates>.

## Specifications

XSLT, section10.

## Gecko support

Được hỗ trợ.
