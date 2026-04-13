---
title: NetworkInformation
slug: Web/API/NetworkInformation
page-type: web-api-interface
browser-compat: api.NetworkInformation
---

{{APIRef("Network Information API")}} {{AvailableInWorkers}}

Giao diện **`NetworkInformation`** của [Network Information API](/en-US/docs/Web/API/Network_Information_API) cung cấp thông tin về kết nối mà thiết bị đang sử dụng để liên lạc với mạng, đồng thời cung cấp cơ chế để các đoạn script nhận thông báo khi loại kết nối thay đổi.
Giao diện `NetworkInformation` không thể được khởi tạo trực tiếp. Thay vào đó, nó được truy cập thông qua thuộc tính `connection` của giao diện {{domxref("Navigator")}} hoặc giao diện {{domxref("WorkerNavigator")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của lớp cha {{domxref("EventTarget")}}._

- {{domxref("NetworkInformation.downlink")}} {{ReadOnlyInline}}
  - : Trả về ước tính băng thông hiệu dụng tính bằng megabit mỗi giây, làm tròn đến bội số gần nhất của 25 kilobit mỗi giây.
- {{domxref("NetworkInformation.downlinkMax")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tốc độ tải xuống tối đa, tính bằng megabit mỗi giây (Mbps), của công nghệ kết nối bên dưới.
- {{domxref("NetworkInformation.effectiveType")}} {{ReadOnlyInline}}
  - : Trả về loại kết nối hiệu dụng, là một trong các giá trị: `'slow-2g'`, `'2g'`, `'3g'` hoặc `'4g'`. Giá trị này được xác định dựa trên tổ hợp thời gian khứ hồi và băng thông tải xuống quan sát gần đây.
- {{domxref("NetworkInformation.rtt")}} {{ReadOnlyInline}}
  - : Trả về ước tính thời gian khứ hồi hiệu dụng của kết nối hiện tại, làm tròn đến bội số gần nhất của 25 mili giây.
- {{domxref("NetworkInformation.saveData")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu người dùng đã bật tùy chọn giảm lưu lượng dữ liệu trên tác nhân người dùng.
- {{domxref("NetworkInformation.type")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về loại kết nối mà thiết bị đang sử dụng để liên lạc với mạng. Giá trị sẽ là một trong các giá trị sau:
    - `bluetooth`
    - `cellular`
    - `ethernet`
    - `none`
    - `wifi`
    - `wimax`
    - `other`
    - `unknown`

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức của lớp cha {{domxref("EventTarget")}}._

## Sự kiện

- {{domxref("NetworkInformation.change_event", "change")}}
  - : Sự kiện được kích hoạt khi thông tin kết nối thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện trực tuyến và ngoại tuyến](/en-US/docs/Web/API/Navigator/onLine)
