---
title: "TrustedTypePolicyFactory: emptyScript property"
short-title: emptyScript
slug: Web/API/TrustedTypePolicyFactory/emptyScript
page-type: web-api-instance-property
browser-compat: api.TrustedTypePolicyFactory.emptyScript
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`emptyScript`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về một đối tượng {{domxref("TrustedScript")}} chứa chuỗi rỗng.

Đối tượng này có thể được sử dụng khi ứng dụng yêu cầu chèn chuỗi rỗng vào một sink tiêm đang mong đợi đối tượng `TrustedScript`.

## Giá trị

Một đối tượng {{domxref("TrustedScript")}}.

## Ví dụ

[Đặc tả](https://w3c.github.io/trusted-types/dist/spec/#dom-trustedtypepolicyfactory-emptyscript) giải thích rằng đối tượng `emptyScript` có thể được sử dụng để phát hiện hỗ trợ biên dịch mã động.

Các triển khai Trusted Types gốc có thể hỗ trợ `eval(TrustedScript)`, do đó trong ví dụ bên dưới, một triển khai gốc sẽ trả về false cho `eval(trustedTypes.emptyScript)`. Một polyfill sẽ trả về một đối tượng có giá trị đúng.

```js
const supportsTS = !eval(trustedTypes.emptyScript);
eval(supportsTS ? myTrustedScriptObj : myTrustedScriptObj.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
