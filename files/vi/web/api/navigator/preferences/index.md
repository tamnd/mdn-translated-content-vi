---
title: "Navigator: thuộc tính preferences"
short-title: preferences
slug: Web/API/Navigator/preferences
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.preferences
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`preferences`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("PreferenceManager")}} cho tài liệu hiện tại. Đây là điểm vào cho chức năng [User Preferences API](/en-US/docs/Web/API/User_Preferences_API).

## Giá trị

Đối tượng {{domxref('PreferenceManager')}}.

## Ví dụ

### Nhận tùy chọn bảng màu

Ví dụ này trình bày cách truy vấn bảng màu ưa thích của người dùng.

```js
if (navigator.preferences.colorScheme.value === "dark") {
  // The user prefers a dark color scheme.
} else {
  // The user prefers a light color scheme.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [User Preferences API](/en-US/docs/Web/API/User_Preferences_API)
