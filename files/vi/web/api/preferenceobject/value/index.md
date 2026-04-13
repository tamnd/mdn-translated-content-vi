---
title: "PreferenceObject: thuộc tính value"
short-title: value
slug: Web/API/PreferenceObject/value
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceObject.value
spec-urls: https://drafts.csswg.org/mediaqueries-5/#preference-value-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`value`** của giao diện {{domxref("PreferenceManager")}} trả về giá trị ghi đè của một tùy chọn nếu đã được đặt, hoặc giá trị do UA xác định nếu không có giá trị ghi đè.

## Giá trị

Giá trị ghi đè của giao diện {{domxref("PreferenceObject")}} nếu đã được đặt, hoặc giá trị do UA xác định nếu không.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách truy vấn tùy chọn reduced motion của người dùng.

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
