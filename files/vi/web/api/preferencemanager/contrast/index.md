---
title: "PreferenceManager: thuộc tính contrast"
short-title: contrast
slug: Web/API/PreferenceManager/contrast
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceManager.contrast
spec-urls: https://drafts.csswg.org/mediaqueries-5/#contrast-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`contrast`** của giao diện {{domxref("PreferenceManager")}} trả về một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ tương phản](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-contrast) của trang web.

Các cài đặt {{domxref("PreferenceObject.value")}} hợp lệ cho `contrast` là `more`, `less` và `no-preference`.

## Giá trị

Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ tương phản](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-contrast) của trang web.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn tùy chọn độ tương phản của người dùng.

```js
if (navigator.preferences.contrast.value === "more") {
  // The user prefers a high color contrast.
} else if (navigator.preferences.contrast.value === "less") {
  // The user prefers a low color contrast.
} else {
  // The user has stated no preference regarding color contrast.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
