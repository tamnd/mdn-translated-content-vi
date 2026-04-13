---
title: UserActivation
slug: Web/API/UserActivation
page-type: web-api-interface
browser-compat: api.UserActivation
---

{{APIRef("HTML DOM")}}

Giao diện **`UserActivation`** cung cấp thông tin về việc người dùng hiện đang tương tác với trang hay không, hoặc đã hoàn thành một tương tác kể từ khi tải trang.

API này chỉ có sẵn trong ngữ cảnh window và không được hiển thị với các worker.

## Thuộc tính phiên bản

- {{domxref("UserActivation.hasBeenActive")}} {{ReadOnlyInline}}
  - : Cho biết liệu cửa sổ hiện tại có kích hoạt người dùng sticky hay không.
- {{domxref("UserActivation.isActive")}} {{ReadOnlyInline}}
  - : Cho biết liệu cửa sổ hiện tại có kích hoạt người dùng tạm thời hay không.

## Mô tả

Một đối tượng của kiểu này được truy cập thông qua thuộc tính {{domxref("navigator.userActivation")}} và có thể được sử dụng để truy vấn thông tin về trạng thái kích hoạt người dùng của cửa sổ.

Kích hoạt người dùng có nghĩa là người dùng hiện đang tương tác với trang, hoặc đã hoàn thành một tương tác kể từ khi tải trang. Kích hoạt người dùng có thể được kích hoạt bằng một cú nhấp nút, chạm con trỏ hoặc một số tương tác người dùng khác với trang.

Có hai loại trạng thái kích hoạt người dùng cửa sổ:

- {{Glossary("Transient activation")}} (người dùng hiện đang tương tác với trang) và
- {{Glossary("Sticky activation")}} (người dùng đã tương tác ít nhất một lần kể từ khi tải trang).

Xem [Các tính năng được kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation) để biết thêm thông tin và danh sách các API yêu cầu kích hoạt người dùng sticky hoặc tạm thời.

## Ví dụ

### Kiểm tra xem một cử chỉ người dùng có được thực hiện gần đây không

Sử dụng {{domxref("navigator.userActivation")}} để truy cập đối tượng `UserActivation`, sau đó dùng {{domxref("UserActivation.isActive")}} để kiểm tra xem người dùng có đang tương tác với trang không ({{Glossary("Transient activation")}}).

```js
if (navigator.userActivation.isActive) {
  // proceed to request playing media, for example
}
```

### Kiểm tra xem một cử chỉ người dùng đã từng được thực hiện chưa

Sử dụng {{domxref("UserActivation.hasBeenActive")}} để kiểm tra xem người dùng có từng tương tác với trang không ({{Glossary("Sticky activation")}}).

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

- {{domxref("navigator.userActivation")}}
- [Các tính năng được kiểm soát bởi kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation)
