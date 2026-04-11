---
title: "Performance: measure() method"
short-title: measure()
slug: Web/API/Performance/measure
page-type: web-api-instance-method
browser-compat: api.Performance.measure
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`measure()`** tạo một đối tượng {{domxref("PerformanceMeasure")}} có tên, đại diện cho một phép đo thời gian giữa hai mark trong performance timeline của trình duyệt.

Khi đo giữa hai mark, lần lượt sẽ có một _start mark_ và một _end mark_.
Dấu thời gian có tên này được gọi là một _measure_.

## Cú pháp

```js-nolint
measure(measureName)
measure(measureName, startMark)
measure(measureName, startMark, endMark)
measure(measureName, measureOptions)
measure(measureName, measureOptions, endMark)
```

Nếu chỉ chỉ định `measureName`, dấu thời gian bắt đầu được đặt thành 0, và dấu thời gian kết thúc (dùng để tính duration) là giá trị mà {{domxref("Performance.now()")}} sẽ trả về.

Bạn có thể dùng chuỗi để xác định các đối tượng {{domxref("PerformanceMark")}} làm start và end mark.

Để chỉ cung cấp `endMark`, bạn cần cung cấp một đối tượng `measureOptions` rỗng:
`performance.measure("myMeasure", {}, "myEndMarker")`.

### Tham số

- `measureName`
  - : Một chuỗi biểu thị tên của measure.

- `measureOptions` {{optional_inline}}
  - : Một đối tượng có thể chứa các tùy chọn của measure.
    - `detail` {{optional_inline}}
      - : Metadata tùy ý sẽ được đưa vào measure. Mặc định là `null`. Phải là [structured-cloneable](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
        - `devtools`
          - : Một số trình duyệt dùng đối tượng `devtools` có cấu trúc trong đối tượng `detail` như một phần của API Extensibility, để hiển thị chúng trong các custom track của performance trace. Xem [tài liệu Chrome Extensibility API](https://developer.chrome.com/docs/devtools/performance/extension#inject_your_data_with_the_user_timings_api) để biết thêm thông tin.
            - `dataType` {{experimental_inline}}
              - : Chuỗi có giá trị `track-entry` (để định nghĩa một track mới) hoặc `marker` (để định nghĩa một entry trong track).
            - `color` {{optional_inline}} {{experimental_inline}}
              - : Mặc định là `"primary"`. Phải là một trong `"primary"`, `"primary-light"`, `"primary-dark"`, `"secondary"`, `"secondary-light"`, `"secondary-dark"`, `"tertiary"`, `"tertiary-light"`, `"tertiary-dark"`, `"error"`.
            - `track` {{optional_inline}} {{experimental_inline}}
              - : Chuỗi là tên của custom track (bắt buộc cho `track-entry`)
            - `trackGroup` {{optional_inline}} {{experimental_inline}}
              - : Chuỗi là tên của nhóm trong custom track (bắt buộc cho `track-entry`)
            - `properties` {{optional_inline}} {{experimental_inline}}
              - : Mảng các cặp khóa-giá trị. Giá trị có thể là bất kỳ kiểu nào tương thích với JSON.
            - `tooltipText` {{optional_inline}} {{experimental_inline}}
              - : Mô tả ngắn cho tooltip.

    - `start` {{optional_inline}}
      - : Dấu thời gian ({{domxref("DOMHighResTimeStamp")}}) dùng làm thời gian bắt đầu, hoặc chuỗi đặt tên một {{domxref("PerformanceMark")}} để dùng làm thời gian bắt đầu.

        Nếu đây là một chuỗi đặt tên một {{domxref("PerformanceMark")}}, thì nó được định nghĩa theo cùng cách với `startMark`.

    - `duration` {{optional_inline}}
      - : Thời lượng (tính bằng mili giây) giữa thời gian của start mark và end mark. Nếu bỏ qua, mặc định là {{domxref("performance.now()")}}; tức khoảng thời gian đã trôi qua kể từ khi ngữ cảnh được tạo. Nếu cung cấp giá trị này, bạn cũng phải chỉ định `start` hoặc `end`, nhưng không được cả hai.

    - `end` {{optional_inline}}
      - : Dấu thời gian ({{domxref("DOMHighResTimeStamp")}}) dùng làm thời gian kết thúc, hoặc chuỗi đặt tên một {{domxref("PerformanceMark")}} để dùng làm thời gian kết thúc.

        Nếu đây là một chuỗi đặt tên một {{domxref("PerformanceMark")}}, thì nó được định nghĩa theo cùng cách với `endMark`.

- `startMark` {{optional_inline}}
  - : Một chuỗi đặt tên một {{domxref("PerformanceMark")}} trong performance timeline. Thuộc tính {{domxref("PerformanceEntry.startTime")}} của mark này sẽ được dùng để tính measure.

- `endMark` {{optional_inline}}
  - : Một chuỗi đặt tên một {{domxref("PerformanceMark")}} trong performance timeline. Thuộc tính {{domxref("PerformanceEntry.startTime")}} của mark này sẽ được dùng để tính measure.
    Nếu muốn truyền đối số này, bạn cũng phải truyền `startMark` hoặc một đối tượng `measureOptions` rỗng.

### Giá trị trả về

Entry {{domxref("PerformanceMeasure")}} đã được tạo.

Giá trị _measure_ được trả về sẽ có các giá trị thuộc tính sau:

- {{domxref("PerformanceEntry.entryType","entryType")}} - đặt thành `"measure"`.
- {{domxref("PerformanceEntry.name","name")}} - đặt thành đối số `name`.
- {{domxref("PerformanceEntry.startTime","startTime")}} - đặt thành:
  - một {{domxref("DOMHighResTimeStamp","timestamp")}}, nếu được chỉ định trong `measureOptions.start`.
  - {{domxref("DOMHighResTimeStamp","timestamp")}} của start mark, nếu được chỉ định trong `measureOptions.start` hoặc `startMark`
  - một dấu thời gian được tính từ `measureOptions.end` và `measureOptions.duration` (nếu `measureOptions.start` không được chỉ định)
  - 0, nếu không được chỉ định và không thể xác định từ các giá trị khác.

- {{domxref("PerformanceEntry.duration","duration")}} - đặt thành một {{domxref("DOMHighResTimeStamp")}} là thời lượng của measure, được tính bằng cách lấy `startTime` trừ khỏi dấu thời gian kết thúc.

  Dấu thời gian kết thúc là một trong các giá trị sau:
  - một {{domxref("DOMHighResTimeStamp","timestamp")}}, nếu được chỉ định trong `measureOptions.end`.
  - {{domxref("DOMHighResTimeStamp","timestamp")}} của end mark, nếu được chỉ định trong `measureOptions.end` hoặc `endMark`
  - một dấu thời gian được tính từ `measureOptions.start` và `measureOptions.duration` (nếu `measureOptions.end` không được chỉ định)
  - giá trị do {{domxref("Performance.now()")}} trả về, nếu không có end mark được chỉ định hoặc không thể xác định từ các giá trị khác.

- {{domxref("PerformanceMeasure","detail")}} - đặt thành giá trị được truyền trong `measureOptions`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Có thể được ném ra trong bất kỳ trường hợp nào mà start, end hoặc duration có thể gây mơ hồ:
    - Cả `endMark` và `measureOptions` đều được chỉ định.
    - `measureOptions` được chỉ định với `duration` nhưng không chỉ định `start` hoặc `end`.
    - `measureOptions` được chỉ định với đồng thời `start`, `end` và `duration`.

- `SyntaxError` {{domxref("DOMException")}}
  - : Mark được đặt tên không tồn tại.
    - End mark được chỉ định bằng `endMark` hoặc `measureOptions.end`, nhưng không có {{domxref('PerformanceMark')}} nào trong performance buffer khớp tên đó.
    - End mark được chỉ định bằng `endMark` hoặc `measureOptions.end`, nhưng nó không thể chuyển đổi để khớp với một thuộc tính chỉ đọc trong giao diện {{domxref("PerformanceTiming")}}.
    - Start mark được chỉ định bằng `startMark` hoặc `measureOptions.start`, nhưng không có {{domxref('PerformanceMark')}} nào trong performance buffer khớp tên đó.
    - Start mark được chỉ định bằng `startMark` hoặc `measureOptions.start`, nhưng nó không thể chuyển đổi để khớp với một thuộc tính chỉ đọc trong giao diện {{domxref("PerformanceTiming")}}.

- `DataCloneError` {{domxref("DOMException")}}
  - : Giá trị `measureOptions.detail` khác `null` và không thể tuần tự hóa bằng thuật toán HTML "StructuredSerialize".

- {{jsxref("RangeError")}}
  - : Giá trị `measureOptions.detail` khác `null` và không thể cấp phát bộ nhớ trong quá trình tuần tự hóa bằng thuật toán HTML "StructuredSerialize".

## Ví dụ

### Đo thời lượng giữa các marker có tên

Giả sử bạn có hai marker riêng `"login-started"` và `"login-finished"`, bạn có thể tạo một phép đo có tên `"login-duration"` như trong ví dụ sau. Đối tượng {{domxref("PerformanceMeasure")}} được trả về khi đó sẽ cung cấp thuộc tính `duration` để cho biết thời gian đã trôi qua giữa hai marker.

```js
const loginMeasure = performance.measure(
  "login-duration",
  "login-started",
  "login-finished",
);
console.log(loginMeasure.duration);
```

### Đo thời lượng với thời điểm bắt đầu và kết thúc tùy chỉnh

Để đo nâng cao hơn, bạn có thể truyền tham số `measureOptions`. Ví dụ, bạn có thể dùng thuộc tính [`event.timeStamp`](/en-US/docs/Web/API/Event/timeStamp) từ một [`click` event](/en-US/docs/Web/API/Element/click_event) làm thời gian bắt đầu.

```js
performance.measure("login-click", {
  start: myClickEvent.timeStamp,
  end: myMarker.startTime,
});
```

### Cung cấp chi tiết đo bổ sung

Bạn có thể dùng thuộc tính `details` để cung cấp thêm thông tin dưới bất kỳ kiểu nào. Ví dụ, có thể bạn muốn ghi lại phần tử HTML nào đã được nhấp.

```js
performance.measure("login-click", {
  detail: { htmlElement: myElement.id },
  start: myClickEvent.timeStamp,
  end: myMarker.startTime,
});
```

### DevTools Extensibility API

Với các trình duyệt hỗ trợ [Extensibility API](https://developer.chrome.com/docs/devtools/performance/extension), bạn có thể dùng tham số `detail` để cung cấp thêm thông tin trong một đối tượng `devtools` sẽ được dùng để hiển thị trong performance profile:

```js
const imageProcessingTimeStart = performance.now();

// ... sau đó trong mã của bạn

performance.measure("Image Processing Complete", {
  start: imageProcessingTimeStart,
  end: performance.now(),
  detail: {
    // Dữ liệu này xuất hiện trong "Summary"
    extraInfo: {
      imageId: "xyz-123",
      source: "cache",
      checkUrl: "https://example.com/check/xyz-123",
    },
    // Đối tượng devtools điều khiển cách hiển thị track
    devtools: {
      dataType: "track-entry",
      track: "Image Processing Tasks",
      trackGroup: "My Tracks",
      color: "tertiary-dark",
      properties: [
        ["Filter Type", "Gaussian Blur"],
        // Giá trị có thể là object, mảng, hoặc kiểu khác
        ["Resize Dimensions", { w: 500, h: 300 }],
        // Các giá trị chuỗi là URL sẽ được tự động tạo liên kết
        ["Image URL", "https://example.com/img.png"],
      ],
      tooltipText: "Processed image successfully",
    },
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
