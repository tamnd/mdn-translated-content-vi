---
title: "Navigator: thuộc tính serviceWorker"
short-title: serviceWorker
slug: Web/API/Navigator/serviceWorker
page-type: web-api-instance-property
browser-compat: api.Navigator.serviceWorker
---

{{securecontext_header}}{{APIRef("Service Workers API")}}

Thuộc tính chỉ đọc **`serviceWorker`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("ServiceWorkerContainer")}} cho [associated document](https://html.spec.whatwg.org/multipage/browsers.html#concept-document-window), cung cấp quyền truy cập để đăng ký, xóa, nâng cấp và liên lạc với {{domxref("ServiceWorker")}}.

Tính năng này có thể không khả dụng ở chế độ riêng tư.

Lưu ý rằng nhân viên có thể truy cập tương tự {{domxref("ServiceWorkerContainer")}} cho tài liệu bằng {{domxref("WorkerNavigator.serviceWorker")}}.

## Giá trị

{{domxref("ServiceWorkerContainer")}}.

## Ví dụ

Mã này kiểm tra xem trình duyệt có hỗ trợ nhân viên dịch vụ hay không.

```js
if ("serviceWorker" in navigator) {
  // Supported!
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Service Worker API", "", "", "nocode")}}
- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
