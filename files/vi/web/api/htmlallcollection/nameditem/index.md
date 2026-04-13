---
title: "HTMLAllCollection: namedItem() method"
short-title: namedItem()
slug: Web/API/HTMLAllCollection/namedItem
page-type: web-api-instance-method
browser-compat: api.HTMLAllCollection.namedItem
---

{{APIRef("DOM")}}

Phương thức **`namedItem()`** của giao diện {{domxref("HTMLAllCollection")}} trả về {{domxref("Element")}} đầu tiên trong tập hợp có thuộc tính `id` hoặc `name` khớp với tên được chỉ định, hoặc `null` nếu không có phần tử nào khớp.

## Cú pháp

```js-nolint
namedItem(name)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho giá trị của thuộc tính `id` hoặc `name` của phần tử cần tìm.

### Giá trị trả về

{{domxref("Element")}} đầu tiên trong {{domxref("HTMLAllCollection")}} khớp với `name`, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
