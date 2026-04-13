---
title: "NamedNodeMap: phương thức removeNamedItemNS()"
short-title: removeNamedItemNS()
slug: Web/API/NamedNodeMap/removeNamedItemNS
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.removeNamedItemNS
---

{{APIRef("DOM")}}

Phương thức **`removeNamedItemNS()`** của giao diện {{domxref("NamedNodeMap")}} xóa {{domxref("Attr")}} tương ứng với không gian tên và tên cục bộ đã cho khỏi map.

## Cú pháp

```js-nolint
removeNamedItemNS(namespace, localName)
```

### Tham số

- `namespace`
  - : Không gian tên của thuộc tính cần xóa khỏi map.
    > [!WARNING]
    > `namespace` là URI của không gian tên, không phải tiền tố.

- `localName`
  - : Tên cục bộ của thuộc tính cần xóa khỏi map.

### Giá trị trả về

{{domxref("Attr")}} đã bị xóa.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không có thuộc tính nào với không gian tên và tên cục bộ đã cho.

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
const attrMap = warning.attributes;

let result = `The 'ob:one' attribute initially contains '${attrMap["ob:one"].value}'.\n`;

result += "We remove it.\n\n";
attrMap.removeNamedItemNS("http://www.example.com/ob", "one");

result += attrMap["ob:one"]
  ? "And 'ob:one' still exists."
  : "And 'ob:one' is no more to be found.";

pre.textContent = result;
```

{{EmbedLiveSample("Example", "100%", 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
