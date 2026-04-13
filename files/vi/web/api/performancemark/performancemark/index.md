---
title: "PerformanceMark: hàm khởi tạo PerformanceMark()"
short-title: PerformanceMark()
slug: Web/API/PerformanceMark/PerformanceMark
page-type: web-api-constructor
browser-compat: api.PerformanceMark.PerformanceMark
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`PerformanceMark()`** tạo một {{domxref("DOMHighResTimeStamp","timestamp")}} với tên đã cho.

Khác với {{domxref("Performance.mark","performance.mark()")}}, các performance mark được tạo bởi hàm khởi tạo không được thêm vào timeline hiệu suất của trình duyệt. Điều này có nghĩa là các cuộc gọi đến các phương thức `getEntries*()` của giao diện {{domxref("Performance")}} sẽ không hiển thị các mục nhập cho các mark này.

## Cú pháp

```js-nolint
new PerformanceMark(name)
new PerformanceMark(name, markOptions)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho tên của mark.
- `markOptions` {{optional_inline}}
  - : Một đối tượng để chỉ định timestamp và siêu dữ liệu bổ sung cho mark.
    - `detail` {{optional_inline}}
      - : Siêu dữ liệu tùy ý để bao gồm trong mark. Mặc định là `null`.
        - `devtools` {{optional_inline}} {{experimental_inline}}
          - : Một số trình duyệt sử dụng đối tượng `devtools` có cấu trúc trong đối tượng `detail` như một phần của Extensibility API. Xem [tài liệu Extensibility API của Chrome](https://developer.chrome.com/docs/devtools/performance/extension#inject_your_data_with_the_user_timings_api) để biết thêm thông tin.
    - `startTime` {{optional_inline}}
      - : {{domxref("DOMHighResTimeStamp")}} để sử dụng làm thời gian mark. Mặc định là {{domxref("performance.now()")}}.

### Giá trị trả về

Một đối tượng {{domxref("PerformanceMark")}}.

### Ngoại lệ

- {{jsxref("SyntaxError")}}: Được ném nếu `name` được đặt cho phương thức này đã tồn tại trong giao diện {{domxref("PerformanceTiming")}}.
- {{jsxref("TypeError")}}: Được ném nếu `startTime` là âm.

## Ví dụ

### Tạo các mark có tên

Ví dụ sau cho thấy cách các mục nhập {{domxref("PerformanceMark")}} được xây dựng và sau đó không phải là một phần của timeline hiệu suất của trình duyệt.

```js
new PerformanceMark("squirrel");
new PerformanceMark("monkey");
new PerformanceMark("dog");

const allEntries = performance.getEntriesByType("mark");
console.log(allEntries.length);
// 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.mark","performance.mark()")}}
