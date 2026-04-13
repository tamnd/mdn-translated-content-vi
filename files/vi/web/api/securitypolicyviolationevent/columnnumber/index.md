---
title: "SecurityPolicyViolationEvent: columnNumber property"
short-title: columnNumber
slug: Web/API/SecurityPolicyViolationEvent/columnNumber
page-type: web-api-instance-property
browser-compat: api.SecurityPolicyViolationEvent.columnNumber
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`columnNumber`** của giao diện {{domxref("SecurityPolicyViolationEvent")}} là vị trí ký tự trong dòng mã nguồn của tài liệu hoặc script worker mà tại đó vi phạm [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) xảy ra.

Thuộc tính này được dùng cùng với {{domxref("SecurityPolicyViolationEvent.sourceFile")}} và {{domxref("SecurityPolicyViolationEvent.lineNumber")}}, chúng cùng nhau cung cấp vị trí chính xác trong mã nguồn gây ra vi phạm.

## Giá trị

Một số biểu diễn số vị trí ký tự nơi vi phạm xảy ra.

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.columnNumber);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSPViolationReport.columnNumber")}}
