---
title: WorkerLocation
slug: Web/API/WorkerLocation
page-type: web-api-interface
browser-compat: api.WorkerLocation
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("worker")}}

Giao diện **`WorkerLocation`** xác định vị trí tuyệt đối của tập lệnh được thực thi bởi {{domxref("Worker")}}. Một đối tượng như vậy được khởi tạo cho mỗi worker và có thể truy cập thông qua thuộc tính {{domxref("WorkerGlobalScope.location")}} bằng cách gọi `self.location`.

Giao diện này chỉ hiển thị từ bên trong một tập lệnh JavaScript được thực thi trong ngữ cảnh của Web worker.

## Thuộc tính phiên bản

- {{domxref("WorkerLocation.href")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa {{domxref("URL")}} đã được tuần tự hóa cho vị trí của worker.
- {{domxref("WorkerLocation.protocol")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.protocol", "protocol")}} trong vị trí của worker.
- {{domxref("WorkerLocation.host")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.host", "host")}} trong vị trí của worker.
- {{domxref("WorkerLocation.hostname")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.hostname", "hostname")}} trong vị trí của worker.
- {{domxref("WorkerLocation.origin")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("URL.origin", "origin")}} của worker.
- {{domxref("WorkerLocation.port")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.port", "port")}} trong vị trí của worker.
- {{domxref("WorkerLocation.pathname")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.pathname", "pathname")}} trong vị trí của worker.
- {{domxref("WorkerLocation.search")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.search", "search")}} trong vị trí của worker.
- {{domxref("WorkerLocation.hash")}} {{ReadOnlyInline}}
  - : Trả về phần {{domxref("URL.hash", "hash")}} trong vị trí của worker.

## Phương thức phiên bản

- {{domxref("WorkerLocation.toString()")}}
  - : Trả về một chuỗi chứa {{domxref("URL")}} đã được tuần tự hóa cho vị trí của worker. Đây là từ đồng nghĩa với {{domxref("WorkerLocation.href")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các giao diện liên quan đến Worker khác: {{domxref("Worker")}}, {{domxref("WorkerNavigator")}}, và {{domxref("WorkerGlobalScope")}}
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
