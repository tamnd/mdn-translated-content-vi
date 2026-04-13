---
title: Các hàm và lớp khả dụng cho Web Workers
slug: Web/API/Web_Workers_API/Functions_and_classes_available_to_workers
page-type: guide
---

{{DefaultAPISidebar("Web Workers API")}}

Ngoài tập hợp các hàm [JavaScript](/en-US/docs/Web/JavaScript) tiêu chuẩn (chẳng hạn như {{jsxref("String")}}, {{jsxref("Array")}}, {{jsxref("Object")}}, {{jsxref("JSON")}}, v.v.), có nhiều hàm (và APIs) khác nhau khả dụng trong các workers. Bài viết này cung cấp danh sách các hàm đó.

## Các hàm khả dụng trong workers

Các hàm sau khả dụng cho workers:

- {{domxref("WorkerGlobalScope.atob()")}}
- {{domxref("WorkerGlobalScope.btoa()")}}
- {{domxref("WorkerGlobalScope.clearInterval()")}}
- {{domxref("WorkerGlobalScope.clearTimeout()")}}
- {{domxref("WorkerGlobalScope.createImageBitmap()")}}
- {{domxref("WorkerGlobalScope.dump()")}} {{non-standard_inline}}
- {{domxref("WorkerGlobalScope.fetch()")}}
- {{domxref("WorkerGlobalScope.queueMicrotask()")}}
- {{domxref("WorkerGlobalScope.reportError()")}}
- {{domxref("WorkerGlobalScope.setInterval()")}}
- {{domxref("WorkerGlobalScope.setTimeout()")}}
- {{domxref("WorkerGlobalScope.structuredClone()")}}
- {{domxref("DedicatedWorkerGlobalScope.postMessage()")}} (chỉ dedicated workers)
- {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()")}} (chỉ dedicated workers)
- {{domxref("DedicatedWorkerGlobalScope.cancelAnimationFrame()")}} (chỉ dedicated workers)

Các hàm sau **chỉ** khả dụng cho workers:

- {{domxref("WorkerGlobalScope.importScripts()")}}

## Web APIs khả dụng trong workers

> [!NOTE]
> Nếu một API được liệt kê được hỗ trợ bởi một nền tảng trong một phiên bản cụ thể, thì thường có thể giả định nó khả dụng trong web workers. Bạn có thể kiểm tra hỗ trợ cho một đối tượng hoặc hàm cụ thể bằng cách sử dụng [Worker Playground](https://mdn.github.io/dom-examples/web-workers/worker-playground/).

Các Web APIs sau khả dụng cho workers:

- {{domxref("Background Fetch API", "", "", "nocode")}}
- {{domxref("Background Synchronization API", "", "", "nocode")}}
- {{domxref("Barcode Detection API", "", "", "nocode")}}
- {{domxref("Broadcast Channel API", "", "", "nocode")}}
- {{domxref("Canvas API", "", "", "nocode")}}
- {{domxref("Channel Messaging API", "", "", "nocode")}}
- {{domxref("Compression Streams API", "", "", "nocode")}}
- {{domxref("Compute Pressure API", "", "", "nocode")}}
- {{domxref("Console API", "", "", "nocode")}}
- {{domxref("Content Index API", "", "", "nocode")}}
- {{domxref("Cookie Store API", "", "", "nocode")}} (chỉ service workers)
- {{domxref("CSS Font Loading API", "", "", "nocode")}}
- {{domxref("Encoding API", "", "", "nocode")}}
- {{domxref("Fetch API", "", "", "nocode")}}
- {{domxref("File API", "", "", "nocode")}}
- {{domxref("File System API", "", "", "nocode")}}
- {{domxref("Idle Detection API", "", "", "nocode")}}
- {{domxref("IndexedDB API", "", "", "nocode")}}
- {{domxref("Media Capabilities API", "", "", "nocode")}}
- {{domxref("Media Source Extensions API", "", "", "nocode")}} (chỉ dedicated workers)
- {{domxref("Network Information API", "", "", "nocode")}}
- {{domxref("Notifications API", "", "", "nocode")}}
- {{domxref("Payment Handler API", "", "", "nocode")}}
- {{domxref("Performance API", "", "", "nocode")}}
- {{domxref("Permissions API", "", "", "nocode")}}
- {{domxref("Prioritized Task Scheduling API", "", "", "nocode")}}
- {{domxref("Push API", "", "", "nocode")}}
- {{domxref("Reporting API", "", "", "nocode")}}
- {{domxref("Server-Sent Events", "", "", "nocode")}}
- {{domxref("Service Worker API", "", "", "nocode")}}
- {{domxref("Streams API", "", "", "nocode")}}
- {{domxref("Trusted Types API", "", "", "nocode")}}
- {{domxref("URL API", "", "", "nocode")}}
- {{domxref("URL Pattern API", "", "", "nocode")}}
- {{domxref("User-Agent Client Hints API", "", "", "nocode")}}
- {{domxref("Web Crypto API", "", "", "nocode")}}
- {{domxref("Web Locks API", "", "", "nocode")}}
- {{domxref("Web Serial API", "", "", "nocode")}}
- {{domxref("Web Periodic Background Synchronization API", "", "", "nocode")}}
- {{domxref("WebCodecs API", "", "", "nocode")}}
- {{domxref("WebGL API", "", "", "nocode")}}
- {{domxref("WebGPU API", "", "", "nocode")}}
- {{domxref("WebHID API", "", "", "nocode")}} (chỉ dedicated và service workers)
- {{domxref("WebUSB API", "", "", "nocode")}}
- {{domxref("WebSockets API", "", "", "nocode")}}
- {{domxref("XMLHttpRequest API", "", "", "nocode")}}

Workers cũng có thể sinh ra các workers khác, vì vậy các APIs sau cũng khả dụng:

- {{domxref("Worker")}}
- {{domxref("WorkerGlobalScope")}}
- {{domxref("WorkerLocation")}}
- {{domxref("WorkerNavigator")}}

## Xem thêm

- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- {{domxref("Worker")}}
