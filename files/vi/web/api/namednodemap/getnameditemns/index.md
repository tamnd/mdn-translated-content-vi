---
title: "NamedNodeMap: phương thức getNamedItemNS()"
short-title: getNamedItemNS()
slug: Web/API/NamedNodeMap/getNamedItemNS
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.getNamedItemNS
---

{{APIRef("DOM")}}

Phương thức **`getNamedItemNS()`** của giao diện {{domxref("NamedNodeMap")}} trả về {{domxref("Attr")}} tương ứng với tên cục bộ đã cho trong không gian tên đã cho, hoặc `null` nếu không có thuộc tính tương ứng.

## Cú pháp

```js-nolint
getNamedItemNS(namespace, localName)
```

### Tham số

- `namespace`
  - : Một chuỗi với URI không gian tên của thuộc tính mong muốn.
    > [!WARNING]
    > `namespace` là URI của không gian tên, không phải tiền tố.
- `localName`
  - : Một chuỗi với localName của thuộc tính mong muốn.

### Giá trị trả về

Một {{domxref("Attr")}} tương ứng với không gian tên và tên cục bộ được truyền vào tham số, hoặc `null` nếu không tìm thấy.

## Ví dụ

```html hidden
<pre></pre>
```

```js
const parser = new DOMParser();
const xmlString =
  '<warning ob:one="test" xmlns:ob="http://www.example.com/ob">Beware!</warning>';
const doc = parser.parseFromString(xmlString, "application/xml");

const pre = document.querySelector("pre");
const warning = doc.querySelector("warning");

const value = warning.attributes.getNamedItemNS(
  "http://www.example.com/ob",
  "one",
).value;

pre.textContent = `The 'ob:one' attribute contains: ${value}.`;
```

{{EmbedLiveSample("Example", "100%", 80)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
