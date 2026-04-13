---
title: "PreferenceObject: phương thức requestOverride()"
short-title: requestOverride()
slug: Web/API/PreferenceObject/requestOverride
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PreferenceObject.requestOverride
spec-urls: https://drafts.csswg.org/mediaqueries-5/#request-override-method
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestOverride`** của giao diện {{domxref("PreferenceObject")}} đặt giá trị {{domxref("PreferenceObject.override" "override")}} cho một tùy chọn cụ thể.

## Cú pháp

```js-nolint
requestOverrides(value)
```

### Tham số

- `value`
  - : Giá trị cần yêu cầu ghi đè.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành {{jsxref("undefined")}} khi thành công, hoặc bị từ chối khi thất bại.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị đã cho không được phép.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau yêu cầu ghi đè {{domxref("PreferenceObject.colorScheme" "colorScheme")}}.

```js
await navigator.preferences.colorScheme.requestOverride("dark");
console.log(navigator.preferences.colorScheme.override);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
