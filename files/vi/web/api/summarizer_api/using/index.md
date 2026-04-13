---
title: Using the Summarizer API
slug: Web/API/Summarizer_API/Using
page-type: guide
---

{{DefaultAPISidebar("Summarizer API")}}

[Summarizer API](/en-US/docs/Web/API/Summarizer_API) cung cấp một cơ chế bất đồng bộ (dựa trên {{jsxref("Promise")}}) cho trang web để đưa một đoạn văn bản vào mô hình AI nội bộ của trình duyệt và yêu cầu nó trả về tóm tắt của văn bản dựa trên các tùy chọn được chỉ định. Bài viết này giải thích cách sử dụng các chức năng cơ bản của Summarizer API.

## Tạo một summarizer

Tất cả chức năng của Summarizer API đều được truy cập thông qua một giao diện duy nhất, {{domxref("Summarizer")}}.

Bước đầu tiên để mô hình AI trình duyệt tạo ra tóm tắt là tạo một phiên bản đối tượng `Summarizer`. Điều này được thực hiện bằng phương thức tĩnh {{domxref("Summarizer.create_static", "Summarizer.create()")}}, nhận một đối tượng tùy chọn làm đối số chỉ định các tùy chọn cho loại tóm tắt bạn muốn:

```js
const summarizer = await Summarizer.create({
  sharedContext:
    "A general summary to help a user decide if the text is worth reading",
  type: "tldr",
  length: "short",
  format: "markdown",
  expectedInputLanguages: ["en-US"],
  outputLanguage: "en-US",
});
```

Tùy chọn {{domxref("Summarizer.sharedContext", "sharedContext")}} cung cấp một chuỗi giúp mô hình AI viết tóm tắt phù hợp hơn với ngữ cảnh văn bản đang được sử dụng, trong khi {{domxref("Summarizer.type", "type")}} chỉ định loại tóm tắt bạn muốn cung cấp, như các điểm đầu dòng chính hoặc tóm tắt "tldr".

Chúng ta cũng chỉ định {{domxref("Summarizer.length", "length")}} mong muốn, {{domxref("Summarizer.format", "format")}} đầu ra, {{domxref("Summarizer.expectedInputLanguages", "expectedInputLanguages")}}, và {{domxref("Summarizer.outputLanguage", "outputLanguage")}} mong muốn. Nếu không chỉ định ngôn ngữ đầu vào và đầu ra, ngôn ngữ của văn bản đầu vào sẽ được tự động phát hiện, và ngôn ngữ đầu ra sẽ khớp với ngôn ngữ đầu vào.

Nếu mô hình AI của trình duyệt không hỗ trợ các ngôn ngữ đầu vào hoặc đầu ra được chỉ định, sẽ có lỗi được ném ra.

## Kiểm tra hỗ trợ cấu hình

Trước khi tạo `Summarizer`, bạn có thể kiểm tra liệu cấu hình mong muốn của bạn có được trình duyệt hiện tại hỗ trợ bằng phương thức tĩnh {{domxref("Summarizer.availability_static", "Summarizer.availability()")}}. Ví dụ:

```js
const availability = await Summarizer.availability({
  type: "tldr",
  length: "short",
  format: "markdown",
  expectedInputLanguages: ["en-US"],
  outputLanguage: "en-US",
});
```

Phương thức này trả về một giá trị liệt kê cho biết liệu hỗ trợ có sẵn sàng cho tập tùy chọn được chỉ định hay không:

- `downloadable` nghĩa là trình duyệt hỗ trợ các tùy chọn được yêu cầu, nhưng trước tiên cần tải xuống mô hình AI, hoặc một số dữ liệu tinh chỉnh cho mô hình.
- `downloading` nghĩa là trình duyệt hỗ trợ các tùy chọn được yêu cầu, nhưng cần hoàn thành việc tải xuống đang diễn ra trước khi tiếp tục.
- `available` nghĩa là trình duyệt hỗ trợ cấu hình đã cho mà không cần tải xuống mới.
- `unavailable` nghĩa là trình duyệt không hỗ trợ cấu hình đã cho.
