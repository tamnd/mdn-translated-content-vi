---
title: "CharacterData: phương thức replaceData()"
short-title: replaceData()
slug: Web/API/CharacterData/replaceData
page-type: web-api-instance-method
browser-compat: api.CharacterData.replaceData
---

{{APIRef("DOM")}}

Phương thức **`replaceData()`** của giao diện {{domxref("CharacterData")}} xóa một số lượng ký tự nhất định trong văn bản hiện có của một nút `CharacterData` nhất định và thay thế các ký tự đó bằng văn bản được cung cấp.

## Cú pháp

```js-nolint
replaceData(offset, count, data)
```

### Tham số

- `offset`
  - : Số ký tự tính từ đầu dữ liệu để bắt đầu chèn.
    `0` là ký tự đầu tiên của chuỗi.
- `count`
  - : Số ký tự cần được thay thế bằng dữ liệu được cung cấp.
- `data`
  - : Dữ liệu cần chèn.

### Giá trị trả về

Không có.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `offset` hoặc `count` là số âm, hoặc `offset` lớn hơn độ dài của dữ liệu được chứa.

## Ví dụ

```html
<span>Result: </span>A long string.
```

```js
const span = document.querySelector("span");
const textNode = span.nextSibling;

textNode.replaceData(2, 4, "replaced");
```

{{EmbedLiveSample("Example", "100%", 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.appendData()")}}
- {{domxref("CharacterData.deleteData()")}}
- {{domxref("CharacterData.insertData()")}}
- {{domxref("CharacterData.data")}}
