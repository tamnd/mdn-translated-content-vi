---
title: "URL: thuộc tính hash"
short-title: hash
slug: Web/API/URL/hash
page-type: web-api-instance-property
browser-compat: api.URL.hash
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`hash`** của giao diện {{domxref("URL")}} là một chuỗi chứa `"#"` theo sau là định danh phân mảnh của URL. Nếu URL không có định danh phân mảnh, thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi định danh phân mảnh của URL. Khi đặt, một tiền tố `"#"` duy nhất sẽ được thêm vào giá trị được cung cấp nếu nó chưa có sẵn. Đặt nó thành `""` sẽ xóa định danh phân mảnh.

Fragment được {{Glossary("Percent-encoding", "mã hóa phần trăm")}} khi đặt nhưng không được giải mã phần trăm khi đọc.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/href#examples",
);
console.log(url.hash); // '#examples'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
