---
title: "PreferenceManager: thuộc tính reducedTransparency"
short-title: reducedTransparency
slug: Web/API/PreferenceManager/reducedTransparency
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceManager.reducedTransparency
spec-urls: https://drafts.csswg.org/mediaqueries-5/#reduced-transparency-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`reducedTransparency`** của giao diện {{domxref("PreferenceManager")}} trả về {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ trong suốt giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-transparency) của trang web.

Các cài đặt {{domxref("PreferenceObject.value")}} hợp lệ cho `reducedTransparency` là `reduce` và `no-preference`.

## Giá trị

Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ trong suốt giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-transparency) của trang web.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn tùy chọn độ trong suốt giảm của người dùng.

```js
if (navigator.preferences.reducedTransparency.value === "reduce") {
  // The user prefers reduced transparency.
} else {
  // The user has stated no preference regarding transparency.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
