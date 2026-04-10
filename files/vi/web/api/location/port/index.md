---
title: "Location: thuộc tính port"
short-title: port
slug: Web/API/Location/port
page-type: web-api-instance-property
browser-compat: api.Location.port
---

{{ApiRef("Location")}}

Thuộc tính **`port`** của giao diện {{domxref("Location")}} là một chuỗi chứa số cổng của URL vị trí. Nếu cổng là mặc định của protocol (`80` cho `ws:` và `http:`, `443` cho `wss:` và `https:`, và `21` cho `ftp:`), thuộc tính này chứa chuỗi rỗng `""`.

Thuộc tính này có thể được đặt để thay đổi cổng của URL. Nếu URL không có {{domxref("Location.host", "host")}} hoặc scheme của nó là `file:`, thì việc đặt thuộc tính này sẽ không có tác dụng. Nó cũng lặng lẽ bỏ qua các số cổng không hợp lệ.

Xem {{domxref("URL.port")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử trang hiện tại ở https://developer.mozilla.org/en-US/docs/Location/port
const result = location.port; // Trả về:''
```

```js
// Giả sử trang khác ở https://developer.mozilla.org:8888/en-US/docs/Location/port
const result = location.port; // Trả về:'8888'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
