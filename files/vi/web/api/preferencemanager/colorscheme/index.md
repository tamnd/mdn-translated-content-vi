---
title: "PreferenceManager: thuộc tính colorScheme"
short-title: colorScheme
slug: Web/API/PreferenceManager/colorScheme
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceManager.colorScheme
spec-urls: https://drafts.csswg.org/mediaqueries-5/#color-scheme-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`colorScheme`** của giao diện {{domxref("PreferenceManager")}} trả về một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [color scheme](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-color-scheme) của trang web.

Các cài đặt {{domxref("PreferenceObject.value")}} hợp lệ cho `colorScheme` là `dark` và `light`.

## Giá trị

Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [color scheme](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-color-scheme) của trang web.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn color scheme ưu tiên của người dùng.

```js
if (navigator.preferences.colorScheme.value === "dark") {
  // The user prefers a dark color scheme.
} else {
  // The user prefers a light color scheme.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
