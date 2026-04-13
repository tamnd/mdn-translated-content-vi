---
title: "PreferenceObject: thuộc tính validValues"
short-title: validValues
slug: Web/API/PreferenceObject/validValues
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PreferenceObject.validValues
spec-urls: https://drafts.csswg.org/mediaqueries-5/#valid-values-attribute
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`validValues`** của giao diện {{domxref("PreferenceObject")}} trả về một mảng chỉ đọc các giá trị được chấp nhận bởi phần ghi đè.

## validValues

Một mảng chứa các giá trị hợp lệ để ghi đè giá trị {{domxref("PreferenceObject")}}.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách ghi lại tất cả các giá trị độ tương phản có thể.

```js
console.log(navigator.preferences.contrast.validValues);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
