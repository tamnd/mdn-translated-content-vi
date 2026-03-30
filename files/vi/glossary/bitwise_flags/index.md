---
title: Bitwise flags
slug: Glossary/Bitwise_flags
page-type: glossary-definition
sidebar: glossarysidebar
---

**Cờ bitwise** (bitwise flags) là các tập hợp biến, thường là các giá trị số đơn giản, có thể được sử dụng để bật hoặc tắt các cách sử dụng hoặc tính năng cụ thể của một phương thức hoặc cấu trúc code khác. Chúng có thể làm điều này nhanh chóng và hiệu quả vì chúng hoạt động ở cấp độ bit. Các cờ liên quan trong cùng một nhóm thường được cung cấp các giá trị bổ sung đại diện cho các vị trí bit khác nhau trong một giá trị duy nhất (ví dụ: thập lục phân), để nhiều cài đặt cờ có thể được biểu diễn bởi một giá trị duy nhất.

Ví dụ, trong {{domxref("WebGPU API", "WebGPU API", "", "nocode")}}, một phiên bản đối tượng {{domxref("GPUBuffer")}} được tạo bằng phương thức {{domxref("GPUDevice.createBuffer()")}}. Khi gọi phương thức này, bạn xác định một thuộc tính `usage` trong bộ mô tả chứa một hoặc nhiều cờ cho phép các cách sử dụng khác nhau của buffer đó.

```js
const descriptor = {
  usage: GPUBufferUsage.COPY_SRC | GPUBufferUsage.MAP_WRITE,
};
```

Các giá trị này được định nghĩa bên trong cùng một không gian tên, và mỗi cái có một giá trị thập lục phân:

| Cờ sử dụng                     | Biểu diễn thập lục phân | Tương đương thập phân |
| ------------------------------ | ----------------------- | --------------------- |
| `GPUBufferUsage.MAP_READ`      | 0x0001                  | 1                     |
| `GPUBufferUsage.MAP_WRITE`     | 0x0002                  | 2                     |
| `GPUBufferUsage.COPY_SRC`      | 0x0004                  | 4                     |
| `GPUBufferUsage.COPY_DST`      | 0x0008                  | 8                     |
| `GPUBufferUsage.INDEX`         | 0x0010                  | 16                    |
| `GPUBufferUsage.VERTEX`        | 0x0020                  | 32                    |
| `GPUBufferUsage.UNIFORM`       | 0x0040                  | 64                    |
| `GPUBufferUsage.STORAGE`       | 0x0080                  | 128                   |
| `GPUBufferUsage.INDIRECT`      | 0x0100                  | 256                   |
| `GPUBufferUsage.QUERY_RESOLVE` | 0x0200                  | 512                   |

Khi bạn truy vấn thuộc tính {{domxref("GPUBuffer.usage")}}, bạn nhận được một số thập phân duy nhất được trả về, đó là tổng của các giá trị thập phân khác nhau cho các cờ sử dụng khác nhau. Quay lại ví dụ trên, truy vấn `GPUBuffer.usage` cho `GPUBuffer` được tạo với cách sử dụng được chỉ định trước đó sẽ trả về như sau:

- Tương đương thập phân của `GPUBufferUsage.COPY_SRC`, 4
- Cộng tương đương thập phân của `GPUBufferUsage.MAP_WRITE`, 2
- Bằng 6.

Vì các giá trị được chọn cho các cờ khác nhau, mỗi tổ hợp giá trị là duy nhất, vì vậy chương trình có thể biết ngay cờ nào được đặt từ một giá trị duy nhất. Ngoài ra, bạn có thể dễ dàng kiểm tra cờ nào được đặt trong giá trị kết hợp bằng toán tử bitwise and:

```js
if (buffer.usage & GPUBufferUsage.MAP_WRITE) {
  // Buffer has MAP_WRITE usage
}
```

## Xem thêm

- [Bitwise Flags are Beautiful, and Here's Why](https://www.hendrik-erz.de/post/bitwise-flags-are-beautiful-and-heres-why)
- [Bitwise operation](https://en.wikipedia.org/wiki/Bitwise_operation) trên Wikipedia
