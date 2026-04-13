---
title: "ReadableByteStreamController: thuộc tính desiredSize"
short-title: desiredSize
slug: Web/API/ReadableByteStreamController/desiredSize
page-type: web-api-instance-property
browser-compat: api.ReadableByteStreamController.desiredSize
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`desiredSize`** của giao diện {{domxref("ReadableByteStreamController")}} trả về số byte cần thiết để lấp đầy hàng đợi nội bộ của stream đến "kích thước mong muốn" của nó.

Giá trị này được stream sử dụng để chỉ ra tốc độ luồng ưu tiên cho nguồn bên dưới.
Các nguồn hỗ trợ điều tiết hoặc tạm dừng luồng dữ liệu đầu vào của chúng (không phải tất cả đều làm được!) nên kiểm soát lượng dữ liệu đầu vào sao cho `desiredSize` của buffer stream được giữ ở giá trị dương và gần bằng không nhất có thể.

`desiredSize` được dùng để áp dụng [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) từ các consumer ở hạ lưu.

## Giá trị

Một số nguyên. Lưu ý rằng giá trị này có thể âm nếu hàng đợi quá đầy.

Giá trị sẽ là `null` nếu stream gặp lỗi và `0` nếu nó đã đóng.

## Ví dụ

Ví dụ [A readable stream with an underlying push source and backpressure support](https://streams.spec.whatwg.org/#example-rs-push-backpressure) trong thông số kỹ thuật cung cấp ví dụ tốt về việc sử dụng `desiredSize` để phát hiện thủ công khi stream đầy và áp dụng backpressure.

Mặc dù ví dụ sử dụng nguồn mặc định, các khái niệm hoàn toàn giống nhau đối với các nguồn byte có thể đọc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableByteStreamController")}}
