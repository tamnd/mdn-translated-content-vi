---
title: "StyleSheet: href property"
short-title: href
slug: Web/API/StyleSheet/href
page-type: web-api-instance-property
browser-compat: api.StyleSheet.href
---

{{APIRef("CSSOM")}}

Thuộc tính **`href`** của giao diện {{domxref("StyleSheet")}} trả về vị trí của bảng định kiểu.

Thuộc tính này là chỉ đọc.

## Giá trị

Một chuỗi chứa URI của bảng định kiểu.

## Ví dụ

Giả sử phần `<head>` chứa như sau:

```html
<link rel="styleSheet" href="example.css" />
```

Sau đó, nếu bạn mở trang HTML qua URL `file://` trên Windows và chạy đoạn script sau:

```js
console.log(document.styleSheets[0].href);
```

Kết quả sẽ trông như: "file:////C:/Windows/Desktop/example.css".

## Ghi chú

Nếu bảng định kiểu là bảng định kiểu liên kết, giá trị thuộc tính của nó là vị trí của nó. Đối với các bảng định kiểu nội tuyến, giá trị của thuộc tính này là `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
