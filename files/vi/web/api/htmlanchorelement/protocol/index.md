---
title: "HTMLAnchorElement: thuộc tính protocol"
short-title: protocol
slug: Web/API/HTMLAnchorElement/protocol
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.protocol
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`protocol`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa giao thức hoặc lược đồ của `href` thuộc phần tử `<area>`, bao gồm cả `":"` ở cuối.

Thuộc tính này có thể được đặt để thay đổi giao thức của URL. Một `":"` được thêm vào cuối chuỗi được cung cấp nếu chưa có. Lược đồ được cung cấp phải tương thích với phần còn lại của URL để được coi là hợp lệ.

Xem {{domxref("URL.protocol")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Lấy giao thức của một liên kết neo

```js
// Một phần tử <a id="myAnchor" href="https://developer.mozilla.org/en-US/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.protocol; // trả về 'https:'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
