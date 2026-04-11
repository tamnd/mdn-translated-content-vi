---
title: "HTMLSelectElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLSelectElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.type
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`HTMLSelectElement.type`** trả về `type` của điều khiển biểu mẫu.

## Giá trị

Một trong các giá trị sau:

- `"select-multiple"` nếu có thể chọn nhiều giá trị.
- `"select-one"` nếu chỉ có thể chọn một giá trị.

## Ví dụ

```js
switch (select.type) {
  case "select-multiple":
    // Multiple values may be selected
    break;
  case "select-one":
    // Only one value may be selected
    break;
  default:
  // Non-standard value (or this isn't a SELECT element)
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("select")}} triển khai giao diện này.
