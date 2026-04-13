---
title: PerformanceNavigation
slug: Web/API/PerformanceNavigation
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.PerformanceNavigation
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

Giao diện **`PerformanceNavigation`** đã lỗi thời đại diện cho thông tin về cách điều hướng đến tài liệu hiện tại được thực hiện.

> [!WARNING]
> Giao diện này đã lỗi thời trong [Thông số kỹ thuật Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

Một đối tượng thuộc loại này có thể được lấy bằng cách gọi thuộc tính chỉ đọc {{domxref("Performance.navigation")}}.

## Thuộc tính phiên bản

_Giao diện `PerformanceNavigation` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("PerformanceNavigation.type")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Một `unsigned short` cho biết cách điều hướng đến trang này được thực hiện. Các giá trị có thể là:
    - `TYPE_NAVIGATE` (0)
      - : Trang được truy cập bằng cách nhấp vào liên kết, dấu trang, gửi biểu mẫu, hoặc script, hoặc nhập URL vào thanh địa chỉ.
    - `TYPE_RELOAD` (1)
      - : Trang được truy cập bằng cách nhấp vào nút Tải lại hoặc thông qua phương thức {{domxref("Location.reload()")}}.
    - `TYPE_BACK_FORWARD` (2)
      - : Trang được truy cập bằng cách điều hướng vào lịch sử.
    - `TYPE_RESERVED` (255)
      - : Bất kỳ cách nào khác.

- {{domxref("PerformanceNavigation.redirectCount")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Một `unsigned short` đại diện cho số lần REDIRECT được thực hiện trước khi đến trang.

## Phương thức phiên bản

_Giao diện `Performance` không kế thừa bất kỳ phương thức nào._

- {{domxref("PerformanceNavigation.toJSON()")}} {{deprecated_inline}}
  - : Một {{Glossary("Serialization","bộ tuần tự hóa")}} trả về đối tượng JSON đại diện cho đối tượng `PerformanceNavigation`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance")}} cho phép truy cập một đối tượng thuộc loại này.
- {{domxref("PerformanceNavigationTiming")}} (một phần của Navigation Timing Level 2) đã thay thế API này.
