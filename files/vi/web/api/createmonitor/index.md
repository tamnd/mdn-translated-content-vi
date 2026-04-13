---
title: CreateMonitor
slug: Web/API/CreateMonitor
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CreateMonitor
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`CreateMonitor`** cung cấp thông tin về tiến trình tải xuống của một mô hình AI hoặc một số dữ liệu tinh chỉnh cho mô hình đó.

Nó có thể được dùng thông qua:

- {{domxref("Summarizer.create_static", "Summarizer.create()")}}
- {{domxref("LanguageDetector.create_static", "LanguageDetector.create()")}}
- {{domxref("Translator.create_static", "Translator.create()")}}

{{InheritanceDiagram}}

## Sự kiện

_Kế thừa các sự kiện từ phần tử cha của nó, {{DOMxRef("EventTarget")}}._

- {{domxref("CreateMonitor/downloadprogress_event", "downloadprogress")}} {{Experimental_Inline}}
  - : Được kích hoạt khi tiến trình tải xuống mô hình AI có thay đổi.

## Ví dụ

### Cách dùng `CreateMonitor` cơ bản

Một thực thể `CreateMonitor` được dùng thông qua thuộc tính `monitor` của phương thức `create()` trong một AI API ({{domxref("Summarizer.create_static", "Summarizer.create()")}} được minh họa bên dưới). Thuộc tính `monitor` nhận một hàm callback làm giá trị, trong đó đối số là thực thể `CreateMonitor`. Sau đó, bạn có thể theo dõi tiến trình tải xuống thông qua sự kiện {{domxref("CreateMonitor/downloadprogress_event", "downloadprogress")}} của thực thể này.

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  monitor(monitor) {
    monitor.addEventListener("downloadprogress", (e) => {
      console.log(`download progress: ${e.loaded}/${e.total}`);
    });
  },
});

const summary = await summarizer.summarize(myText);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Các bản minh họa Web AI](https://chrome.dev/web-ai-demos/) trên chrome.dev.
