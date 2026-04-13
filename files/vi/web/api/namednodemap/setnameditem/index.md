---
title: "NamedNodeMap: phương thức setNamedItem()"
short-title: setNamedItem()
slug: Web/API/NamedNodeMap/setNamedItem
page-type: web-api-instance-method
browser-compat: api.NamedNodeMap.setNamedItem
---

{{APIRef("DOM")}}

Phương thức **`setNamedItem()`** của giao diện {{domxref("NamedNodeMap")}} đặt {{domxref("Attr")}} được xác định bởi tên của nó vào map. Nếu đã có một {{domxref("Attr")}} với tên tương tự trong map, nó sẽ bị _thay thế_.

## Cú pháp

```js-nolint
setNamedItem(attr)
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
<span class="foo" id="bar"></span>
<pre contenteditable></pre>
```

```js
const span = document.querySelector("span");
const pre = document.querySelector("pre");

let result = `The \`<pre>\` element initially contains ${pre.attributes.length} attributes.\n\n`;

result += "We remove `class` from `<span>` and add it to `<pre>`.\n";
const classAttribute = span.attributes.removeNamedItem("class");
pre.attributes.setNamedItem(classAttribute);
result += `The \`<pre>\` element now contains ${pre.attributes.length} attributes.\n\n`;

result += "We get `id` from `<span>` and try to add it to `<pre>`.\n";
const id = span.attributes.getNamedItem("id");
try {
  pre.attributes.setNamedItem(id);
} catch (error) {
  result += `An exception has been raised: ${error.name}: ${error.message}.\n`;
}

pre.textContent = result;
```

{{EmbedLiveSample("Example", "100%", 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
