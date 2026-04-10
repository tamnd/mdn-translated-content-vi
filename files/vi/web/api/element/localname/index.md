---
title: "Element: localName property"
short-title: localName
slug: Web/API/Element/localName
page-type: web-api-instance-property
browser-compat: api.Element.localName
---

{{APIRef("DOM")}}

Thuộc tính **`Element.localName`** là thuộc tính chỉ đọc trả về the
local part of the qualified name of an element.

## Giá trị

Một chuỗi representing the local part of the element's qualified name.

## Ví dụ

(Must be served with XML content type, such as `text/xml` or
`application/xhtml+xml`.)

```xml
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:svg="http://www.w3.org/2000/svg">
<head>
  <script><![CDATA[
function test() {
  const text = document.getElementById("text");
  const circle = document.getElementById("circle");

  text.value = `<svg:circle> has:
localName = "${circle.localName}"
namespaceURI = "${circle.namespaceURI}"`;
}
  ]]></script>
</head>
<body onload="test()">
  <svg:svg version="1.1"
    width="100px" height="100px"
    viewBox="0 0 100 100">
    <svg:circle cx="50" cy="50" r="30" fill="#aaaaaa" id="circle"/>
  </svg:svg>
  <textarea id="text" rows="4" cols="55"/>
</body>
</html>
```

## Notes

The local name of a node is that part of the node's qualified name that comes after the
colon. Qualified names are typically used in XML as part of the namespace(s) of the
particular XML documents. For example, in the qualified name
`comm:partners`, `partners` is the local name and
`comm` is the prefix:

```xml
<comm:business id="soda_shop" type="brick_n_mortar" xmlns:comm="http://example.com/comm">
  <comm:partners>
    <comm:partner id="1001">Tony's Syrup Warehouse
    </comm:partner>
  </comm:partner>
</comm:business>
```

> [!NOTE]
> While the property trả về the case of the internal DOM storage, which is lower case, note that {{domxref("element.tagName","tagName")}} property trả về upper case for HTML elements in HTML DOMs.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.tagName")}}
- {{domxref("Element.namespaceURI")}}
- {{domxref("Element.prefix")}}
- {{domxref("Attr.localName")}}
