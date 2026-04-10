---
title: "Location: thuộc tính protocol"
short-title: protocol
slug: Web/API/Location/protocol
page-type: web-api-instance-property
browser-compat: api.Location.protocol
---

{{ApiRef("Location")}}

Thuộc tính **`protocol`** của giao diện {{domxref("Location")}} là một chuỗi chứa protocol hoặc scheme của URL vị trí, bao gồm cả dấu `":"` cuối cùng.

Thuộc tính này có thể được đặt để thay đổi protocol của URL. Một dấu `":"` sẽ được thêm vào chuỗi được cung cấp nếu chưa có. Scheme được cung cấp phải tương thích với phần còn lại của URL thì mới được xem là hợp lệ.

Xem {{domxref("URL.protocol")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử có một phần tử <a id="myAnchor" href="https://developer.mozilla.org/en-US/Location.protocol"> trong tài liệu
const anchor = document.getElementById("myAnchor");
const result = anchor.protocol; // Trả về:'https:'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
