---
title: "UserActivation: thuộc tính hasBeenActive"
short-title: hasBeenActive
slug: Web/API/UserActivation/hasBeenActive
page-type: web-api-instance-property
browser-compat: api.UserActivation.hasBeenActive
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`hasBeenActive`** của giao diện {{domxref("UserActivation")}} cho biết liệu cửa sổ hiện tại có {{Glossary("sticky activation","kích hoạt người dùng sticky")}} hay không.

## Giá trị

Một giá trị boolean.

## Ví dụ

### Kiểm tra xem một cử chỉ người dùng đã từng được thực hiện chưa

Sử dụng thuộc tính `hasBeenActive` để kiểm tra xem người dùng có tương tác với trang kể từ khi nó được tải hay không.

```js
if (navigator.userActivation.hasBeenActive) {
  // proceed with auto-playing an animation, for example
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("UserActivation")}}
- {{domxref("UserActivation.isActive")}}
- [Các tính năng được kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation)
