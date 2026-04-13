---
title: "NamedNodeMap: phương thức removeNamedItem()"
short-title: removeNamedItem()
slug: Web/API/NamedNodeMap/removeNamedItem
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.removeNamedItem
---

{{APIRef("DOM")}}

Phương thức **`removeNamedItem()`** của giao diện {{domxref("NamedNodeMap")}} xóa {{domxref("Attr")}} tương ứng với tên đã cho khỏi map.

## Cú pháp

```js-nolint
removeNamedItem(attrName)
```

### Tham số

- `attrName`
  - : Tên của thuộc tính cần xóa khỏi map.

### Giá trị trả về

{{domxref("Attr")}} đã bị xóa.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không có thuộc tính nào với tên đã cho.

## Ví dụ

```html
<pre test="testValue"></pre>
```

```js
const pre = document.querySelector("pre");
const attrMap = pre.attributes;

let result = `The 'test' attribute initially contains '${attrMap["test"].value}'.\n`;

result += "We remove it.\n\n";
attrMap.removeNamedItem("test");

result += attrMap.getNamedItem("test")
  ? "And 'test' still exists."
  : "And 'test' is no more to be found.";

pre.textContent = result;
```

{{EmbedLiveSample("Example", "100%", 120)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
