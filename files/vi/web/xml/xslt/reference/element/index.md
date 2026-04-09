---
title: XSLT elements reference
short-title: Elements
slug: Web/XML/XSLT/Reference/Element
page-type: landing-page
sidebar: xmlsidebar
---

Có hai loại phần tử được bàn ở đây: phần tử cấp cao nhất và chỉ thị. Một phần tử cấp cao nhất phải xuất hiện như phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`. Ngược lại, một chỉ thị được gắn với một template. Một stylesheet có thể bao gồm nhiều template. Loại phần tử thứ ba, không được bàn ở đây, là literal result element (LRE). Một LRE cũng xuất hiện trong một template. Nó gồm bất kỳ phần tử nào không phải là chỉ thị và nên được sao chép nguyên trạng sang tài liệu kết quả, ví dụ như phần tử `<hr>` trong một stylesheet chuyển đổi HTML.

Liên quan đến điểm này, mọi thuộc tính trong một LRE và một số thuộc tính của một số phần tử XSLT hạn chế cũng có thể bao gồm cái gọi là attribute value template. Attribute value template là một chuỗi có nhúng một biểu thức XPath được dùng để chỉ định giá trị của thuộc tính. Khi chạy, biểu thức được đánh giá và kết quả của phép đánh giá được thay thế cho biểu thức XPath. Ví dụ, giả sử một biến `image-dir` được định nghĩa như sau:

```xml
<xsl:variable name="image-dir">/images</xsl:variable>
```

Biểu thức cần đánh giá được đặt trong dấu ngoặc nhọn:

```xml
<img src="{$image-dir}/mygraphic.jpg"/>
```

Điều này sẽ cho ra kết quả sau:

```xml
<img src="/images/mygraphic.jpg"/>
```

Các chú thích phần tử dưới đây bao gồm mô tả, danh sách cú pháp, danh sách các thuộc tính bắt buộc và tùy chọn, mô tả về loại và vị trí, nguồn của nó trong Khuyến nghị W3C và lời giải thích về mức độ hỗ trợ hiện tại của Gecko.

- [`<xsl:apply-imports>`](/en-US/docs/Web/XML/XSLT/Reference/Element/apply-imports)
- [`<xsl:apply-templates>`](/en-US/docs/Web/XML/XSLT/Reference/Element/apply-templates)
- [`<xsl:attribute>`](/en-US/docs/Web/XML/XSLT/Reference/Element/attribute)
- [`<xsl:attribute-set>`](/en-US/docs/Web/XML/XSLT/Reference/Element/attribute-set)
- [`<xsl:call-template>`](/en-US/docs/Web/XML/XSLT/Reference/Element/call-template)
- [`<xsl:choose>`](/en-US/docs/Web/XML/XSLT/Reference/Element/choose)
- [`<xsl:comment>`](/en-US/docs/Web/XML/XSLT/Reference/Element/comment)
- [`<xsl:copy>`](/en-US/docs/Web/XML/XSLT/Reference/Element/copy)
- [`<xsl:copy-of>`](/en-US/docs/Web/XML/XSLT/Reference/Element/copy-of)
- [`<xsl:decimal-format>`](/en-US/docs/Web/XML/XSLT/Reference/Element/decimal-format)
- [`<xsl:element>`](/en-US/docs/Web/XML/XSLT/Reference/Element/element)
- [`<xsl:fallback>`](/en-US/docs/Web/XML/XSLT/Reference/Element/fallback) _(không được hỗ trợ)_
- [`<xsl:for-each>`](/en-US/docs/Web/XML/XSLT/Reference/Element/for-each)
- [`<xsl:if>`](/en-US/docs/Web/XML/XSLT/Reference/Element/if)
- [`<xsl:import>`](/en-US/docs/Web/XML/XSLT/Reference/Element/import) _(chủ yếu được hỗ trợ)_
- [`<xsl:include>`](/en-US/docs/Web/XML/XSLT/Reference/Element/include)
- [`<xsl:key>`](/en-US/docs/Web/XML/XSLT/Reference/Element/key)
- [`<xsl:message>`](/en-US/docs/Web/XML/XSLT/Reference/Element/message)
- [`<xsl:namespace-alias>`](/en-US/docs/Web/XML/XSLT/Reference/Element/namespace-alias) _(không được hỗ trợ)_
- [`<xsl:number>`](/en-US/docs/Web/XML/XSLT/Reference/Element/number) _(được hỗ trợ một phần)_
- [`<xsl:otherwise>`](/en-US/docs/Web/XML/XSLT/Reference/Element/otherwise)
- [`<xsl:output>`](/en-US/docs/Web/XML/XSLT/Reference/Element/output) _(được hỗ trợ một phần)_
- [`<xsl:param>`](/en-US/docs/Web/XML/XSLT/Reference/Element/param)
- [`<xsl:preserve-space>`](/en-US/docs/Web/XML/XSLT/Reference/Element/preserve-space)
- [`<xsl:processing-instruction>`](/en-US/docs/Web/XML/XSLT/Reference/Element/processing-instruction)
- [`<xsl:sort>`](/en-US/docs/Web/XML/XSLT/Reference/Element/sort)
- [`<xsl:strip-space>`](/en-US/docs/Web/XML/XSLT/Reference/Element/strip-space)
- [`<xsl:stylesheet>`](/en-US/docs/Web/XML/XSLT/Reference/Element/stylesheet) _(được hỗ trợ một phần)_
- [`<xsl:template>`](/en-US/docs/Web/XML/XSLT/Reference/Element/template)
- [`<xsl:text>`](/en-US/docs/Web/XML/XSLT/Reference/Element/text) _(được hỗ trợ một phần)_
- [`<xsl:transform>`](/en-US/docs/Web/XML/XSLT/Reference/Element/transform)
- [`<xsl:value-of>`](/en-US/docs/Web/XML/XSLT/Reference/Element/value-of) _(được hỗ trợ một phần)_
- [`<xsl:variable>`](/en-US/docs/Web/XML/XSLT/Reference/Element/variable)
- [`<xsl:when>`](/en-US/docs/Web/XML/XSLT/Reference/Element/when)
- [`<xsl:with-param>`](/en-US/docs/Web/XML/XSLT/Reference/Element/with-param)
