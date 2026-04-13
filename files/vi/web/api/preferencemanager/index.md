---
title: PreferenceManager
slug: Web/API/PreferenceManager
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PreferenceManager
spec-urls: https://drafts.csswg.org/mediaqueries-5/#preference-manager
---

{{APIRef("User Preferences API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`PreferenceManager`** của [User Preferences API](/en-US/docs/Web/API/User_Preferences_API) cung cấp quyền truy cập vào các đối tượng {{domxref("PreferenceObject")}} dùng để truy vấn và sửa đổi tùy chọn người dùng.

`PreferenceManager` cho tài liệu hiện tại có thể được truy cập thông qua thuộc tính {{domxref("Navigator.preferences")}}.

Giao diện `PreferenceManager` kế thừa từ {{domxref("EventTarget")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PreferenceManager.colorScheme")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [color scheme](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-color-scheme) của trang web.
- {{domxref("PreferenceManager.contrast")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ tương phản](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-contrast) của trang web.
- {{domxref("PreferenceManager.reducedMotion")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [chuyển động giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-motion) của trang web.
- {{domxref("PreferenceManager.reducedTransparency")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [độ trong suốt giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-transparency) của trang web.
- {{domxref("PreferenceManager.reducedData")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("PreferenceObject")}} dùng để ghi đè tùy chọn của người dùng về [dữ liệu giảm](/en-US/docs/Web/CSS/Reference/Reference/At-rules/@media/prefers-reduced-data) của trang web.

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
