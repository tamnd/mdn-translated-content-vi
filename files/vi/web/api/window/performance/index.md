---
title: "Window: thuộc tính performance"
short-title: performance
slug: Web/API/Window/performance
page-type: web-api-instance-property
browser-compat: api.performance
---

{{APIRef("Performance API")}}

The **`performance`** property of the {{domxref("Window")}} interface returns a {{domxref("Performance")}} object, which can be used to gather performance information about code running in the window's scope.

Performance entries are per context. If you create a mark on the main thread (or other worker), you cannot see it in a worker thread, and vice versa.

## Giá trị

A {{domxref("Performance")}} object offering access to performance and timing-related information about code running in the window's scope.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WorkerGlobalScope.performance")}}
