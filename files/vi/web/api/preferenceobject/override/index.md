---
title: "PreferenceObject: thuộc tính override"
short-title: override
slug: Web/API/PreferenceObject/override
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PreferenceObject.override
spec-urls: https://drafts.csswg.org/mediaqueries-5/#override-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`override`** của giao diện {{domxref("PreferenceObject")}} trả về giá trị ghi đè của một tùy chọn nếu đã được đặt, hoặc `null` nếu không.

## Giá trị

Giá trị ghi đè của giao diện {{domxref("PreferenceObject")}}, nếu được đặt, hoặc `null` nếu không có giá trị ghi đè nào được đặt.

## Ví dụ

## Sử dụng cơ bản

Ví dụ này minh họa cách phân biệt giữa giao diện màu được đặt bởi user agent và giá trị ghi đè theo chương trình.

```js
if (navigator.preferences.colorScheme.override === null) {
  console.log(
    "The user agent set the following color scheme:",
    navigator.preferences.colorScheme.value,
  );
} else {
  console.log(
    "The following color scheme was set programmatically:",
    navigator.preferences.colorScheme.override,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
