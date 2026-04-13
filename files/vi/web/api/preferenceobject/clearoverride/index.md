---
title: "PreferenceObject: phương thức clearOverride()"
short-title: clearOverride()
slug: Web/API/PreferenceObject/clearOverride
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PreferenceObject.clearOverride
spec-urls: https://drafts.csswg.org/mediaqueries-5/#clear-override-method
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`clearOverride`** của giao diện {{domxref("PreferenceObject")}} đặt lại giá trị {{domxref("PreferenceObject.override" "override")}}.

## Cú pháp

```js-nolint
clearOverrides()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau xóa giá trị ghi đè của {{domxref("PreferenceObject.colorScheme" "color scheme")}}.

```js
navigator.preferences.colorScheme.clearOverride();
console.log(navigator.preferences.colorScheme.override);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
