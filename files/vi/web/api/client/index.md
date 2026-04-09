---
title: Client
slug: Web/API/Client
page-type: web-api-interface
browser-compat: api.Client
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Giao diện `Client` đại diện cho một ngữ cảnh thực thi như {{domxref("Worker")}} hoặc {{domxref("SharedWorker")}}. Các client {{domxref("Window")}} được biểu diễn bằng {{domxref("WindowClient")}} cụ thể hơn. Bạn có thể lấy các đối tượng `Client`/`WindowClient` từ những phương thức như {{domxref("Clients.matchAll","Clients.matchAll()")}} và {{domxref("Clients.get","Clients.get()")}}.

## Phương thức thực thể

- {{domxref("Client.postMessage()")}}
  - : Gửi một thông điệp tới client.

## Thuộc tính thực thể

- {{domxref("Client.frameType")}} {{ReadOnlyInline}}
  - : Kiểu khung của client dưới dạng chuỗi. Giá trị có thể là `"auxiliary"`, `"top-level"`, `"nested"` hoặc `"none"`.
- {{domxref("Client.id")}} {{ReadOnlyInline}}
  - : Mã định danh duy nhất toàn cục của client dưới dạng chuỗi.
- {{domxref("Client.type")}} {{ReadOnlyInline}}
  - : Loại của client dưới dạng chuỗi. Giá trị có thể là `"window"`, `"worker"` hoặc `"sharedworker"`.
- {{domxref("Client.url")}} {{ReadOnlyInline}}
  - : URL của client dưới dạng chuỗi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/vi/docs/Web/API/Service_Worker_API/Using_Service_Workers)
