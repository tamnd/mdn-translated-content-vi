---
title: "CreateMonitor: sự kiện downloadprogress"
short-title: downloadprogress
slug: Web/API/CreateMonitor/downloadprogress_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.CreateMonitor.downloadprogress_event
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Sự kiện **`downloadprogress`** của giao diện {{domxref("CreateMonitor")}} được kích hoạt khi tiến trình tải xuống mô hình AI có thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("downloadprogress", (event) => { })

ondownloadprogress = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("ProgressEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ProgressEvent")}}

## Ví dụ

Xem trang chính {{domxref("CreateMonitor")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Các bản minh họa Web AI](https://chrome.dev/web-ai-demos/) trên chrome.dev.
