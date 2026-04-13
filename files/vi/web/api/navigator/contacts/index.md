---
title: "Navigator: thuộc tính contacts"
short-title: contacts
slug: Web/API/Navigator/contacts
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.contacts
---

{{APIRef("Contact Picker API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`contacts`** của
Giao diện {{domxref("Navigator")}} trả về giao diện {{domxref('ContactsManager')}}
cho phép người dùng chọn các mục từ danh sách liên hệ của họ và chia sẻ thông tin chi tiết hạn chế
của các mục đã chọn với một trang web hoặc ứng dụng.

## Giá trị

Đối tượng {{domxref('ContactsManager')}}. Hai cuộc gọi liên tiếp trả về cùng một đối tượng.

## Ví dụ

Đoạn mã sau đây kiểm tra xem API Bộ chọn liên hệ có được hỗ trợ hay không.

```js
const supported = "contacts" in navigator && "ContactsManager" in window;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [A Contact Picker for the Web](https://developer.chrome.com/docs/capabilities/web-apis/contact-picker)
- [Contact Picker API live demo](https://mdn.github.io/dom-examples/contact-picker/)
