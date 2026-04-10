---
title: "Range: phương thức cloneRange()"
short-title: cloneRange()
slug: Web/API/Range/cloneRange
page-type: web-api-instance-method
browser-compat: api.Range.cloneRange
---

{{APIRef("DOM")}}

Phương thức **`Range.cloneRange()`** trả về một đối tượng {{domxref("Range")}} có các điểm biên giống hệt `Range` được sao chép.

Bản sao trả về được sao chép theo giá trị, không phải theo tham chiếu, nên thay đổi ở một `Range` sẽ không ảnh hưởng đến `Range` kia.

## Cú pháp

```js-nolint
cloneRange()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("Range")}}.

## Ví dụ

```js
const range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
const clone = range.cloneRange();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
