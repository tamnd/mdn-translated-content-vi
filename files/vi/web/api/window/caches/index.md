---
title: "Window: thuộc tính caches"
short-title: caches
slug: Web/API/Window/caches
page-type: web-api-instance-property
browser-compat: api.caches
---

{{APIRef("Service Workers API")}}{{securecontext_header}}

The **`caches`** read-only property of the {{domxref("Window")}} interface returns the {{domxref("CacheStorage")}} object associated with the current context.
This object enables functionality such as storing assets for offline use, and generating custom responses to requests.

## Giá trị

A {{domxref("CacheStorage")}} object.

## Ví dụ

The following example shows how a window can retrieve cached data.

```js
caches.open("v1").then((cache) => cache.match("/list"));
```

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Service Workers](/en-US/docs/Web/API/Service_Worker_API)
- {{domxref("CacheStorage")}}
- {{domxref("Cache")}}
