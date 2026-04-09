---
title: "CharacterData: thuộc tính length"
short-title: length
slug: Web/API/CharacterData/length
page-type: web-api-instance-property
browser-compat: api.CharacterData.length
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`CharacterData.length`**
trả về số lượng ký tự trong dữ liệu được chứa, dưới dạng một số nguyên dương.

## Giá trị

Một số nguyên dương là độ dài của chuỗi {{domxref("CharacterData.data")}}.

## Ví dụ

> [!NOTE]
> {{domxref("CharacterData")}} là một giao diện trừu tượng.
> Các ví dụ dưới đây sử dụng {{domxref("Text")}}, một giao diện cụ thể hiện thực nó.

```html
Length of the string in the <code>Text</code> node: <output></output>
```

```js
const output = document.querySelector("output");
const textNode = new Text("This text has been set using 'textNode.data'.");

output.value = textNode.length;
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
