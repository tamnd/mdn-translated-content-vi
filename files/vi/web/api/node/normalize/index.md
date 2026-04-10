---
title: "Node: phương thức normalize()"
short-title: normalize()
slug: Web/API/Node/normalize
page-type: web-api-instance-method
browser-compat: api.Node.normalize
---

{{APIRef("DOM")}}

Phương thức **`normalize()`** của giao diện {{domxref("Node")}} đưa nút đã chỉ định và toàn bộ cây con của nó vào dạng _chuẩn hóa_. Trong một cây con đã chuẩn hóa, không có nút văn bản nào là rỗng và không có các nút văn bản liền kề nhau.

## Cú pháp

```js-nolint
normalize()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

## Ví dụ

```html
<output id="result"></output>
```

```js
const wrapper = document.createElement("div");

wrapper.appendChild(document.createTextNode("Part 1 "));
wrapper.appendChild(document.createTextNode("Part 2 "));

let node = wrapper.firstChild;
let result = "Trước khi chuẩn hóa:\n";
while (node) {
  result += ` ${node.nodeName}: ${node.nodeValue}\n`;
  node = node.nextSibling;
}

wrapper.normalize();

node = wrapper.firstChild;
result += "\n\nSau khi chuẩn hóa:\n";
while (node) {
  result += ` ${node.nodeName}: ${node.nodeValue}\n`;
  node = node.nextSibling;
}

const output = document.getElementById("result");
output.innerText = result;
```

{{ EmbedLiveSample("Example", "100%", "170")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Text.splitText()")}}, đối nghĩa của nó.
