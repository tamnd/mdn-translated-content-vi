---
title: "CharacterData: thuộc tính previousElementSibling"
short-title: previousElementSibling
slug: Web/API/CharacterData/previousElementSibling
page-type: web-api-instance-property
browser-compat: api.CharacterData.previousElementSibling
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`previousElementSibling`** của giao diện {{domxref("CharacterData")}}
trả về nút {{domxref("Element")}} đầu tiên đứng trước nút hiện tại trong danh sách phần tử con của nút cha của nó,
hoặc `null` nếu không có.

## Giá trị

Một đối tượng {{domxref("Element")}}, hoặc `null` nếu không tìm thấy nút anh em nào.

## Ví dụ

```html
<div id="div-01">Here is div-01</div>
TEXT
<div id="div-02">Here is div-02</div>
SOME TEXT
<div id="div-03">Here is div-03</div>
<pre>Result</pre>
```

```js
// Ban đầu đặt node thành nút Text chứa `SOME TEXT`
let node = document.getElementById("div-02").nextSibling;

let result = "Previous element siblings of SOME TEXT:\n";

while (node) {
  result += `${node.nodeName}\n`;
  node = node.previousElementSibling;
}

document.querySelector("pre").textContent = result;
```

{{EmbedLiveSample("Example", "100%", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.nextElementSibling")}}
