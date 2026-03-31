---
title: Server-Timing header
short-title: Server-Timing
slug: Web/HTTP/Reference/Headers/Server-Timing
page-type: http-header
browser-compat: http.headers.Server-Timing
sidebar: http
---

Tiêu đề HTTP **`Server-Timing`** {{Glossary("response header")}} truyền đạt một hoặc nhiều số liệu hiệu suất về chu trình yêu cầu-phản hồi cho tác nhân người dùng.
Nó được sử dụng để hiển thị các số liệu thời gian máy chủ backend (ví dụ: đọc/ghi cơ sở dữ liệu, thời gian CPU, truy cập hệ thống tệp, v.v.) trong công cụ phát triển trong trình duyệt của người dùng hoặc trong giao diện {{domxref("PerformanceServerTiming")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
// A single metric
Server-Timing: <timing-metric>

// Multiple metrics as a comma-separated list
Server-Timing: <timing-metric>, …, <timing-metricN>
```

`<timing-metric>` có tên, và có thể bao gồm thời lượng tùy chọn và mô tả tùy chọn.
Ví dụ:

```http
// A metric with a name only
Server-Timing: missedCache

// A metric with a duration
Server-Timing: cpu;dur=2.4

// A metric with a description and duration
Server-Timing: cache;desc="Cache Read";dur=23.2

// Two metrics with duration values
Server-Timing: db;dur=53, app;dur=47.2
```

## Chỉ thị

- `<timing-metric>`
  - : Danh sách phân cách bằng dấu phẩy của một hoặc nhiều số liệu với các thành phần sau được phân cách bằng dấu chấm phẩy:
    - `<name>`
      - : Token tên (không có khoảng trắng hoặc ký tự đặc biệt) cho số liệu, cụ thể theo cách triển khai hoặc do máy chủ xác định, như `cacheHit`.
    - `<duration>` {{optional_inline}}
      - : Thời lượng dưới dạng chuỗi `dur`, theo sau là `=`, theo sau là giá trị, như `dur=23.2`.
    - `<description>` {{optional_inline}}
      - : Mô tả dưới dạng chuỗi `desc`, theo sau là `=`, theo sau là giá trị dưới dạng token hoặc chuỗi trích dẫn, như `desc=prod` hoặc `desc="DB lookup"`.

Tên và mô tả nên được giữ càng ngắn càng tốt (ví dụ: sử dụng viết tắt và bỏ qua các giá trị tùy chọn) để giảm thiểu chi phí dữ liệu HTTP.

## Mô tả

### Quyền riêng tư và bảo mật

Tiêu đề `Server-Timing` có thể tiết lộ thông tin ứng dụng và cơ sở hạ tầng nhạy cảm tiềm ẩn.
Quyết định số liệu nào cần gửi, khi nào cần gửi và ai nên xem chúng dựa trên trường hợp sử dụng.
Ví dụ: bạn có thể quyết định chỉ hiển thị số liệu cho người dùng đã xác thực và không có gì trong các phản hồi công khai.

### Giao diện PerformanceServerTiming

Ngoài việc có các số liệu tiêu đề `Server-Timing` xuất hiện trong công cụ phát triển của trình duyệt, giao diện {{domxref("PerformanceServerTiming")}} cho phép công cụ tự động thu thập và xử lý số liệu từ JavaScript. Giao diện này bị hạn chế đối với cùng nguồn gốc, nhưng bạn có thể sử dụng tiêu đề {{HTTPHeader("Timing-Allow-Origin")}} để chỉ định các tên miền được phép truy cập số liệu máy chủ. Giao diện chỉ có sẵn trong các ngữ cảnh bảo mật (HTTPS) trong một số trình duyệt.

Các thành phần của tiêu đề `Server-Timing` ánh xạ đến các thuộc tính {{domxref("PerformanceServerTiming")}} như sau:

- `"name"` -> {{domxref("PerformanceServerTiming.name")}}
- `"dur"` -> {{domxref("PerformanceServerTiming.duration")}}
- `"desc"` -> {{domxref("PerformanceServerTiming.description")}}

## Ví dụ

### Gửi số liệu bằng tiêu đề Server-Timing

Phản hồi sau bao gồm số liệu `custom-metric` với thời lượng `123.45` milliseconds và mô tả "My custom metric":

```http
Server-Timing: custom-metric;dur=123.45;desc="My custom metric"
```

### Server-Timing dưới dạng HTTP trailer

Trong phản hồi sau, tiêu đề {{HTTPHeader("Trailer")}} được sử dụng để cho biết rằng tiêu đề `Server-Timing` sẽ theo sau phần thân phản hồi.
Số liệu `custom-metric` với thời lượng `123.4` milliseconds được gửi.

```http
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Trailer: Server-Timing

--- response body ---
Server-Timing: custom-metric;dur=123.4
```

> [!WARNING]
> Chỉ DevTools của trình duyệt mới có thể sử dụng tiêu đề `Server-Timing` dưới dạng HTTP trailer để hiển thị thông tin trong tab Network -> Timings.
> Fetch API không thể truy cập HTTP trailers.
> Xem [Tương thích trình duyệt](#browser_compatibility) để biết thêm thông tin.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceServerTiming")}}
- Tiêu đề {{HTTPHeader("Trailer")}}
