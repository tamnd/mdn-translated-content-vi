---
title: "TrustedTypePolicyFactory: defaultPolicy property"
short-title: defaultPolicy
slug: Web/API/TrustedTypePolicyFactory/defaultPolicy
page-type: web-api-instance-property
browser-compat: api.TrustedTypePolicyFactory.defaultPolicy
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`defaultPolicy`** của giao diện {{domxref("TrustedTypePolicyFactory")}} trả về {{domxref("TrustedTypePolicy")}} mặc định hoặc null nếu chưa được đặt.

Xem [Chính sách mặc định](/en-US/docs/Web/API/Trusted_Types_API#the_default_policy) để biết thêm chi tiết.

## Giá trị

Một {{domxref("TrustedTypePolicy")}} hoặc `null`.

## Ví dụ

Dòng đầu tiên bên dưới trả về `null` vì chưa có chính sách mặc định nào được tạo. Sau khi chính sách mặc định được tạo, việc gọi `defaultPolicy` trả về đối tượng chính sách đó.

```js
console.log(trustedTypes.defaultPolicy); // null
const dp = trustedTypes.createPolicy("default", {});
console.log(trustedTypes.defaultPolicy); // a TrustedTypePolicy object
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
