---
title: "console: phương thức tĩnh timeStamp()"
short-title: timeStamp()
slug: Web/API/console/timeStamp_static
page-type: web-api-static-method
status:
  - non-standard
browser-compat: api.console.timeStamp_static
---

{{APIRef("Console API")}}{{Non-standard_header}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.timeStamp()`** thêm một dấu mốc đơn vào công cụ Performance của trình duyệt ([Firefox bug 1387528](https://bugzil.la/1387528), [Chrome](https://developer.chrome.com/docs/devtools/performance/reference)). Điều này cho phép bạn liên hệ một điểm trong mã của mình với các sự kiện khác được ghi trong dòng thời gian, chẳng hạn như sự kiện bố cục và vẽ.

Bạn có thể tùy chọn cung cấp một đối số để gắn nhãn cho dấu thời gian này, và nhãn đó sau đó sẽ được hiển thị cùng với dấu mốc.

Một số trình duyệt còn mở rộng thêm phương thức `console.timeStamp()` này để cho phép truyền thêm các tham số tùy chọn như một phần của API mở rộng, qua đó đưa các thông tin này vào dấu vết hiệu năng. Xem [tài liệu về extensibility API của Chrome](https://developer.chrome.com/docs/devtools/performance/extension#inject_your_data_with_consoletimestamp) để biết thêm thông tin.

## Cú pháp

```js-nolint
console.timeStamp(label);
console.timeStamp(label, start, end, trackName, trackGroup, color, data);
```

### Tham số

- `color` {{Optional_Inline}} {{Experimental_Inline}}
  - : Chuỗi biểu thị màu hiển thị của mục. Phải là một trong các giá trị `"primary"`, `"primary-light"`, `"primary-dark"`, `"secondary"`, `"secondary-light"`, `"secondary-dark"`, `"tertiary"`, `"tertiary-light"`, `"tertiary-dark"`, `"error"`.

- `data` {{Optional_Inline}} {{Experimental_Inline}}
  - : Một đối tượng chứa dữ liệu bổ sung cần hiển thị. URL có thể tự động được một số trình duyệt chuyển thành liên kết.

> [!NOTE]
> Mức hỗ trợ cho tham số `data` khác nhau giữa các trình duyệt và cách triển khai DevTools của chúng. Ví dụ, trong một số phiên bản Chrome, dữ liệu này có thể không xuất hiện trong bảng Performance.

- `end` {{Optional_Inline}} {{Experimental_Inline}}
  - : Một chuỗi tham chiếu đến nhãn `timeStamp` đã được định nghĩa trước đó hoặc một dấu thời gian ({{domxref("DOMHighResTimeStamp")}}) sẽ được dùng làm thời điểm kết thúc.

- `label` {{Optional_Inline}}
  - : Nhãn cho dấu thời gian.

- `start` {{Optional_Inline}} {{Experimental_Inline}}
  - : Một chuỗi tham chiếu đến nhãn `timeStamp` đã được định nghĩa trước đó hoặc một dấu thời gian ({{domxref("DOMHighResTimeStamp")}}) sẽ được dùng làm thời điểm bắt đầu.

- `trackName` {{Optional_Inline}} {{Experimental_Inline}}
  - : Tên của track tùy chỉnh dùng để hiển thị dữ liệu dấu thời gian

- `trackGroup` {{Optional_Inline}} {{Experimental_Inline}}
  - : Nhóm của track tùy chỉnh dùng để hiển thị dữ liệu dấu thời gian

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Cách dùng cơ bản

```js
console.timeStamp("marker 1");
```

### Dùng Extensibility API để cung cấp chi tiết phong phú hơn cho việc hiển thị

```js
// 1. Tạo một sự kiện khoảng thời gian với dữ liệu phong phú
const start = performance.now() - 150;
const end = performance.now() - 20;

const durationData = {
  processingTime: `${end - start}ms`,
  info: "Check this URL: https://example.com for more.",
  metrics: {
    items: 5,
    isCached: true,
  },
};

console.timeStamp(
  "My Timed Task", // label
  start, // startTime
  end, // endTime
  "Tasks", // trackName
  "My Extension", // trackGroup
  "tertiary", // color
  durationData, // data (object)
);

// 2. Tạo một sự kiện tức thời với liên kết sâu cho tiện ích mở rộng DevTools
const linkData = {
  url: "ext://resource/123",
  description: "View Resource 123",
  otherDetail: "This data also appears in the JSON viewer",
};

console.timeStamp(
  "Event with Link", // label
  performance.now(), // startTime (instant)
  undefined, // endTime (instant)
  "Tasks", // trackName
  "My Extension", // trackGroup
  "primary-light", // color
  linkData, // data (object)
);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("console/time_static", "console.time()")}}
- {{domxref("console/timeLog_static", "console.timeLog()")}}
- {{domxref("console/timeEnd_static", "console.timeEnd()")}}
- {{domxref("performance/mark", "performance.mark()")}}
- {{domxref("performance/measure", "performance.measure()")}}
- [Adding markers with the console API](https://web.archive.org/web/20211207010020/https://firefox-source-docs.mozilla.org/devtools-user/performance/waterfall/index.html#adding-markers-with-the-console-api)
- [Chrome DevTools extensibility API](https://developer.chrome.com/docs/devtools/performance/extension#inject_your_data_with_consoletimestamp)
