---
title: "CharacterData: phương thức appendData()"
short-title: appendData()
slug: Web/API/CharacterData/appendData
page-type: web-api-instance-method
browser-compat: api.CharacterData.appendData
---

{{APIRef("DOM")}}

Phương thức **`appendData()`** của giao diện {{domxref("CharacterData")}}
thêm dữ liệu được cung cấp vào cuối dữ liệu hiện tại của nút.

## Cú pháp

```js-nolint
appendData(data)
```

### Tham số

- `data`
  - : Dữ liệu cần nối vào nút hiện tại.

### Giá trị trả về

Không có.

## Ví dụ

```html
<span>Result: </span>A text
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.appendData(" - appended text.");
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.deleteData()")}}, {{domxref("CharacterData.insertData()")}}, {{domxref("CharacterData.replaceData()")}}
- {{domxref("CharacterData.data")}}
