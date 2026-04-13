---
title: "MediaList: phương thức item()"
short-title: item()
slug: Web/API/MediaList/item
page-type: web-api-instance-method
browser-compat: api.MediaList.item
---

{{ APIRef("CSSOM") }}

Phương thức **`item()`** của giao diện {{domxref("MediaList")}} trả về media query tại `index` được chỉ định, hoặc `null` nếu `index` được chỉ định không tồn tại.

## Cú pháp

```js-nolint
item(index)
[index]
```

> [!NOTE]
> Có thể sử dụng cú pháp dấu ngoặc (`[]`) thay cho cú pháp `item()`.

### Tham số

- `index`
  - : Một số nguyên.

### Giá trị trả về

Nếu cú pháp dấu ngoặc (`[]`) được sử dụng và không có mục nào cho chỉ mục đã cho, `undefined` được trả về.

## Ví dụ

Ví dụ sau sẽ ghi vào console từng media query được lưu trong `MediaList` liên quan đến stylesheet đầu tiên được áp dụng cho tài liệu hiện tại.

```js
const stylesheet = document.styleSheets[0];
console.log(stylesheet.media.length);
console.log(stylesheet.media.item(0)); // Returns a string like "print"
console.log(stylesheet.media.item(5)); // Returns null if there is no 5th entry
console.log(stylesheet.media[1]); // Returns a string like "print"
console.log(stylesheet.media[5]); // Returns undefined if there is no 5th entry
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
