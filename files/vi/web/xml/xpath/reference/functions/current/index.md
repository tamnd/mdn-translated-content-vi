---
title: current
slug: Web/XML/XPath/Reference/Functions/current
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `current` có thể được dùng để lấy nút ngữ cảnh trong một chỉ thị XSLT.

## Cú pháp

```plain
current()
```

### Giá trị trả về

Một node-set chỉ chứa nút hiện tại.

## Mô tả

Đây là một bổ sung dành riêng cho XSLT đối với XPath. Nó không phải là một phần của thư viện hàm lõi của XPath.

Đối với một biểu thức ngoài cùng nhất (một biểu thức không nằm trong biểu thức khác), nút hiện tại luôn giống với nút ngữ cảnh (nút này sẽ được trả về bởi cú pháp `.` hoặc `self`). Hai cách sau là tương đương về mặt ngữ nghĩa.

```xml
<xsl:value-of select="current()"/>
```

```xml
<xsl:value-of select="."/>
```

Trong một biểu thức bên trong (ví dụ, trong dấu ngoặc vuông), nút hiện tại vẫn giống như nó sẽ là trong một biểu thức ngoài cùng nhất. Do đó, trong cả ba biểu thức sau, hàm `current` (chứ không phải toàn bộ biểu thức) trả về cùng một nút. Hơn nữa, hai biểu thức sau là tương đương về mặt ngữ nghĩa.

```xml
<xsl:value-of select="current()"/>
```

```xml
<xsl:value-of select="foo/bar[current() = X]"/>
```

```xml
<xsl:variable name="current" select="current()"/>
<xsl:value-of select="foo/bar[$current = X]"/>
```

Và đoạn mã tiếp theo cũng tương đương về mặt ngữ nghĩa với hai đoạn sau đó, vì `.` xuất hiện trong một biểu thức ngoài cùng nhất.

```xml
<xsl:variable name="current" select="."/>
<xsl:value-of select="foo/bar[$current = X]"/>
```

Nhưng `.` luôn liên hệ với ngữ cảnh hẹp nhất. Vì vậy, trong:

```xml
<xsl:value-of select="foo/bar[. = X]"/>
```

`.` trả về nút `bar`, nút này có thể khác với nút hiện tại.

## Đặc tả

[XSLT 1.0 12.4](https://www.w3.org/TR/xslt-10/#function-current)

## Hỗ trợ Gecko

Được hỗ trợ.
