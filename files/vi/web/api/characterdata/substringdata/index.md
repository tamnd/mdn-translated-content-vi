---
title: "CharacterData: phương thức substringData()"
short-title: substringData()
slug: Web/API/CharacterData/substringData
page-type: web-api-instance-method
browser-compat: api.CharacterData.substringData
---

{{APIRef("DOM")}}

Phương thức **`substringData()`** của giao diện {{domxref("CharacterData")}}
trả về một phần của dữ liệu hiện có,
bắt đầu tại chỉ mục được chỉ định
và kéo dài thêm một số lượng ký tự xác định sau đó.

## Cú pháp

```js-nolint
substringData(offset, count)
```

### Tham số

- `offset`
  - : Chỉ mục của ký tự đầu tiên cần đưa vào chuỗi con trả về.
    `0` là ký tự đầu tiên của chuỗi.
- `count`
  - : Số ký tự cần trả về.

### Giá trị trả về

Một chuỗi chứa chuỗi con.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `offset` + `count` lớn hơn độ dài của dữ liệu được chứa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
