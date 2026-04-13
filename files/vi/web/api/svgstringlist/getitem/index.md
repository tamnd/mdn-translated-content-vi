---
title: "SVGStringList: getItem() method"
short-title: getItem()
slug: Web/API/SVGStringList/getItem
page-type: web-api-instance-method
browser-compat: api.SVGStringList.getItem
---

{{APIRef("SVG")}}

Phương thức **`getItem()`** của giao diện {{domxref("SVGStringList")}} trả về phần tử được chỉ định từ danh sách. Phần tử được trả về là chính phần tử đó, không phải bản sao. Mọi thay đổi đối với phần tử được phản ánh ngay lập tức trong danh sách. Phần tử đầu tiên có chỉ mục 0.

## Cú pháp

```js-nolint
getItem(index)
```

### Tham số

- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần lấy.

### Giá trị trả về

Chuỗi tại chỉ mục được chỉ định trong danh sách.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGStringList")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
