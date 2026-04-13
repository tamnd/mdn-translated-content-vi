---
title: SecurityPolicyViolationEvent
slug: Web/API/SecurityPolicyViolationEvent
page-type: web-api-interface
browser-compat: api.SecurityPolicyViolationEvent
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Giao diện **`SecurityPolicyViolationEvent`** kế thừa từ {{domxref("Event")}}, và biểu diễn đối tượng sự kiện của sự kiện `securitypolicyviolation` được gửi trên {{domxref("Element/securitypolicyviolation_event", "Element")}}, {{domxref("Document/securitypolicyviolation_event", "Document")}}, hoặc {{domxref("WorkerGlobalScope/securitypolicyviolation_event", "worker","","nocode")}} khi [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) của nó bị vi phạm.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SecurityPolicyViolationEvent.SecurityPolicyViolationEvent","SecurityPolicyViolationEvent()")}}
  - : Tạo một phiên bản đối tượng `SecurityPolicyViolationEvent` mới.

## Thuộc tính phiên bản

- {{domxref("SecurityPolicyViolationEvent.blockedURI")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn URI của tài nguyên bị chặn vì nó vi phạm một chính sách.
- {{domxref("SecurityPolicyViolationEvent.columnNumber")}} {{ReadOnlyInline}}
  - : Số cột trong tài liệu hoặc worker mà tại đó vi phạm xảy ra.
- {{domxref("SecurityPolicyViolationEvent.disposition")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết liệu tác nhân người dùng được cấu hình để thực thi hay chỉ báo cáo vi phạm chính sách.
- {{domxref("SecurityPolicyViolationEvent.documentURI")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn URI của tài liệu hoặc worker mà tại đó vi phạm xảy ra.
- {{domxref("SecurityPolicyViolationEvent.effectiveDirective")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn chỉ thị bị vi phạm.
- {{domxref("SecurityPolicyViolationEvent.lineNumber")}} {{ReadOnlyInline}}
  - : Số dòng trong tài liệu hoặc worker mà tại đó vi phạm xảy ra.
- {{domxref("SecurityPolicyViolationEvent.originalPolicy")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa chính sách mà việc thực thi của nó gây ra vi phạm.
- {{domxref("SecurityPolicyViolationEvent.referrer")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn URL của referrer của các tài nguyên có chính sách bị vi phạm, hoặc `null`.
- {{domxref("SecurityPolicyViolationEvent.sample")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn mẫu của tài nguyên gây ra vi phạm, thường là 40 ký tự đầu tiên. Thuộc tính này chỉ được điền nếu tài nguyên là một inline script, trình xử lý sự kiện, hoặc style - các tài nguyên bên ngoài gây ra vi phạm sẽ không tạo ra mẫu.
- {{domxref("SecurityPolicyViolationEvent.sourceFile")}} {{ReadOnlyInline}}
  - : Nếu vi phạm xảy ra do một script, đây sẽ là URL của script đó; nếu không, giá trị sẽ là `null`.
    Cả `columnNumber` và `lineNumber` đều phải có giá trị khác null nếu thuộc tính này không phải là `null`.
- {{domxref("SecurityPolicyViolationEvent.statusCode")}} {{ReadOnlyInline}}
  - : Một số biểu diễn mã trạng thái HTTP của tài liệu hoặc worker mà tại đó vi phạm xảy ra.
- {{domxref("SecurityPolicyViolationEvent.violatedDirective")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn chỉ thị bị vi phạm.
    Đây là bí danh lịch sử của [`effectiveDirective`](/en-US/docs/Web/API/SecurityPolicyViolationEvent/effectiveDirective).

## Ví dụ

```js
document.addEventListener("securitypolicyviolation", (e) => {
  console.log(e.blockedURI);
  console.log(e.violatedDirective);
  console.log(e.originalPolicy);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- HTTP [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
- {{domxref("CSPViolationReport")}}
- Sự kiện {{domxref("Element/securitypolicyviolation_event", "securitypolicyviolation")}} của giao diện {{domxref("Element")}}
- Sự kiện {{domxref("Document/securitypolicyviolation_event", "securitypolicyviolation")}} của giao diện {{domxref("Document")}}
- Sự kiện {{domxref("WorkerGlobalScope/securitypolicyviolation_event", "securitypolicyviolation")}} của giao diện {{domxref("WorkerGlobalScope")}}
