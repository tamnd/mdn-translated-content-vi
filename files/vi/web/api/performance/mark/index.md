---
title: "Performance: mark() method"
short-title: mark()
slug: Web/API/Performance/mark
page-type: web-api-instance-method
browser-compat: api.Performance.mark
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`mark()`** tạo một đối tượng {{domxref("PerformanceMark")}} có tên, đại diện cho một dấu thời gian độ phân giải cao trong performance timeline của trình duyệt.

## Cú pháp

```js-nolint
mark(name)
mark(name, markOptions)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên của mark. Không được trùng với tên của một trong các thuộc tính của giao diện {{domxref("PerformanceTiming")}} đã lỗi thời.

- `markOptions` {{optional_inline}}
  - : Một đối tượng để chỉ định dấu thời gian và metadata bổ sung cho mark.
    - `detail` {{optional_inline}}
      - : Metadata tùy ý sẽ được đưa vào mark. Mặc định là `null`. Phải là [structured-cloneable](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
        - `devtools` {{optional_inline}} {{experimental_inline}}
          - : Một số trình duyệt dùng đối tượng `devtools` có cấu trúc trong đối tượng `detail` như một phần của API Extensibility, để hiển thị chúng trong các custom track của performance trace. Xem [tài liệu Chrome Extensibility API](https://developer.chrome.com/docs/devtools/performance/extension#inject_your_data_with_the_user_timings_api) để biết thêm thông tin.
            - `dataType` {{experimental_inline}}
              - : Một chuỗi phải được đặt thành `marker`. Xác định đây là một marker.
            - `color` {{optional_inline}} {{experimental_inline}}
              - : Mặc định là `"primary"`. Phải là một trong `"primary"`, `"primary-light"`, `"primary-dark"`, `"secondary"`, `"secondary-light"`, `"secondary-dark"`, `"tertiary"`, `"tertiary-light"`, `"tertiary-dark"`, `"error"`.
            - `properties` {{optional_inline}} {{experimental_inline}}
              - : Mảng các cặp khóa-giá trị. Giá trị có thể là bất kỳ kiểu nào tương thích với JSON.
            - `tooltipText` {{optional_inline}} {{experimental_inline}}
              - : Mô tả ngắn cho tooltip.

    - `startTime` {{optional_inline}}
      - : {{domxref("DOMHighResTimeStamp")}} dùng làm thời điểm mark. Mặc định là {{domxref("performance.now()")}}.

### Giá trị trả về

Entry {{domxref("PerformanceMark")}} đã được tạo.

### Ngoại lệ

- {{jsxref("SyntaxError")}}: Được ném ra nếu `name` là một trong các thuộc tính của giao diện {{domxref("PerformanceTiming")}} đã lỗi thời. Xem [ví dụ bên dưới](#reserved_names).
- {{jsxref("TypeError")}}: Được ném ra nếu `startTime` là số âm.

## Ví dụ

### Tạo các marker có tên

Ví dụ sau dùng `mark()` để tạo các entry {{domxref("PerformanceMark")}} có tên. Bạn có thể tạo nhiều mark cùng tên. Bạn cũng có thể gán chúng vào biến để có tham chiếu tới đối tượng {{domxref("PerformanceMark")}} đã được tạo.

```js
performance.mark("login-started");
performance.mark("login-started");
performance.mark("login-finished");
performance.mark("form-sent");

const videoMarker = performance.mark("video-loaded");
```

### Tạo marker có chi tiết

Performance mark có thể cấu hình bằng đối tượng `markOptions`, nơi bạn có thể đưa thêm thông tin vào thuộc tính `detail`, và thuộc tính này có thể là bất kỳ kiểu nào.

```js
performance.mark("login-started", {
  detail: "Login started using the login button in the top menu.",
});

performance.mark("login-started", {
  detail: { htmlElement: myElement.id },
});
```

### Tạo marker với thời điểm bắt đầu khác

Dấu thời gian mặc định của phương thức `mark()` là {{domxref("performance.now()")}}. Bạn có thể đặt nó thành thời điểm khác bằng tùy chọn `startTime` trong `markOptions`.

```js
performance.mark("start-checkout", {
  startTime: 20.0,
});

performance.mark("login-button-pressed", {
  startTime: myEvent.timeStamp,
});
```

### DevTools Extensibility API

Với các trình duyệt hỗ trợ [Extensibility API](https://developer.chrome.com/docs/devtools/performance/extension), bạn có thể dùng tham số `detail` để cung cấp thêm thông tin trong một đối tượng `devtools` sẽ được dùng để hiển thị trong performance profile:

```js
// Marker cho biết thời điểm ảnh đã xử lý được tải lên
performance.mark("Image Upload", {
  detail: {
    devtools: {
      dataType: "marker",
      color: "secondary",
      properties: [
        ["Image Size", "2.5MB"],
        ["Upload Destination", "Cloud Storage"],
      ],
      tooltipText: "Processed image uploaded",
    },
  },
});
```

### Tên dành riêng

Lưu ý rằng để duy trì khả năng tương thích ngược, các tên là một phần của giao diện {{domxref("PerformanceTiming")}} đã lỗi thời không thể dùng được. Ví dụ sau sẽ ném lỗi:

```js example-bad
performance.mark("navigationStart");
// SyntaxError: "navigationStart" là một phần của
// giao diện PerformanceTiming,
// và không thể dùng làm tên mark
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
