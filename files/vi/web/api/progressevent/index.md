---
title: ProgressEvent
slug: Web/API/ProgressEvent
page-type: web-api-interface
browser-compat: api.ProgressEvent
---

{{APIRef("XMLHttpRequest API")}}{{AvailableInWorkers}}

Giao diện **`ProgressEvent`** đại diện cho các sự kiện đo lường tiến trình của một quá trình cơ bản, chẳng hạn như yêu cầu HTTP (ví dụ: `XMLHttpRequest`, hoặc việc tải tài nguyên cơ bản của {{HTMLElement("img")}}, {{HTMLElement("audio")}}, {{HTMLElement("video")}}, {{HTMLElement("style")}} hoặc {{HTMLElement("link")}}).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ProgressEvent.ProgressEvent", "ProgressEvent()")}}
  - : Tạo một sự kiện `ProgressEvent` với các tham số đã cho.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ phần tử cha {{domxref("Event")}}_.

- {{domxref("ProgressEvent.lengthComputable")}} {{ReadOnlyInline}}
  - : Cờ boolean cho biết tỷ lệ giữa kích thước dữ liệu đã được truyền hoặc xử lý (`loaded`) và tổng kích thước dữ liệu (`total`) có thể tính toán được hay không. Nói cách khác, nó cho biết tiến trình có thể đo lường hay không.
- {{domxref("ProgressEvent.loaded")}} {{ReadOnlyInline}}
  - : Một số cho biết kích thước dữ liệu đã được truyền hoặc xử lý. Đối với `ProgressEvent` được trình duyệt gửi trong các tin nhắn HTTP, giá trị đề cập đến kích thước, tính bằng byte, của phần thân tin nhắn, không bao gồm tiêu đề và các chi phí khác. Trong các tin nhắn nén có tổng kích thước không xác định, `loaded` có thể đề cập đến kích thước dữ liệu đã nén hoặc chưa nén, tùy thuộc vào trình duyệt. Tính đến năm 2024, nó chứa kích thước dữ liệu đã nén trong Firefox và dữ liệu chưa nén trong Chrome. Trong `ProgressEvent` bạn tự tạo, bạn có thể gán bất kỳ giá trị số nào cho `loaded` đại diện cho lượng công việc đã hoàn thành so với giá trị `total`.
- {{domxref("ProgressEvent.total")}} {{ReadOnlyInline}}
  - : Một số cho biết tổng kích thước dữ liệu đang được truyền hoặc xử lý. Đối với `ProgressEvent` được trình duyệt gửi trong các tin nhắn HTTP, giá trị đề cập đến kích thước, tính bằng byte, của tài nguyên và được lấy từ tiêu đề `Content-Length`. Trong `ProgressEvent` bạn tự tạo, bạn có thể muốn chuẩn hóa `total` thành giá trị như `100` hoặc `1` nếu việc tiết lộ số byte chính xác của tài nguyên là điều đáng lo ngại. Nếu sử dụng `1` làm tổng, `loaded` sẽ là giá trị thập phân giữa `0` và `1`.

## Phương thức phiên bản

_Kế thừa các phương thức từ phần tử cha, {{domxref("Event")}}._

## Ví dụ

### Hiển thị trạng thái của một yêu cầu

Ví dụ sau thêm `ProgressEvent` vào một {{domxref("XMLHttpRequest")}} mới và sử dụng nó để hiển thị trạng thái của yêu cầu.

```js
const progressBar = document.getElementById("p"),
  client = new XMLHttpRequest();
client.open("GET", "magical-unicorns");
client.onprogress = (pe) => {
  if (pe.lengthComputable) {
    progressBar.max = pe.total;
    progressBar.value = pe.loaded;
  }
};
client.onloadend = (pe) => {
  progressBar.value = pe.loaded;
};
client.send();
```

### Sử dụng phân số trong ProgressEvent

Tổng số byte của một tài nguyên có thể tiết lộ quá nhiều thông tin, do đó có thể sử dụng một số từ 0 đến 1 trong {{domxref("ProgressEvent.ProgressEvent", "ProgressEvent()")}} thay thế:

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

- Giao diện cơ bản {{domxref("Event")}}.
