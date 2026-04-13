---
title: "Summarizer: phương thức tĩnh availability()"
short-title: availability()
slug: Web/API/Summarizer/availability_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.Summarizer.availability_static
---

{{APIRef("Summarizer API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`availability()`** của giao diện {{domxref("Summarizer")}} trả về một giá trị liệt kê cho biết mô hình AI trình duyệt có hỗ trợ (hoặc sẽ hỗ trợ) một cấu hình `Summarizer` nhất định hay không.

## Cú pháp

```js-nolint
Summarizer.availability()
Summarizer.availability(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn xác định cấu hình có thể cho `Summarizer`. Các giá trị có thể bao gồm:
    - `expectedInputLanguages`
      - : Một mảng các chuỗi bằng {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} chỉ định các ngôn ngữ dự kiến của văn bản đầu vào. Mặc định là `["en"]`.
    - `expectedContextLanguages`
      - : Một mảng các chuỗi bằng thẻ ngôn ngữ BCP 47 chỉ định các ngôn ngữ dự kiến của bất kỳ chuỗi ngữ cảnh nào được cung cấp (hoặc [`sharedContext`](/en-US/docs/Web/API/Summarizer/create_static#sharedcontext) được truyền cho `Summarizer`, hoặc `context` được chỉ định trong lần gọi {{domxref("Summarizer.summarize", "summarize()")}} hoặc {{domxref("Summarizer.summarizeStreaming", "summarizeStreaming()")}}). Mặc định là `["en"]`.
    - `format`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.format", "định dạng")}} văn bản bạn muốn các bản tóm tắt được trả về. Mặc định là `markdown`.
    - `length`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.length", "độ dài")}} tương đối cho các bản tóm tắt được tạo. Mặc định là `short`.
    - `outputLanguage`
      - : Một chuỗi bằng thẻ ngôn ngữ BCP 47 chỉ định ngôn ngữ dự kiến của các bản tóm tắt được tạo bởi `Summarizer`. Mặc định là `en`.
    - `type`
      - : Một giá trị liệt kê chỉ định {{domxref("Summarizer.type", "loại")}} bản tóm tắt bạn muốn `Summarizer` này tạo. Mặc định là `key-points`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một giá trị liệt kê cho biết liệu sự hỗ trợ có sẵn (hoặc sẽ có sẵn) cho một cấu hình `Summarizer` nhất định hay không, hoặc `null` nếu không thể xác định được sự hỗ trợ.

Các giá trị có thể bao gồm:

- `available`
  - : Trình duyệt hỗ trợ cấu hình đã cho và có thể được sử dụng ngay lập tức.
- `downloadable`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng trước tiên cần tải xuống mô hình AI hoặc một số dữ liệu tinh chỉnh cho mô hình.
- `downloading`
  - : Trình duyệt hỗ trợ cấu hình đã cho, nhưng cần hoàn tất quá trình tải xuống đang diễn ra trước khi có thể tiến hành.
- `unavailable`
  - : Trình duyệt không hỗ trợ cấu hình đã cho.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc sử dụng Summarizer API bị chặn bởi {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `context` được cung cấp không ở ngôn ngữ mà `Summarizer` hỗ trợ.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu lần gọi `measureInputUsage()` thất bại vì bất kỳ lý do nào khác, hoặc lý do mà tác nhân người dùng không muốn tiết lộ.

## Ví dụ

### Sử dụng cơ bản `availability()`

```js
async function getSummarizer() {
  const options = {
    sharedContext: "This is a scientific article",
    type: "key-points",
    format: "markdown",
    length: "medium",
  };

  const availability = await Summarizer.availability(options);
  if (availability === "unavailable") {
    // The Summarizer API isn't usable
    return undefined;
  } else if (availability === "available") {
    // The Summarizer API can be used immediately
    return Summarizer.create(options);
  }
  // The Summarizer API can be used after the model is downloaded
  const summarizer = await Summarizer.create(options);
  summarizer.addEventListener("downloadprogress", (e) => {
    console.log(`Downloaded ${e.loaded * 100}%`);
  });
  return summarizer;
}
```

### Phát hiện hỗ trợ ngôn ngữ

```js
async function langSupport(lang) {
  const availability = await Summarizer.availability({
    expectedInputLanguages: [lang],
  });
  return availability;
}

langSupport("en-US");
langSupport("fr");
langSupport("zh-CN");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
