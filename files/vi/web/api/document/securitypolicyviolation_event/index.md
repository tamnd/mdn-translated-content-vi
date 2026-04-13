---
title: "Document: securitypolicyviolation event"
short-title: securitypolicyviolation
slug: Web/API/Document/securitypolicyviolation_event
page-type: web-api-event
browser-compat: api.Document.securitypolicyviolation_event
---

{{APIRef("Reporting API")}}

Sự kiện **`securitypolicyviolation`** được kích hoạt khi [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) bị vi phạm.

Sự kiện được kích hoạt trên tài liệu khi có vi phạm chính sách CSP của tài liệu (và cũng có thể nổi bọt từ các phần tử trong tài liệu).

Sự kiện này [nổi bọt](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling) đến đối tượng {{domxref("Window")}}, và [được cấu thành](/en-US/docs/Web/API/Event/composed).

> [!NOTE]
> Bạn nói chung nên thêm trình xử lý cho sự kiện này vào một đối tượng cấp cao (tức là {{domxref("Window")}} hoặc {{domxref("Document")}}).
> Mặc dù các phần tử HTML về mặt kỹ thuật có thể là mục tiêu của sự kiện `securitypolicyviolation`, nhưng trong thực tế sự kiện này không được kích hoạt trên chúng — ví dụ: một nguồn `<img>` bị chặn trực tiếp kích hoạt sự kiện này trên `document` làm mục tiêu, thay vì nổi bọt từ phần tử `<img>`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("securitypolicyviolation", (event) => { })

onsecuritypolicyviolation = (event) => { }
```

## Loại sự kiện

Một {{domxref("SecurityPolicyViolationEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SecurityPolicyViolationEvent")}}

## Ví dụ

Đoạn mã dưới đây cho thấy cách bạn có thể thêm một hàm trình xử lý sự kiện bằng thuộc tính trình xử lý sự kiện `onsecuritypolicyviolation` hoặc `addEventListener()` trên `Document`.

```js
document.onsecuritypolicyviolation = (e) => {
  // Xử lý SecurityPolicyViolationEvent e tại đây
};

document.addEventListener("securitypolicyviolation", (e) => {
  // Xử lý SecurityPolicyViolationEvent e tại đây
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Element/securitypolicyviolation_event", "securitypolicyviolation")} của giao diện {{domxref("Element")}}
- Sự kiện {{domxref("WorkerGlobalScope/securitypolicyviolation_event", "securitypolicyviolation")} của giao diện {{domxref("WorkerGlobalScope")}}
- [HTTP > Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP)
