---
title: "CharacterData: phương thức deleteData()"
short-title: deleteData()
slug: Web/API/CharacterData/deleteData
page-type: web-api-instance-method
browser-compat: api.CharacterData.deleteData
---

{{APIRef("DOM")}}

Phương thức **`deleteData()`** của giao diện {{domxref("CharacterData")}}
xóa toàn bộ hoặc một phần dữ liệu khỏi nút `CharacterData` này.

## Cú pháp

```js-nolint
deleteData(offset, count)
```

### Tham số

- `offset`
  - : Số byte tính từ đầu dữ liệu để bắt đầu xóa.
    `0` là ký tự đầu tiên của chuỗi.
- `count`
  - : Số byte cần xóa.

### Giá trị trả về

Không có.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `offset` lớn hơn độ dài của dữ liệu được chứa.

## Ví dụ

```html
<span>Result: </span>A long string.
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.deleteData(1, 5);
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.appendData()")}}, {{domxref("CharacterData.insertData()")}}, {{domxref("CharacterData.replaceData()")}}
- {{domxref("CharacterData.data")}}
