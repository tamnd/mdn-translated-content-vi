---
title: "CharacterData: thuộc tính nextElementSibling"
short-title: nextElementSibling
slug: Web/API/CharacterData/nextElementSibling
page-type: web-api-instance-property
browser-compat: api.CharacterData.nextElementSibling
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`nextElementSibling`** của giao diện {{domxref("CharacterData")}}
trả về nút {{domxref("Element")}} đầu tiên đứng sau nút được chỉ định trong danh sách
phần tử con của nút cha của nó, hoặc `null` nếu phần tử được chỉ định là phần tử cuối cùng trong danh sách.

## Giá trị

Một đối tượng {{domxref("Element")}}, hoặc `null` nếu không tìm thấy nút anh em nào.

## Ví dụ

```html
TEXT
<div id="div-01">Here is div-01</div>
TEXT2
<div id="div-02">Here is div-02</div>
<pre>Here is the result area</pre>
```

```js
// Ban đầu, đặt node thành nút Text chứa `TEXT`
let node = document.getElementById("div-01").previousSibling;

let result = "Next element siblings of TEXT:\n";

while (node) {
  result += `${node.nodeName}\n`;
  node = node.nextElementSibling; // Nút đầu tiên là CharacterData, các nút còn lại là đối tượng Element
}

document.querySelector("pre").textContent = result;
```

{{EmbedLiveSample("Example", "100%", "230")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.previousElementSibling")}}
