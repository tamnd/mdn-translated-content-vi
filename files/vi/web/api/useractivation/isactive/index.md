---
title: "UserActivation: thuộc tính isActive"
short-title: isActive
slug: Web/API/UserActivation/isActive
page-type: web-api-instance-property
browser-compat: api.UserActivation.isActive
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`isActive`** của giao diện {{domxref("UserActivation")}} cho biết liệu cửa sổ hiện tại có {{Glossary("transient activation", "kích hoạt người dùng tạm thời")}} hay không.

## Giá trị

Một giá trị boolean.

## Ví dụ

### Kiểm tra xem một cử chỉ người dùng có được thực hiện gần đây không

Sử dụng thuộc tính `isActive` để kiểm tra xem người dùng có đang tương tác với trang hay không.

```js
if (navigator.userActivation.isActive) {
  // proceed to request playing media, for example
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("UserActivation")}}
- {{domxref("UserActivation.hasBeenActive")}}
- [Các tính năng được kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation)
