---
title: PeriodicWave
slug: Web/API/PeriodicWave
page-type: web-api-interface
browser-compat: api.PeriodicWave
---

{{ APIRef("Web Audio API") }}

Giao diện **`PeriodicWave`** xác định dạng sóng tuần hoàn có thể được sử dụng để định hình đầu ra của một {{domxref("OscillatorNode")}}.

`PeriodicWave` không có đầu vào hay đầu ra; nó được sử dụng để xác định các bộ dao động tùy chỉnh khi gọi {{domxref("OscillatorNode.setPeriodicWave()")}}. Bản thân `PeriodicWave` được tạo/trả về bởi {{domxref("BaseAudioContext.createPeriodicWave")}}.

## Hàm khởi tạo

- {{domxref("PeriodicWave.PeriodicWave", "PeriodicWave()")}}
  - : Tạo một phiên bản đối tượng `PeriodicWave` mới sử dụng các giá trị mặc định cho tất cả các thuộc tính. Nếu bạn muốn thiết lập các giá trị thuộc tính tùy chỉnh ngay từ đầu, hãy sử dụng phương thức factory {{domxref("BaseAudioContext.createPeriodicWave")}} thay thế.

## Thuộc tính phiên bản

Không có; cũng không có, `PeriodicWave` không kế thừa bất kỳ thuộc tính nào.

## Phương thức phiên bản

Không có; cũng không có, `PeriodicWave` không kế thừa bất kỳ phương thức nào.

## Ví dụ

Xem {{domxref("BaseAudioContext.createPeriodicWave")}} để có mã ví dụ đơn giản cho thấy cách tạo một đối tượng `PeriodicWave` chứa một sóng sin đơn giản.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
