---
title: "CharacterData: phương thức insertData()"
short-title: insertData()
slug: Web/API/CharacterData/insertData
page-type: web-api-instance-method
browser-compat: api.CharacterData.insertData
---

{{APIRef("DOM")}}

Phương thức **`insertData()`** của giao diện {{domxref("CharacterData")}}
chèn dữ liệu được cung cấp vào dữ liệu hiện tại của nút `CharacterData` này,
tại vị trí bù được cung cấp tính từ đầu dữ liệu hiện có.
Dữ liệu được cung cấp sẽ được ghép xen vào dữ liệu hiện có.

## Cú pháp

```js-nolint
insertData(offset, data)
```

### Tham số

- `offset`
  - : Vị trí bù theo số ký tự để chèn dữ liệu được cung cấp.
    `0` là ký tự đầu tiên của chuỗi.
- `data`
  - : Dữ liệu cần chèn.

### Giá trị trả về

Không có.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `offset` là số âm hoặc lớn hơn độ dài của dữ liệu được chứa.

## Ví dụ

```html
<span>Result: </span>A string.
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.insertData(2, "long ");
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.appendData()")}}, {{domxref("CharacterData.deleteData()")}}, {{domxref("CharacterData.replaceData()")}}
- {{domxref("CharacterData.data")}}
