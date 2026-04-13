---
title: "PreferenceManager: thuộc tính reducedData"
short-title: reducedData
slug: Web/API/PreferenceManager/reducedData
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceManager.reducedData
spec-urls: https://drafts.csswg.org/mediaqueries-5/#reduced-data-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`reducedData`** của giao diện {{domxref("PreferenceManager")}} trả về một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [dữ liệu giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-data) của trang web.

Các cài đặt {{domxref("PreferenceObject.value")}} hợp lệ cho `reducedData` là `reduce` và `no-preference`.

## Giá trị

Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [dữ liệu giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-data) của trang web.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn tùy chọn dữ liệu giảm của người dùng.

```js
if (navigator.preferences.reducedData.value === "reduce") {
  // The user prefers you use less data.
} else {
  // The user has stated no preference regarding data use.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
