---
title: "Navigator: thuộc tính userActivation"
short-title: userActivation
slug: Web/API/Navigator/userActivation
page-type: web-api-instance-property
browser-compat: api.Navigator.userActivation
---

{{APIRef("HTML DOM")}}

Thuộc tính **`userActivation`** chỉ đọc của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("UserActivation")}} chứa thông tin về trạng thái kích hoạt người dùng của cửa sổ hiện tại.

## Giá trị

Đối tượng {{domxref("UserActivation")}}.

## Ví dụ

### Kiểm tra xem cử chỉ của người dùng có được thực hiện gần đây không

Sử dụng {{domxref("UserActivation.isActive")}} để kiểm tra xem người dùng hiện có tương tác với trang hay không ({{Glossary("Transient activation")}}).

```js
if (navigator.userActivation.isActive) {
  // proceed to request playing media, for example
}
```

### Kiểm tra xem cử chỉ của người dùng đã từng được thực hiện chưa

Sử dụng {{domxref("UserActivation.hasBeenActive")}} để kiểm tra xem người dùng đã từng tương tác với trang chưa ({{Glossary("Sticky activation")}}).

```js
if (navigator.userActivation.hasBeenActive) {
  // proceed with auto-playing an animation, for example
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("UserActivation")}}
- {{domxref("UserActivation.hasBeenActive")}}
- {{domxref("UserActivation.isActive")}}
- [Features gated by user activation](/en-US/docs/Web/Security/Defenses/User_activation)
