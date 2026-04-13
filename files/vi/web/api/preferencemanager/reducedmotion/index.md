---
title: "PreferenceManager: thuộc tính reducedMotion"
short-title: reducedMotion
slug: Web/API/PreferenceManager/reducedMotion
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceManager.reducedMotion
spec-urls: https://drafts.csswg.org/mediaqueries-5/#reduced-motion-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`reducedMotion`** của giao diện {{domxref("PreferenceManager")}} trả về {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [chuyển động giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-motion) của trang web.

Các cài đặt {{domxref("PreferenceObject.value")}} hợp lệ cho `reducedMotion` là `reduce` và `no-preference`.

## Giá trị

Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [chuyển động giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-motion) của trang web.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn tùy chọn chuyển động giảm của người dùng.

```js
if (navigator.preferences.reducedMotion.value === "reduce") {
  // The user prefers reduced motion.
} else {
  // The user has stated no preference regarding motion.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
