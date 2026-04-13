---
title: "SVGLengthList: getItem() method"
short-title: getItem()
slug: Web/API/SVGLengthList/getItem
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.getItem
---

{{APIRef("SVG")}}

Phương thức **`getItem()`** của giao diện {{domxref("SVGLengthList")}} trả về phần tử được chỉ định từ danh sách. Phần tử được trả về là chính phần tử đó, không phải bản sao. Mọi thay đổi đối với phần tử được phản ánh ngay lập tức trong danh sách. Phần tử đầu tiên có chỉ mục 0.

## Cú pháp

```js-nolint
getItem(index)
```

### Tham số

- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần lấy.

### Giá trị trả về

{{domxref("SVGLength")}} tại chỉ mục được chỉ định trong danh sách.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra khi chỉ mục nằm ngoài phạm vi của danh sách.

## Ví dụ

Xem {{domxref("SVGLengthList")}} để xem ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
