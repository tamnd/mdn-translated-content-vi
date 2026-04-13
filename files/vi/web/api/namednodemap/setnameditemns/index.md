---
title: "NamedNodeMap: phương thức setNamedItemNS()"
short-title: setNamedItemNS()
slug: Web/API/NamedNodeMap/setNamedItemNS
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.setNamedItemNS
---

{{APIRef("DOM")}}

Phương thức **`setNamedItemNS()`** của giao diện {{domxref("NamedNodeMap")}} đặt {{domxref("Attr")}} được xác định bởi tên của nó vào map. Nếu đã có một {{domxref("Attr")}} với tên tương tự trong map, nó sẽ bị _thay thế_.

> [!NOTE]
> Phương thức này là bí danh của `setNamedItem()`, bạn có thể sử dụng chúng thay thế cho nhau.

## Cú pháp

```js-nolint
setNamedItemNS(attr)
```

### Tham số

- `attr`
  - : Thuộc tính cần chèn vào map.

### Giá trị trả về

Trả về thuộc tính cũ nếu được thay thế, hoặc `null` nếu thuộc tính là mới.

### Ngoại lệ

- `InUseAttributeError` {{domxref("DOMException")}}
  - : Được ném nếu thuộc tính vẫn là một phần của map khác.

## Ví dụ

```html
<span ob:one="one"></span>
<pre></pre>
```

```js
const parser = new DOMParser();
// ob:one in <span> is not in a namespace, while ob:one in <warning>, is.
const xmlString =
  '<warning ob:one="test" xmlns:ob="http://www.example.com/ob">Beware!</warning>';
const doc = parser.parseFromString(xmlString, "application/xml");

const span = document.querySelector("span");
const pre = document.querySelector("pre");
const warning = doc.querySelector("warning");
const attrMap = span.attributes;

let result = `The '<span>' element initially contains ${attrMap.length} attribute.\n\n`;

result += "We remove `one` from '<span>' and adds it to '<pre>'.\n";
const one = warning.attributes.removeNamedItemNS(
  "http://www.example.com/ob",
  "one",
);
attrMap.setNamedItemNS(one);
result += `The '<span>' element now contains ${span.attributes.length} attributes:\n\n`;
result += "Prefix\tLocal name\tQualified name\n";
result += "=========================================\n";

for (const attr of attrMap) {
  result += `${attr.prefix}\t${attr.localName}\t\t${attr.name}\n`;
}

pre.textContent = result;
```

{{EmbedLiveSample("Example", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
