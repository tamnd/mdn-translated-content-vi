---
title: "ProgressEvent: ProgressEvent() constructor"
short-title: ProgressEvent()
slug: Web/API/ProgressEvent/ProgressEvent
page-type: web-api-constructor
browser-compat: api.ProgressEvent.ProgressEvent
---

{{APIRef("XMLHttpRequest API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`ProgressEvent()`** trả về một đối tượng {{domxref("ProgressEvent")}} mới, đại diện cho mức hoàn thành hiện tại của một quá trình dài.

## Cú pháp

```js-nolint
new ProgressEvent(type)
new ProgressEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt nó thành `loadstart`, `progress`, `abort`, `error`, `load`, `timeout`, hoặc `loadend`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `lengthComputable` {{optional_inline}}
      - : Giá trị boolean cho biết tổng công việc cần thực hiện và lượng công việc đã thực hiện bởi quá trình cơ bản có thể tính toán được hay không. Nói cách khác, nó cho biết tiến trình có thể đo lường hay không. Mặc định là `false`.
    - `loaded` {{optional_inline}}
      - : Một số đại diện cho lượng công việc đã thực hiện bởi quá trình cơ bản. Đối với `ProgressEvent` được trình duyệt gửi trong các tin nhắn HTTP, giá trị đề cập đến kích thước, tính bằng byte, của phần thân tin nhắn, không bao gồm tiêu đề và các chi phí khác. Trong `ProgressEvent` bạn tự tạo, bạn có thể gán bất kỳ giá trị số nào cho `loaded` đại diện cho lượng công việc đã hoàn thành so với giá trị `total`. Mặc định là `0`.
    - `total` {{optional_inline}}
      - : Một số cho biết tổng kích thước dữ liệu đang được truyền hoặc xử lý. Đối với `ProgressEvent` được trình duyệt gửi trong các tin nhắn HTTP, giá trị đề cập đến kích thước, tính bằng byte, của tài nguyên và được lấy từ tiêu đề phản hồi `Content-Length`. Trong `ProgressEvent` bạn tự tạo, bạn có thể muốn chuẩn hóa `total` thành giá trị như `100` hoặc `1` nếu việc tiết lộ số byte chính xác của tài nguyên là điều đáng lo ngại. Nếu sử dụng `1` làm tổng, `loaded` phải là giá trị thập phân giữa `0` và `1`. Mặc định là `0`.

### Giá trị trả về

Một đối tượng {{domxref("ProgressEvent")}} mới.

## Ví dụ

### Tải lên tệp

Ví dụ này cho thấy cách xây dựng `ProgressEvent` bằng hàm khởi tạo. Điều này đặc biệt hữu ích để theo dõi tiến trình của các quá trình như tải lên tệp, tải xuống, hoặc bất kỳ tác vụ chạy lâu nào.

```js
function updateProgress(loaded, total) {
  const progressEvent = new ProgressEvent("progress", {
    lengthComputable: true,
    loaded,
    total,
  });

  document.dispatchEvent(progressEvent);
}

document.addEventListener("progress", (event) => {
  console.log(`Progress: ${event.loaded}/${event.total}`);
});

updateProgress(50, 100);
```

### Sử dụng phân số trong ProgressEvent

Tổng số byte của một tài nguyên có thể tiết lộ quá nhiều thông tin về lượt tải xuống, do đó có thể sử dụng một số từ 0 đến 1 thay thế:

```js
function updateProgress(loaded, total) {
  const progressEvent = new ProgressEvent("progress", {
    lengthComputable: true,
    loaded,
    total,
  });

  document.dispatchEvent(progressEvent);
}

document.addEventListener("progress", (event) => {
  console.log(`Progress: ${event.loaded}/${event.total}`);
});

updateProgress(0.123456, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ProgressEvent")}} mà nó thuộc về.
